`include "uvm_macros.svh"
import uvm_pkg::*;

interface ram_if(input logic clk);
    logic [7:0]  addr;
    logic        write;
    logic [15:0] wdata;
    logic [15:0] rdata;

    clocking drv_cb @(posedge clk);
        default input #1step output #0;
        output addr;
        output write;
        output wdata;
    endclocking

    clocking mon_cb @(posedge clk);
        default input #1step;
        input addr;
        input write;
        input wdata;
        input rdata;
    endclocking
endinterface

class ram_seq_item extends uvm_sequence_item;
    rand logic [ 7:0] addr;
    rand bit          write;
    rand logic [15:0] wdata;
    logic      [15:0] rdata;

    `uvm_object_utils_begin(ram_seq_item)
    `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_field_int(write, UVM_ALL_ON)
    `uvm_field_int(wdata, UVM_ALL_ON)
    `uvm_field_int(rdata, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "ram_seq_item");
        super.new(name);
    endfunction

    function string convert2string();
        return $sformatf("addr=%0h write=%0b wdata=%0h rdata=%0h", addr, write, wdata, rdata);
    endfunction
endclass

class ram_write_seq extends uvm_sequence#(ram_seq_item); `uvm_object_utils(ram_write_seq)

    rand logic [ 7:0] req_addr;
    rand logic [15:0] req_wdata;

    function new(string name = "ram_write_seq");
        super.new(name);
    endfunction

    virtual task body();
        ram_seq_item item;
        item = ram_seq_item::type_id::create("item");

        start_item(item);
        if (!item.randomize() with {
            write == 1;
            addr == req_addr;
            wdata == req_wdata;})
        `uvm_fatal(get_type_name(), "Randomization failed")
        finish_item(item);

        `uvm_info(get_type_name(), item.convert2string(), UVM_MEDIUM)
    endtask
endclass

class ram_read_seq extends uvm_sequence#(ram_seq_item);
    `uvm_object_utils(ram_read_seq)

    rand logic [ 7:0] req_addr;

    function new(string name = "ram_read_seq");
        super.new(name);
    endfunction

    virtual task body();
        ram_seq_item item;
        item = ram_seq_item::type_id::create("item");

        start_item(item);
        if (!item.randomize() with {
            write == 0;
            addr == req_addr;
            wdata == 0;})
        `uvm_fatal(get_type_name(), "Randomization failed")
        finish_item(item);

        `uvm_info(get_type_name(), item.convert2string() ,UVM_MEDIUM)
    endtask
endclass

class ram_master_seq extends uvm_sequence#(ram_seq_item);
    `uvm_object_utils(ram_master_seq)

    function new(string name = "ram_master_seq");
        super.new(name);
    endfunction

    virtual task body ();
        ram_write_seq w_seq;
        ram_read_seq r_seq;

        `uvm_info(get_type_name(), "===== RAM (Write -> Read) Test Start! =====", UVM_MEDIUM)
        repeat(70000) begin
            w_seq = ram_write_seq::type_id::create("w_seq");
            r_seq = ram_read_seq::type_id::create("r_seq");

            if (!w_seq.randomize()) `uvm_fatal(get_type_name(), "w_seq Randomization failed..")
            w_seq.start(m_sequencer);
            r_seq.req_addr = w_seq.req_addr;
            r_seq.start(m_sequencer);
        end

        `uvm_info(get_type_name(), "===== Master Sequence done =====", UVM_MEDIUM)
    endtask
endclass

class ram_driver extends uvm_driver#(ram_seq_item);
    `uvm_component_utils(ram_driver)
    virtual ram_if r_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual ram_if)::get(this, "", "r_if", r_if))
            `uvm_fatal(get_type_name(), "can not find r_if!!")
        `uvm_info(get_type_name(), "build_phase completed", UVM_HIGH)
    endfunction

    virtual task drive_item(ram_seq_item item);
        @(r_if.drv_cb);
        r_if.drv_cb.addr  <= item.addr;
        r_if.drv_cb.write <= item.write;
        if(item.write == 1) begin
            r_if.drv_cb.wdata <= item.wdata;
            `uvm_info(get_type_name(),
                $sformatf("Driving Write: addr = %0h, wdata = %0h", item.addr, item.wdata), UVM_HIGH)
        end else begin
            r_if.drv_cb.wdata <= 16'hzzzz;
            `uvm_info(get_type_name(),
                $sformatf("Driving Read: addr = %0h", item.addr), UVM_HIGH)
        end
    endtask

    virtual task run_phase(uvm_phase phase);
        ram_seq_item item;
        forever begin
            seq_item_port.get_next_item(item);
            drive_item(item);
            seq_item_port.item_done();

            repeat(2) @(r_if.drv_cb);
        end
    endtask
endclass

class ram_monitor extends uvm_monitor;
    `uvm_component_utils(ram_monitor);
    virtual ram_if r_if;
    uvm_analysis_port #(ram_seq_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual ram_if)::get(this, "", "r_if", r_if))
            `uvm_fatal(get_type_name(), "can not find r_if!!")
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            ram_seq_item item = ram_seq_item::type_id::create("item");
            @(r_if.mon_cb);
            item.write = r_if.mon_cb.write;
            item.addr  = r_if.mon_cb.addr;
            item.wdata = r_if.mon_cb.wdata;
            if (!item.write) begin
                @(r_if.mon_cb);
                item.rdata = r_if.mon_cb.rdata;
            end
            `uvm_info(get_type_name(), item.convert2string(), UVM_MEDIUM)
            ap.write(item);
        end
    endtask
endclass

class ram_coverage extends uvm_subscriber#(ram_seq_item);
    `uvm_component_utils(ram_coverage)

    ram_seq_item item;

    covergroup ram_cg;
        cp_addr: coverpoint item.addr {
            bins zero = {8'h00};
            bins low[4]  = {[8'h01:8'h10]};
            bins high[4] = {[8'h11:8'hfe]};
            bins max  = {8'hff};}
        cp_write: coverpoint item.write {bins on = {1}; bins off = {0};}
        cp_wdata: coverpoint item.wdata iff (item.write == 1'b1) {
            bins zero = {16'h0000};
            bins low[4] = {[16'h0001:16'h7fff]};
            bins high[4] = {[16'h8000:16'hfffe]};
            bins max  = {16'hffff};}
        cp_rdata: coverpoint item.rdata iff (item.write == 1'b0) {
            bins zero = {16'h0000};
            bins low[4]  = {[16'h0001:16'h7fff]};
            bins high[4] = {[16'h8000:16'hfffe]};
            bins max  = {16'hffff};}
        // cross coverage
        cx_addr_write:  cross cp_addr, cp_write;
        cx_addr_wdata:  cross cp_addr, cp_wdata;
    endgroup

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ram_cg = new();
    endfunction

    virtual function void write(ram_seq_item t);
        item = t;
        ram_cg.sample();
        `uvm_info(get_type_name(),
            $sformatf("ram_cg sampled: %s", item.convert2string()), UVM_MEDIUM)
    endfunction

    virtual function void report_phase(uvm_phase phase);
        `uvm_info(get_type_name(), " \n\n===== Coverage Summary =====", UVM_LOW);
        `uvm_info(get_type_name(),
            $sformatf("     Overall: %.1f%%", ram_cg.get_coverage()), UVM_LOW);
        `uvm_info(get_type_name(),
            $sformatf("     addr   : %.1f%%", ram_cg.cp_addr.get_coverage()), UVM_LOW);
        `uvm_info(get_type_name(),
            $sformatf("     write  : %.1f%%", ram_cg.cp_write.get_coverage()), UVM_LOW);
        `uvm_info(get_type_name(),
            $sformatf("     wdata  : %.1f%%", ram_cg.cp_wdata.get_coverage()), UVM_LOW);
        `uvm_info(get_type_name(),
            $sformatf("     rdata  : %.1f%%", ram_cg.cp_rdata.get_coverage()), UVM_LOW);
        `uvm_info(get_type_name(),
            $sformatf("     cross(addr, write)   : %.1f%%", ram_cg.cx_addr_write.get_coverage()), UVM_LOW);
        `uvm_info(get_type_name(),
            $sformatf("     cross(addr, wdata)   : %.1f%%", ram_cg.cx_addr_wdata.get_coverage()), UVM_LOW);
        `uvm_info(get_type_name(), "\n===== Coverage Summary =====\n\n", UVM_LOW);
    endfunction
endclass

class ram_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(ram_scoreboard);
    uvm_analysis_imp #(ram_seq_item, ram_scoreboard) ap_imp;

    logic [15:0] exp_data[logic [7:0]];
    int error_cnt;
    int match_cnt;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap_imp = new("ap_imp", this);
        error_cnt = 0;
        match_cnt = 0;
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    virtual function void write(ram_seq_item item);
        `uvm_info(get_type_name(), $sformatf("Received: %s", item.convert2string()), UVM_MEDIUM)

        if (item.write === 1'b1) begin
            exp_data[item.addr] = item.wdata;            
            `uvm_info(get_type_name(),
                $sformatf("[WRITE/RECORD] addr = %0h, data = %0h saved.", item.addr, item.wdata), UVM_LOW) 
        end 
        else if (item.write === 1'b0) begin
            if (exp_data.exists(item.addr)) begin
                if (item.rdata === exp_data[item.addr]) begin
                    `uvm_info(get_type_name(),
                        $sformatf("[READ/PASS] addr = %0h | Exp = %0h, Act = %0h",
                            item.addr, exp_data[item.addr], item.rdata), UVM_LOW)
                    match_cnt++;
                end else begin
                    `uvm_info(get_type_name(),
                        $sformatf("[READ/FAIL] addr = %0h | Exp = %0h, Act = %0h",
                            item.addr, exp_data[item.addr], item.rdata), UVM_LOW)
                    error_cnt++;
                end
            end else begin
                `uvm_warning(get_type_name(),
                    $sformatf("[WARNING] Reading incorrect Addr(%0h)!! Act rdata=%0h", item.addr, item.rdata))
            end
        end
    endfunction

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info(get_type_name(), "===== Scoreboard Summary ===== ", UVM_LOW)
        `uvm_info(get_type_name(), $sformatf("Total transactions: %0d",
            match_cnt + error_cnt), UVM_LOW)
        `uvm_info(get_type_name(), $sformatf("Matches: %0d", match_cnt), UVM_LOW)
        `uvm_info(get_type_name(), $sformatf("Error: %0d", error_cnt), UVM_LOW)

        if (error_cnt > 0) begin
            `uvm_error(get_type_name(),
                $sformatf("TEST FAILED: %0d mismatches detected!", error_cnt))
        end else begin
            `uvm_info(get_type_name(),
                $sformatf("TEST PASSED: %0d all matches detected!", match_cnt), UVM_LOW)
        end
    endfunction
endclass

class ram_agent extends uvm_agent;
    `uvm_component_utils(ram_agent)

    uvm_sequencer#(ram_seq_item) sqr;
    ram_driver                   drv;
    ram_monitor                  mon;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sqr = uvm_sequencer#(ram_seq_item)::type_id::create("sqr", this);
        `uvm_info(get_type_name(), "sqr create", UVM_DEBUG)
        drv = ram_driver::type_id::create("drv", this);
        `uvm_info(get_type_name(), "drv create", UVM_DEBUG)
        mon = ram_monitor::type_id::create("mon", this);
        `uvm_info(get_type_name(), "mon create", UVM_DEBUG)
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction
endclass

class ram_environment extends uvm_env;
    `uvm_component_utils(ram_environment)

    ram_agent      agt;
    ram_scoreboard scb;
    ram_coverage   cov;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agt = ram_agent::type_id::create("agt", this);
        scb = ram_scoreboard::type_id::create("scb", this);
        cov = ram_coverage::type_id::create("cov", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agt.mon.ap.connect(scb.ap_imp);
        agt.mon.ap.connect(cov.analysis_export);
    endfunction
endclass

class ram_test extends uvm_test;
    `uvm_component_utils(ram_test)

    ram_environment env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = ram_environment::type_id::create("env", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        ram_master_seq seq;

        phase.raise_objection(this);
        seq = ram_master_seq::type_id::create("seq");
        seq.start(env.agt.sqr);
        #50;
        phase.drop_objection(this);
    endtask

    virtual function void report_phase(uvm_phase phase);
        uvm_report_server svr = uvm_report_server::get_server();
        if (svr.get_severity_count(UVM_ERROR) == 0) begin
            `uvm_info(get_type_name(), "===== TEST PASS ! =====", UVM_LOW)
        end else begin
            `uvm_info(get_type_name(), "===== TEST FAIL ! =====", UVM_LOW)
        end
        uvm_top.print_topology();
    endfunction
endclass

module tb_ram ();
    logic clk;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    ram_if r_if(clk);

    ram dut (
        .clk  (clk),
        .addr (r_if.addr),
        .write(r_if.write),
        .wdata(r_if.wdata),
        .rdata(r_if.rdata)
    );

    initial begin
        uvm_config_db#(virtual ram_if)::set(null, "*", "r_if", r_if);
        run_test();
    end

    initial begin
        $fsdbDumpfile("novas.fsdb");
        $fsdbDumpvars(0, tb_ram, "+all");
    end
endmodule

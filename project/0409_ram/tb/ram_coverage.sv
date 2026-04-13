`ifndef COMPONENT_SV
    `define COMPONENT_SV

    `include "uvm_macros.svh"
    import uvm_pkg::*;
    `include "ram_seq_item.sv"

    class ram_coverage extends uvm_subscriber#(ram_seq_item);
        `uvm_component_utils(ram_coverage)

        ram_seq_item item;

        covergroup ram_cg;
            cp_addr: coverpoint item.addr {
                bins zero    = {8'h00};
                bins low[4]  = {[8'h01:8'h10]};
                bins high[4] = {[8'h11:8'hfe]};
                bins max     = {8'hff};}
            cp_wr: coverpoint item.wr {
                bins on      = {1};
                bins off     = {0};}
            cp_wdata: coverpoint item.wdata iff (item.wr == 1'b1) {
                bins zero    = {16'h0000};
                bins low[4]  = {[16'h0001:16'h7fff]};
                bins high[4] = {[16'h8000:16'hfffe]};
                bins max     = {16'hffff};}
            cp_rdata: coverpoint item.rdata iff (item.wr == 1'b0) {
                bins zero    = {16'h0000};
                bins low[4]  = {[16'h0001:16'h7fff]};
                bins high[4] = {[16'h8000:16'hfffe]};
                bins max     = {16'hffff};}
            // cross coverage
            cx_addr_wr:  cross cp_addr, cp_wr;
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
            `uvm_info(get_type_name(), " \n\n===== Coverage Summary =====", UVM_LOW)
            `uvm_info(get_type_name(),
                $sformatf("     Overall: %.1f%%", ram_cg.get_coverage()), UVM_LOW)
            `uvm_info(get_type_name(),
                $sformatf("     addr   : %.1f%%", ram_cg.cp_addr.get_coverage()), UVM_LOW)
            `uvm_info(get_type_name(),
                $sformatf("     wr     : %.1f%%", ram_cg.cp_wr.get_coverage()), UVM_LOW)
            `uvm_info(get_type_name(),
                $sformatf("     wdata  : %.1f%%", ram_cg.cp_wdata.get_coverage()), UVM_LOW)
            `uvm_info(get_type_name(),
                $sformatf("     rdata  : %.1f%%", ram_cg.cp_rdata.get_coverage()), UVM_LOW)
            `uvm_info(get_type_name(),
                $sformatf("     cross(addr, wr)   : %.1f%%",
                    ram_cg.cx_addr_wr.get_coverage()), UVM_LOW)
            `uvm_info(get_type_name(),
                $sformatf("     cross(addr, wdata)   : %.1f%%",
                    ram_cg.cx_addr_wdata.get_coverage()), UVM_LOW)
            `uvm_info(get_type_name(), "\n===== Coverage Summary =====\n\n", UVM_LOW)
        endfunction
    endclass
`endif

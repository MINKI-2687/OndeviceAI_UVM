`include "uvm_macros.svh"
import uvm_pkg::*;

interface ram_if(input logic clk);
    logic [7:0]  addr;
    logic        write;
    logic [15:0] wdata;
    logic [15:0] rdata;
endinterface

class ram_seq_item extends uvm_sequence_item;
    rand logic [ 7:0] addr;
    rand bit          write;
    rand logic [15:0] wdata;
    logic      [15:0] rdata;

    constraint c_addr {addr inside {[1:20]};}

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

class ram_write_seq extends uvm_sequence#(ram_seq_item);
    `uvm_object_utils(ram_write_seq)

    function new(string name = "ram_write_seq");
        super.new(name);
    endfunction

    virtual task body();
        ram_seq_item item;
        item = ram_seq_item::type_id::create("item");

        start_item(item);
        item.write = 1;
        finish_item(item);

        `uvm_info(get_type_name(), "Write Done!", UVM_MEDIUM)
    endtask
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
        uvm_config_db#(virtual ram_if)::set(null, "*", "c_if", c_if);
        run_test();
    end

endmodule

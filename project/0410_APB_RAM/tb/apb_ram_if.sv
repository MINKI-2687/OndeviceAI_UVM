interface apb_if (input logic pclk, input logic presetn);
    logic [ 7:0] paddr;
    logic        pwrite;
    logic        penable;
    logic        psel;
    logic [31:0] pwdata;
    logic [31:0] prdata;
    logic        pready; 

    clocking drv_cb @(posedge pclk);
        default input #1step output #0;
        output paddr;
        output pwrite;
        output penable;
        output psel;
        output pwdata;
        input  prdata;
        input  pready; 
    endclocking

    clocking mon_cb @(posedge pclk);
        default input #1step;
        input paddr;
        input pwrite;
        input penable;
        input psel;
        input pwdata;
        input prdata;
        input pready; 
    endclocking

    modport mod_drv(clocking drv_cb, input pclk, input presetn);
        modport mod_mon(clocking mon_cb, input pclk, input presetn);
endinterface

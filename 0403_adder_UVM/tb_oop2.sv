class weapon;
    string name;
    function new(string name);
        this.name = name;
    endfunction 

    virtual function void shot();
        $display("[%s] ... (no sound)", name);
    endfunction
endclass

class M16 extends weapon;
    function new(string name);
        super.new(name);
    endfunction 

    virtual function void shot(); 
        $display("[%s] tang-tang!", name);
    endfunction
endclass

class K2 extends weapon;
    function new(string name);
        super.new(name);
    endfunction 

    virtual function void shot(); 
        $display("[%s] bang-bang!", name);
    endfunction
endclass

class AUG extends weapon;
    function new(string name);
        super.new(name);
    endfunction 

    virtual function void shot(); 
        $display("[%s] tong-tong!", name);
    endfunction
endclass

module tb_oop();
    initial begin
        weapon BlackPink = new("nothing");
        weapon gun = new("rock");
        M16 m16 = new("M16");
        AUG aug = new("AUG");
        K2  k2  = new("K2");

        $display("==== polymorphism demo ====");
        BlackPink.shot();
        $display("==== change weapon M16 ====");
        BlackPink = m16;
        BlackPink.shot();
        $display("==== change weapon AUG ====");
        BlackPink = aug;
        BlackPink.shot();
        $display("==== change weapon K2 ====");
        BlackPink = k2;
        BlackPink.shot();
    end
endmodule

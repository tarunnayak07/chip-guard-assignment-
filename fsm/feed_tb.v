module feed_tb;
reg [4:0]dataA,dataB,dataC;
reg clk,ready,reset,start;
wire  [4:0]out;
wire  valid,done;
feed uut(.dataA(dataA),.dataB(dataB),.dataC(dataC),.clk(clk),.ready(ready),.reset(reset),.start(start),.out(out),.valid(valid),.done(done));
always #5 clk=~clk;
initial begin
    $dumpfile("feed.vcd"); // Name of the file you want to create
    $dumpvars(0, feed_tb);
    dataA=10;dataB=11;dataC=12;
    reset=1;ready=0;clk=0;
    #6reset=0;
    #6;start=1;
    #6;ready=1;start=0;
    #15;ready=0;
    #20;ready=1;
    #30;start=1;
    #20;reset=1;
    #10;$finish;
end
endmodule
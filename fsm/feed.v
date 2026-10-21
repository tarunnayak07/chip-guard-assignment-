module feed(dataA,dataB,dataC,valid,ready,start,done,out,clk,reset);
input [4:0]dataA,dataB,dataC;
input clk,ready,reset,start;
output reg [4:0]out;
output reg valid,done;
reg[2:0]state,nstate;
always@(posedge clk) begin
    if(reset)begin
        valid<=0;
        done<=0;
        state<=0;
        out<=0;
    end
    else begin
    state<=nstate;
    end

end
always@(*)begin
    case(state)
    0:begin done=0 ;if(start) nstate=1; end
    1:begin out=dataA; valid =1; if(ready) nstate=2 ;else nstate=1 ;end
    2:begin out=dataB; valid =1; if(ready) nstate=3 ; else nstate=2; end
    3:begin out=dataC; valid =1; if(ready) nstate=4 ;else  nstate=3; end
    4:begin nstate=0;valid=0;done=1;out=0; end
    endcase
end
endmodule
module DSP48A1 #(
    parameter A0REG=0,//control signal of level one of input A.
    parameter A1REG=1,//control signal of level two of input A.
    parameter B0REG=0,//control signal of level one of input B.
    parameter B1REG=1,//control signal of level two of input B.
    parameter CREG=1,//control signal of level one of input C.
    parameter DREG=1,//control signal of level one of input D.
    parameter MREG=1,//control signal of level three of signal M.
    parameter PREG=1,//control signal of level five of output P.
    parameter CARRYINREG=1,//control signal of level three of carry_in (CYI).
    parameter CARRYOUTREG=1,//control signal of level four of carry_out (CYO).
    parameter OPMODEREG=1,//control signal of all reg of opmode bits.
    parameter CARRYINSEL="OPMODE5",//control signal of CYI to select if choose opmode5 or carryin.
    parameter B_INPUT="DIRECT",//control signal to select which to pass Bor BCIN.
    parameter RSTTYPE="SYNC"//control signal to select the type of the resets to be synchrouns or asynchronous.
)();
    reg  clk,cin,rsta,rstb,rstm,rstp,rstc,rstd,rstcin,rstopmode,cea,ceb,cem,cep,cec,ced,cecin,ceopmode;
    reg  [17:0] A,B,D,BCIN;
    reg  [47:0]C;//reg C.
    reg  [7:0]opmode;//control signals.
    reg  [47:0]PCIN;//cascade reg for port p.
    wire  CARRYOUT;//carry out of the post add/sub. 
    wire  CARRYOUTF;//the copy of the carry out signal.
    wire  [17:0]BCOUT;//cascade wire for port B.
    wire  [47:0]PCOUT;//cascade wire for port p. 
    wire  [47:0]P;//wire P.
    wire  [35:0]M; // wire signal.
    
    initial begin
        clk=0;
        forever begin
            #1;
            clk=~clk;
        end
        initial begin
         /////////////////////////////////////////////////
            cea=1;ceb=1;cem=1;cep=1;cec=1;ced=1;cecin=1;ceopmode=1;
            cin=0;PCIN=0;opmode=0;C=0;A=0;B=0;D=0;BCIN=0;
        //////////////////////////////////////////////////    
            rsta=1;
            rstb=1;
            rstm=1;
            rstp=1;
            rstc=1;
            rstd=1;
            rstcin=1;
            rstopmode=1;
            #10

        end
    end
    
    endmodule
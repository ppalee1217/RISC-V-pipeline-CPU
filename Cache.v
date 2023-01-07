//Defines
`define READ 4'b0000
`define CACHESIZE 4096
`define WAITSTATES 2'b11
`define ADDR 15:0
`define ADDRWIDTH 16
`define INDEX 9:0
`define TAG 15:10
`define DATA 31:0
`define DATAWIDTH 32
`define PRESENT 1'b1
`define ABSENT !`PRESENT

module Cache(
    PStrobe, PAddress,
    PData, PRW, PReady,
    SysStrobe, SysAddress,
    SysData, SysRW,
    Reset, Clk
);
    input PStrobe;
    input [`ADDR] PAddress;
    inout [`DATA] PData;
    input [3:0] PRW; // w_en
    output PReady;
    output SysStrobe;
    output [`ADDR] SysAddress;
    inout [`DATA] SysData;
    output [3:0] SysRW;
    input Reset;
    input Clk;

    
    
    wire PDataOE;
    wire SysDataOE;
    wire [`DATA] PDataOut;
    // Bidirectional Buses
    wire [`DATA] PData = PDataOE ? PDataOut : `DATAWIDTH'bz;
    wire [`DATA] SysData= SysDataOE ? PData : `DATAWIDTH'bz;
    wire [`ADDR] SysAddress = PAddress;
    wire [`TAG] TagRamTag;
    wire Write;
    wire Valid;
    wire CacheDataSelect;
    wire PDataSelect;
    wire Match;

    TagRam TagRam(
        .Address (PAddress[`INDEX]),
        .TagIn (PAddress[`TAG]),
        .TagOut (TagRamTag[`TAG]),
        .Write (Write),
        .Clk (Clk)
    );
    ValidRam ValidRam(
        .Address (PAddress[`INDEX]),
        .ValidIn (1'b1),
        .ValidOut (Valid),
        .Write (Write),
        .Reset (Reset),
        .Clk (Clk)
    );
    wire[`DATA] DataRamDataOut;
    wire[`DATA] DataRamDataIn;
    DataMux CacheDataInputMux(
        .S (CacheDataSelect),
        .A (SysData),
        .B (PData),
        .C (DataRamDataIn) 
    );
    DataMux PDatatMux(
        .S (PDataSelect),
        .A (SysData),
        .B (DataRamDataOut),
        .C (PDataOut) 
    );
    DataRam DataRam(
        .Address (PAddress[`INDEX]),
        .DataIn (DataRamDataIn),
        .DataOut (DataRamDataOut),
        .PRW(PRW),
        .Write (Write),
        .Clk (Clk),
        .Reset(Reset)
    );
    Comparator Comparator(
        .Tag1 (PAddress[`TAG]),
        .Tag2 (TagRamTag),
        .Match (Match)
    );
    Control Control(
        .PStrobe (PStrobe),
        .PRW (PRW),
        .PReady (PReady),
        .Match (Match),
        .Valid (Valid),
        .CacheDataSelect (CacheDataSelect),
        .PDataSelect (PDataSelect),
        .SysDataOE (SysDataOE),
        .Write(Write),
        .PDataOE (PDataOE),
        .SysStrobe (SysStrobe),
        .SysRW (SysRW),
        .Reset (Reset),
        .Clk (Clk)
    );
endmodule


module Control(
    PStrobe, PRW, PReady, 
    Match, Valid, Write,
    CacheDataSelect,
    PDataSelect,
    SysDataOE, PDataOE,
    SysStrobe, SysRW, Reset,
    Clk
);
    input PStrobe;
    input [3:0] PRW;
    output PReady;
    input Match, Valid;
    output Write;
    output CacheDataSelect;
    output PDataSelect;
    output SysDataOE, PDataOE;
    output SysStrobe;
    output [3:0] SysRW;
    input Reset;
    input Clk;
    wire [1:0] WaitStateCtrInput = `WAITSTATES;
    wire WaitStateCtrCarry;
    reg LoadWaitStateCtr;
    WaitStateCtr WaitStateCtr(
        .Load (LoadWaitStateCtr),
        .LoadValue (WaitStateCtrInput),
        .Carry (WaitStateCtrCarry),
        .Clk (Clk)
    );
    reg PReadyEnable;
    reg SysStrobe;
    reg [3:0] SysRW;
    reg SysDataOE;
    reg Write;
    reg Ready;
    reg CacheDataSelect, PDataSelect;
    reg PDataOE;
    reg [3:0] State, NextState;
    reg SysRW_temp;

    `define STATE_IDLE 4'd0
    `define STATE_READ 4'd1
    `define STATE_READMISS 4'd2
    `define STATE_READSYS 4'd3
    `define STATE_READDATA 4'd4
    `define STATE_WRITE 4'd5
    `define STATE_WRITEHIT 4'd6
    `define STATE_WRITEMISS 4'd7
    `define STATE_WRITESYS 4'd8
    `define STATE_WRITEDATA 4'd9

    always @ (posedge Clk) State = Reset ? `STATE_IDLE : NextState;

    always @ (State or PStrobe or PRW or Match or Valid or WaitStateCtrCarry)
        case (State)
            `STATE_IDLE: begin
                if (PStrobe && PRW == `READ)
                    NextState = `STATE_READ;
                else if (PStrobe && (| PRW) ) // Write
                    NextState = `STATE_WRITE;
                else NextState = `STATE_IDLE;
            end
            `STATE_READ : begin
                if (Match && Valid)
                    NextState = `STATE_IDLE; 
                else NextState = `STATE_READMISS;
            end
            `STATE_READMISS : begin
                NextState = `STATE_READSYS;
            end
            `STATE_READSYS : begin
                if(WaitStateCtrCarry)
                    NextState = `STATE_READDATA;
                else NextState = `STATE_READSYS;
            end
            `STATE_READDATA : begin
                NextState = `STATE_IDLE;
            end
            `STATE_WRITE : begin
                if (Match && Valid)
                    NextState = `STATE_WRITEHIT;
                else
                    NextState = `STATE_WRITEMISS;
            end
            `STATE_WRITEHIT : begin
                NextState = `STATE_WRITESYS;
            end
            `STATE_WRITEMISS : begin
                NextState = `STATE_WRITESYS;
            end
            `STATE_WRITESYS : begin
                if (WaitStateCtrCarry)
                    NextState = `STATE_WRITEDATA;
                else NextState = `STATE_WRITESYS;
            end
            `STATE_WRITEDATA : begin
                NextState = `STATE_IDLE;
            end
            default : NextState = `STATE_IDLE;
        endcase

    task OutputVec;
        input [9:0] vector;
        begin
            {LoadWaitStateCtr, // 1
            PReadyEnable,      // 2
            Ready,             // 3
            Write,             // 4
            SysStrobe,         // 5
            SysRW_temp,        // 6
            CacheDataSelect,   // 7
            PDataSelect,       // 8
            PDataOE,           // 9
            SysDataOE}         // 10
            = vector;
        end
    endtask

    always @ (State)
        case (State)                     // 1234567890
            `STATE_IDLE:      OutputVec(10'b0000000010); // PDataOE is high beacuse load use hazard needs to read data right away 
            `STATE_READ:      OutputVec(10'b0100000010);
            `STATE_READMISS:  OutputVec(10'b1000110010);
            `STATE_READSYS:   OutputVec(10'b0000010010);
            `STATE_READDATA:  OutputVec(10'b0011011110);
            `STATE_WRITEHIT:  OutputVec(10'b1001111100);
            `STATE_WRITE:     OutputVec(10'b0000000000);
            `STATE_WRITEMISS: OutputVec(10'b1000110001);
            `STATE_WRITESYS:  OutputVec(10'b0000010001);
            `STATE_WRITEDATA: OutputVec(10'b0011010101);
            default:          OutputVec(10'b0000000000);
        endcase

    always@(*) begin
        if(SysRW_temp) SysRW = PRW;
        else SysRW = 4'b0000;
    end

    wire PReady = (PReadyEnable && Match && Valid) || Ready;
endmodule

module DataMux(S, A, B, C);
    input S; //Select Line
    input [`DATA] A, B;
    output [`DATA] C; 
    wire [`DATA] C = S ? A: B;
endmodule

module WaitStateCtr(Load, LoadValue, Carry, Clk);
    input Load;
    input [1:0] LoadValue;
    output Carry;
    input Clk;
    reg [1:0] Count;
    always @ (posedge Clk)
        if (Load) Count = LoadValue;
        else Count = Count - 2'b1;
    wire Carry = Count == 2'b0;
endmodule

module TagRam(Address, TagIn, TagOut, Write, Clk);
    input [`INDEX]Address;
    input [`TAG] TagIn;
    output [`TAG] TagOut;
    input Write;
    input Clk;
    reg [`TAG] TagOut;
    reg [`TAG] TagRam [`CACHESIZE-1:0];
    //write
    always @ (negedge Clk)
        if (Write) TagRam[Address] = TagIn; 
    always @ (posedge Clk) TagOut = TagRam[Address]; //read
endmodule

module ValidRam(Address, ValidIn, ValidOut, Write, Reset, Clk);
    input [`INDEX] Address;
    input ValidIn;
    output ValidOut;
    input Write;
    input Reset;
    input Clk;

    reg ValidOut;
    reg[`CACHESIZE-1:0] ValidBits;
    integer i;
    always @ (posedge Clk)
        if (Write && !Reset)
            ValidBits[Address] = ValidIn; // write
        else if (Reset)
            for (i=0; i < `CACHESIZE; i= i + 1) ValidBits[i] = `ABSENT; //reset
    always @ (posedge Clk) ValidOut = ValidBits[Address]; //read
endmodule

module DataRam(Address, DataIn, DataOut, Write, PRW, Clk, Reset);
    input [`INDEX] Address;
    input [`DATA] DataIn;
    input Write;
    input Clk;
    input [3:0] PRW;
    input Reset;
    output reg [`DATA] DataOut;
 
    reg [`DATA] Dataout;
    reg [7:0] Ram [0:`CACHESIZE-1];
    integer i;
    always @(negedge Reset) begin
        for(i=0; i < `CACHESIZE; i=i+1) begin
            Ram[i] = 8'd0;
        end
    end
    //write
    always @(posedge Clk) begin
        if(Write) begin
            if (PRW[0]) begin
                Ram[Address] <= DataIn[7:0];
            end
            if (PRW[1]) begin
                Ram[Address + 16'd1] <= DataIn[15:8];
            end
            if (PRW[2]) begin
                Ram[Address + 16'd2] <= DataIn[23:16];
            end
            if (PRW[3]) begin
                Ram[Address + 16'd3] <= DataIn[31:24];
            end
            if (PRW == 4'd0) begin
                Ram[Address] <= DataIn[7:0];
                Ram[Address + 16'd1] <= DataIn[15:8];
                Ram[Address + 16'd2] <= DataIn[23:16];
                Ram[Address + 16'd3] <= DataIn[31:24];
            end
        end
    end
    //read
    always @ (*) begin
        if(PRW == 4'b0000) begin
            DataOut = {Ram[Address+3], Ram[Address+2], Ram[Address+1], Ram[Address]};
        end
    end
endmodule

module Comparator(Tag1, Tag2, Match);
    input [`TAG] Tag1;
    input [`TAG] Tag2;
    output Match;
    wire Match = Tag1 == Tag2;
endmodule








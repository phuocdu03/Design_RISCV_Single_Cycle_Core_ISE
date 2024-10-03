// Copyright 2023 MERL-DSU

//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at

//        http://www.apache.org/licenses/LICENSE-2.0

//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.
`timescale 1ns / 1ps
module Single_Cycle_Top_Tb ();
    
    reg clk=1'b1,rst;
    wire [31:0] ALUResult,RD2_Top;
    wire MemWrite;
    Single_Cycle_Top Single_Cycle_Top(
                                .clk(clk),
                                .rst(rst),
				.ALUResult(ALUResult)
				.RD2_Top(RD2_Top)
				.MemWrite(MemWrite)
    );
    initial begin
        $dumpfile("Single Cycle.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #450;
        $finish;
    end
endmodule
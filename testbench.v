// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

/*module add_two_vals_tb();
  wire [4:0] sum;
  reg [3:0] inA, inB;
  integer k;
  
  //note here the .name belongs to the name inside the UUT
  add_two_vals UUT (.sum(sum), .inA(inA), .inB(inB));
  
  initial
    begin
      inA = 4'b0100; inB = 4'b1010; // 4 + 10 = 14 = 1110
      
      $display("inA = %b, inB = %b, sum = %b at time %t",inA, inB, sum, $time);
      for ( k = 0; k < 5; k = k + 1)
        begin
          #5 inA = inA + k; inB = inB + k;
          $display("inA = %b, inB = %b, sum = %b at time %t",inA, inB, sum, $time);
        end
      $display("Simulation done");
    
    end
  
endmodule*/

module calc_ones_module_tb();
  wire [2:0] numOnesOutput;
  reg [7:0] eightBitInput;
  integer k;
  
  calc_ones_module UUT(.numOnes(numOnesOutput), .eightBit(eightBitInput));
  
  initial 
    begin
      
      eightBitInput = 8'b01011101;
      $display("k is %d, Input is %b, number of ones is %d, at time %t",k,eightBitInput, numOnesOutput,$time);
      $display("Starting loop now.....");
      for (k=0; k < 5; k = k + 1)
      begin
        #5 eightBitInput = eightBitInput + k;
        #5 // this delay is so that the task has time to finish processing so the outcomes printed will be up-to-date.
      	$display("k is %d, Input is %b, number of ones is %d, at time %t",k,eightBitInput, numOnesOutput,$time);
      end
      $display("Simulation finished");
    end
  
endmodule
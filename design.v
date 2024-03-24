`timescale 1ns / 1ps // time_unit / time_precision
// time_unit is for the simulatin and delay times
// time_precision is how time_units get rounded

/*module add_two_vals( sum, inA, inB);
  output reg [4:0] sum; // 5 bit reg
  input [3:0] inA, inB; // two 4 bit registers
  
  function [4:0] add_two;
    input [3:0] inputA;
    input [3:0] inputB; 
    add_two = inputA + inputB; // weird but okay
  endfunction
  
  always @ (inA, inB)
    sum = add_two(inA, inB); // assignment requires sum to be a reg
  
endmodule*/

module calc_ones_module( numOnes, eightBit);
  output reg [2:0] numOnes;
  input [7:0] eightBit;
  
  function [2:0] calc_ones_func;
    input [7:0] eightBit;
    
    reg [2:0] ones;
    integer k;
    begin
      ones = 3'b000;
      for (k=0; k< 8; k=k+1)
        begin
          if(eightBit[k] == 1)
            ones = ones + 1;
        end
    end
	calc_ones_func = ones;
  endfunction
  
  task calc_ones_task;
    output [2:0] numOnes; 
    input [7:0] eightBit;
    integer k;
    
    begin
      numOnes = 0;
      for(k=0; k< 8; k = k+1)
        begin
          if(eightBit[k] == 1)
            numOnes = numOnes + 1;
        end
    end
    
  endtask
  
  always @ (eightBit)
    begin
      numOnes = calc_ones_func(eightBit);
      //calc_ones_task(numOnes, eightBit);
    end
  // Interesting that with a task, you don't
  //even assign a value to the module output,   // instead just passing the 
  // module's output reg to the task as output
endmodule
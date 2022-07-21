// Exemplo de teste que mostra que se a entrada for ABCBA o cofre irá abrir 
// x1 x0
// 0  0 - sem entrada
// 0  1 - A 
// 1  0 - B 
// 1  1 - C 


module testbench(); 

  reg x1, x0, clk, reset; 
  
  fsm f(x1, x0, clk, reset); 
 
  
  initial reset = 1'b0; 
  initial clk = 1'b0; 
  initial x1 = 1'b1; 
  initial x0 = 1'b0; 
  
  initial forever #150 clk = ~clk; 
  
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars; 
    #300 x1 = 1'b0; x0 = 1'b1; // A 
    #300 x1 = 1'b1; x0 = 1'b0; // B 
    #300 x0 = 1'b1;			   // C 
    #300 x0 = 1'b0; 		   // B 
    #300 x1 = 1'b0; x0 = 1'b1; // A 
    #9000
    $finish(1); 
  end 
    
    
endmodule
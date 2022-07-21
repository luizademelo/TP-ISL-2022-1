// Code your design here
module fsm(x1, x0, clk, reset); 
  input x1, x0, clk, reset; 
  output reg led; 

  
  // registrador de estados
  reg [2:0]state; 
  
  // codificação de estados 
  parameter s0 = 3'b000, 
  			s1 = 3'b001, 
  			s2 = 3'b010, 
  			s3 = 3'b011, 
  			s4 = 3'b100, 
  			s5 = 3'b101; 
  
  
  // inicialização da máquina de estados
  initial begin 
    state <= s0; 
    led <= 1'b0; 
  end 
  
  // próximo estado 
  always @ (posedge clk) 
    if (reset == 1'b1) state <= s0;  
    else begin 
      case(state) 
        s0: begin
          if(x1 == 1'b0 && x0 == 1'b1) state <= s1; 
          else state <= s0; 
        end 
        s1: begin
          if(x1 == 1'b1 && x0 == 1'b0) state <= s2; 
          else if(x1 == 1'b1 && x0 == 1'b1) state <= s0; 
        end 
        s2: begin
          if(x1 == 1'b1 && x0 == 1'b1) state <= s3; 
          else if(x1 == 1'b0 && x0 == 1'b1) state <= s1; 
          else if(x1 == 1'b1 && x0 == 1'b0) state <= s0;
        end 
        s3: begin
          if(x1 == 1'b1 && x0 == 1'b0) state <= s4;
          else if(x1 == 1'b0 && x0 == 1'b1) state <= s1;
          else if(x1 == 1'b1 && x0 == 1'b1) state <= s0;
        end 
        s4: begin
          if(x1 == 1'b0 && x0 == 1'b1) state <= s5;
          else if(x1 == 1'b1 && x0 == 1'b0) state <= s0;
          else if(x1 == 1'b1 && x0 == 1'b1) state <= s0;
        end
        s5: begin
          led <= 1'b1; 
        end 
      endcase
    end
  
endmodule 
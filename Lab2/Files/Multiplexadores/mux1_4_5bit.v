module mux1_4_5bit(
	input [1:0] sel,
	input [4:0] dado[3:0],
	output [4:0]saida
	);
	
	always @(*)
		case (sel)
			2'b00: saida = dado[0];
			2'b01: saida = dado[1];
			2'b10: saida = dado[2];
			2'b11: saida = dado[3];
			default: saida = 5'b00000;	
		endcase
			
endmodule
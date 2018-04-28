module mux1_2_5bit(
	input sel,
	input [4:0] dado[1:0],
	output [4:0] saida
	);
	
	always @(*)
		case (sel)
			1'b0: saida = dado[0];
			1'b1: saida = dado[1];
			default: saida = 5'b0;
		endcase
			
endmodule
	
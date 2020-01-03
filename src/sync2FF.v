//两级寄存
module sync2FF#(
	parameter DATAWIDTH = 8
)
(
	input 						    CLK,
	input 						    RSTn,
	input      						D,
	output reg  					Q
);

reg  Q1;

always @(posedge CLK or negedge RSTn) begin
	if (!RSTn) begin
		// reset
		Q  <= 0;
		Q1 <= 0;
	end
	else begin
		Q1 <= D;
		Q  <= Q1;
	end
end

endmodule
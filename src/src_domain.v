//source domain
module src_domain#(
	parameter DATAWIDTH = 8
)
(
	input 						     CLK				,
	input 							 RSTn				,
	input 	   [ DATAWIDTH - 1 : 0 ] src_data_in 		,
	output reg [ DATAWIDTH - 1 : 0 ] src2dest_data		,
	output reg 					     src2dest_load		,
	output reg						 src_data_valid
);

reg [ DATAWIDTH - 1 : 0 ] src_data_in_reg; 

always @(posedge CLK or negedge RSTn) begin
	if (!RSTn) begin
		// reset
			src2dest_data <= 0;
			src2dest_load <= 0;
			src_data_in_reg <= 0;
		end
	else begin
		src2dest_load <= src2dest_load ^ src_data_valid;
		src_data_in_reg <= src_data_in;
		end
	if (src_data_valid) begin
			src2dest_data <= src_data_in;
		end
	end



/**********src_data_in changed signal**********/
always @(posedge CLK or negedge RSTn) begin
    
	if (!RSTn) begin
			// reset
			src_data_valid <= 0;
		end
	else if (src_data_in!=src_data_in_reg) 
		begin
	   		src_data_valid <= 1;
		end
	else 
			src_data_valid <= 0;
end

endmodule
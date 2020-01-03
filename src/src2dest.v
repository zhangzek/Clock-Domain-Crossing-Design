//top module
module src2dest#(
	parameter DATAWIDTH = 8
)
(
	input 							src_CLK				,
	input 							dest_CLK			,
	input 							RSTn				,
	input 	[ DATAWIDTH - 1 : 0 ] 	src_data_in			,
	output 	[ DATAWIDTH - 1 : 0 ] 	dest_data_out		,
	output							src_data_valid		,
	output							dest_data_valid

);

wire [ DATAWIDTH - 1 : 0 ] src2dest_data;
wire [ DATAWIDTH - 1  :0 ] src2dest_load;

src_domain src_domain_inst(	.CLK 				(src_CLK		)	,
							.RSTn				(RSTn			)	,
							.src_data_in		(src_data_in	)	,
							.src2dest_data		(src2dest_data	)	,
							.src2dest_load		(src2dest_load	)	,
							.src_data_valid		(src_data_valid	))	;
dest_domain dest_domain_inst(.CLK 				(dest_CLK		)	,
							 .RSTn				(RSTn			)	,
							 .src2dest_data		(src2dest_data	)	,
							 .src2dest_load		(src2dest_load	)	,
							 .dest_data_valid	(dest_data_valid)	,
							 .dest_data_out		(dest_data_out	))	;

endmodule
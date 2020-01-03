//testbench
module src2dest_tb();
	parameter DATAWIDTH = 8;

	reg 							src_CLK			;
	reg 							dest_CLK		;
	reg 							RSTn			;
	reg 	[ DATAWIDTH - 1 : 0 ] 	src_data_in		;
	wire 	[ DATAWIDTH - 1 : 0 ] 	dest_data_out	;
	wire 							src_data_valid	;
	wire 							dest_data_valid	;


initial
 	begin
		src_CLK = 0;
		forever #20 src_CLK <= ~src_CLK;
		
	end
initial
 	begin
 		dest_CLK = 0;
 		forever #30 dest_CLK <= ~dest_CLK;
 	end
initial
 	begin
		RSTn = 0;
		#10 
		RSTn = 1;
	end

initial
begin
    src_data_in <= 0;
    #200 src_data_in <= 8'd2;
    #240 src_data_in <= 8'd20;
    #200 src_data_in <= 8'd22;
    #280 src_data_in <= 8'd11;
    #300 src_data_in <= 8'd3;
    #340 src_data_in <= 8'd6;
    #300 src_data_in <= 8'd7;
    #240 src_data_in <= 8'd8;
    #240 src_data_in <= 8'd13;
    #300 src_data_in <= 8'd24;
    #300 src_data_in <= 8'd35;
    #240 src_data_in <= 8'd17;
    #400 src_data_in <= 8'd18;
    #260 src_data_in <= 8'd21;
    #240 src_data_in <= 8'd13;
    #300 src_data_in <= 8'd25;
    #240 src_data_in <= 8'd36;
    #280 src_data_in <= 8'd47;
    #400 src_data_in <= 8'd63;
    #440 src_data_in <= 8'd32;
    #800
    $stop;
    
end

src2dest src2deat_inst( .src_CLK		(src_CLK		)	,
						.dest_CLK		(dest_CLK		)	,
						.RSTn			(RSTn			)	,
						.src_data_in	(src_data_in	)	,
						.dest_data_out	(dest_data_out	)	,
						.src_data_valid (src_data_valid	)	,		
						.dest_data_valid (dest_data_valid))	;

endmodule
`timescale 1ns / 1ps

module example_sim();
    reg clock_;
    reg reset_;
	reg [31:0] clockcount_;
    
    wire [31:0] cosout_, sinout_, atanout_;
    reg [31:0] x0_, y0_, z0_;
    
    always #5 clock_ = ~clock_;
    always #10 clockcount_ = clockcount_ + 1;


	parameter TEST_SIZE = 100 + 4;
	reg [31:0] testinputs_ [TEST_SIZE - 1 : 0];
	
atan atandut(
	.clock(clock_),
	.reset(reset_),
	.y0(y0_),
	.out(atanout_));


integer idx_;
integer delay_;
shortreal testfloat_;
shortreal testin_;

shortreal actual_;
shortreal expected_;
shortreal error_;

function real abs;
	input real val;
	begin
		abs = $sqrt($pow(val, 2.0));
	end
endfunction

initial begin
	delay_ = 69;
	clockcount_ = 32'd0;
    clock_ = 1'b1;
    reset_ = 1'b1;
	#10;

    reset_ = 1'b0;
    /* Test extreme inputs */
	testinputs_[0] = 32'h4e3ebc20;
	testinputs_[1] = 32'hce3ebc20;
	
	testinputs_[2] = 32'hb21a9e6b; 
	testinputs_[3] = 32'h321a9e6b;
	
	testinputs_[4] = 32'hc3fa0000;
	testinputs_[5] = 32'hc3f50000;
	testinputs_[6] = 32'hc3f00000;
	testinputs_[7] = 32'hc3eb0000;
	testinputs_[8] = 32'hc3e60000;
	testinputs_[9] = 32'hc3e10000;
	testinputs_[10] = 32'hc3dc0000;
	testinputs_[11] = 32'hc3d70000;
	testinputs_[12] = 32'hc3d20000;
	testinputs_[13] = 32'hc3cd0000;
	testinputs_[14] = 32'hc3c80000;
	testinputs_[15] = 32'hc3c30000;
	testinputs_[16] = 32'hc3be0000;
	testinputs_[17] = 32'hc3b90000;
	testinputs_[18] = 32'hc3b40000;
	testinputs_[19] = 32'hc3af0000;
	testinputs_[20] = 32'hc3aa0000;
	testinputs_[21] = 32'hc3a50000;
	testinputs_[22] = 32'hc3a00000;
	testinputs_[23] = 32'hc39b0000;
	testinputs_[24] = 32'hc3960000;
	testinputs_[25] = 32'hc3910000;
	testinputs_[26] = 32'hc38c0000;
	testinputs_[27] = 32'hc3870000;
	testinputs_[28] = 32'hc3820000;
	testinputs_[29] = 32'hc37a0000;
	testinputs_[30] = 32'hc3700000;
	testinputs_[31] = 32'hc3660000;
	testinputs_[32] = 32'hc35c0000;
	testinputs_[33] = 32'hc3520000;
	testinputs_[34] = 32'hc3480000;
	testinputs_[35] = 32'hc33e0000;
	testinputs_[36] = 32'hc3340000;
	testinputs_[37] = 32'hc32a0000;
	testinputs_[38] = 32'hc3200000;
	testinputs_[39] = 32'hc3160000;
	testinputs_[40] = 32'hc30c0000;
	testinputs_[41] = 32'hc3020000;
	testinputs_[42] = 32'hc2f00000;
	testinputs_[43] = 32'hc2dc0000;
	testinputs_[44] = 32'hc2c80000;
	testinputs_[45] = 32'hc2b40000;
	testinputs_[46] = 32'hc2a00000;
	testinputs_[47] = 32'hc28c0000;
	testinputs_[48] = 32'hc2700000;
	testinputs_[49] = 32'hc2480000;
	testinputs_[50] = 32'hc2200000;
	testinputs_[51] = 32'hc1f00000;
	testinputs_[52] = 32'hc1a00000;
	testinputs_[53] = 32'hc1200000;
	testinputs_[54] = 32'h00000000;
	testinputs_[55] = 32'h41200000;
	testinputs_[56] = 32'h41a00000;
	testinputs_[57] = 32'h41f00000;
	testinputs_[58] = 32'h42200000;
	testinputs_[59] = 32'h42480000;
	testinputs_[60] = 32'h42700000;
	testinputs_[61] = 32'h428c0000;
	testinputs_[62] = 32'h42a00000;
	testinputs_[63] = 32'h42b40000;
	testinputs_[64] = 32'h42c80000;
	testinputs_[65] = 32'h42dc0000;
	testinputs_[66] = 32'h42f00000;
	testinputs_[67] = 32'h43020000;
	testinputs_[68] = 32'h430c0000;
	testinputs_[69] = 32'h43160000;
	testinputs_[70] = 32'h43200000;
	testinputs_[71] = 32'h432a0000;
	testinputs_[72] = 32'h43340000;
	testinputs_[73] = 32'h433e0000;
	testinputs_[74] = 32'h43480000;
	testinputs_[75] = 32'h43520000;
	testinputs_[76] = 32'h435c0000;
	testinputs_[77] = 32'h43660000;
	testinputs_[78] = 32'h43700000;
	testinputs_[79] = 32'h437a0000;
	testinputs_[80] = 32'h43820000;
	testinputs_[81] = 32'h43870000;
	testinputs_[82] = 32'h438c0000;
	testinputs_[83] = 32'h43910000;
	testinputs_[84] = 32'h43960000;
	testinputs_[85] = 32'h439b0000;
	testinputs_[86] = 32'h43a00000;
	testinputs_[87] = 32'h43a50000;
	testinputs_[88] = 32'h43aa0000;
	testinputs_[89] = 32'h43af0000;
	testinputs_[90] = 32'h43b40000;
	testinputs_[91] = 32'h43b90000;
	testinputs_[92] = 32'h43be0000;
	testinputs_[93] = 32'h43c30000;
	testinputs_[94] = 32'h43c80000;
	testinputs_[95] = 32'h43cd0000;
	testinputs_[96] = 32'h43d20000;
	testinputs_[97] = 32'h43d70000;
	testinputs_[98] = 32'h43dc0000;
	testinputs_[99] = 32'h43e10000;
	testinputs_[100] = 32'h43e60000;
	testinputs_[101] = 32'h43eb0000;
	testinputs_[102] = 32'h43f00000;
	testinputs_[103] = 32'h43f50000;
	testinputs_[104] = 32'h43fa0000;
	
	#10;
	
	for(idx_ = 0; idx_ < TEST_SIZE + 4; idx_ = idx_ + 1) begin
		testfloat_ = $bitstoshortreal(testinputs_[idx_]);
		y0_ <= testinputs_[idx_];
		if(idx_ >= delay_) begin
			actual_ = $bitstoshortreal(atanout_);
			testin_ = $bitstoshortreal(testinputs_[idx_ - delay_]);
			expected_ = $atan(testin_);
			error_ = expected_ != 0.0 ? abs((actual_ - expected_)/expected_)*100.0 : abs(actual_ * 100.0);
			$display("test input: %.8f result: %.8f expected result: %.8f Percent Err: %.8f%%", 
				testin_,
				actual_,
				expected_,
				error_
				);
		end
		#10; //@(posedge clock_);
	end
	
    
end
    
endmodule



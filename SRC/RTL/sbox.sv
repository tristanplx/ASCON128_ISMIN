`timescale 1ns / 1ps
	import ascon_pack::*;
module sbox (
	input logic[4:0] sbox_i,
	output logic[4:0] sbox_o
);
	assign sbox_o = sbox_c[sbox_i];

endmodule : sbox


`timescale 1ns / 1ps
import ascon_pack::*;
module perm_f_count_tb;


	type_state state_i_s;
	type_state state_o_s;
	
	logic init_a_i_s;
	logic init_b_i_s;
	logic en_i_s;

	logic[63:0] data_i;
	logic[127:0] key_i;
	logic[3:0] counter_i;
	logic en_cipher_i, en_reg_state_i, clock_i, reset_i;
	logic en_data_i, en_xor_key_i, en_xor_data_i, en_xor_key_end_i, en_xor_lsb_i;
	logic[127:0] tag_o;
	logic[63:0] cipher_o;
	logic data_sel_i;

	permutation_finale DUT1 (
	.state_i(state_i_s),
	.data_i(data_i),
	.key_i(key_i),
	.counter_i(counter_i),
	.en_cipher_i(en_cipher_i),
	.en_reg_state_i(en_reg_state_i),
	.clock_i(clock_i),
	.reset_i(reset_i),
	.en_data_i(en_data_i),
	.en_xor_key_i(en_xor_key_i),
	.en_xor_data_i(en_xor_data_i),
	.en_xor_key_end_i(en_xor_key_end_i),
	.en_xor_lsb_i(en_xor_lsb_i),
	.tag_o(tag_o),
	.cipher_o(cipher_o),
	.data_sel_i(data_sel_i)
	);
	
	compteur_double_init DUT2 (
	.clock_i(clock_i),
	.resetb_i(reset_i),
	.en_i(en_i_s),
	.init_a_i(init_a_i_s),
	.init_b_i(init_b_i_s),
	.cpt_o(counter_i)
	);
	    

	always #10 clock_i = ~clock_i;
    
	initial begin
	
	clock_i = 1'b0;
	data_i = 1'b0;
	key_i = 128'h000102030405060708090A0B0C0D0E0F;
	

	state_i_s[0] = 64'h80400c0600000000; 
	state_i_s[1] = 64'h8a55114d1cb6a9a2; 
	state_i_s[2] = 64'hbe263d4d7aecaaff; 
	state_i_s[3] = 64'h4ed0ec0b98c529b7; 
	state_i_s[4] = 64'hc8cddf37bcd0284a;
	
	init_a_i_s = 1'b1;
	
	reset_i = 1'b0;
	data_sel_i = 1'b0;
	en_xor_data_i = 1'b0;
	en_xor_key_i = 1'b0;
	en_xor_key_end_i = 1'b0;
	en_xor_lsb_i = 1'b0;
	en_reg_state_i = 1'b1;
	//counter_i = 4'b0000;
	#105
	reset_i = 1'b1;
	#20
	data_sel_i = 1'b1;
	en_i_s = 1'b0;
	state_o_s = DUT1.reg_to_mux_s;
	//counter_i = counter_i + 1;
	$display("Iteration        0, etat actuel: %h", state_o_s);
	init_a_i_s = 1'b0;
	en_i_s = 1'b1;
	for (int i = 0; i < 11; i++) begin
		#20; 
		//counter_i = counter_i + 1;
		state_o_s = DUT1.reg_to_mux_s;
		$display("Iteration %d, etat actuel: %h", i+1, state_o_s); //On peut directement comparé les valeurs de chaque iteration avec les valeurs tabulees dans l'énonce du sujet, on voit que ces dernieres correspondent
	end


	end

endmodule


`timescale 1ns / 1ps
import ascon_pack::*;
module FSM_moore ()
	//definition du type enumere
	typedef enum {idle, conf_init, end_conf_init, init, end_init, idle_da} state_t;
	//2 variables intermediaires
	state_t current_state;
	state_t next_state;
	//processus sequentiel qui modelise le registre des etats
	always_ff@(posedge clock_i or negedge resetb_i)
		begin : seq_0
			if(resetb_i == 1'b0)
			//nonblocking assignment
			current_state <= state0;
			else current_state <= next_state;
		end : seq_0
	//modelisation des transitions
	always_comb begin :comb_0
		case ( current_state)
		idle :
			if ( state_i == 1b'0)
				next_state = init;
			else next_state = conf_init;
		conf_init:
			next_state = end_fonc_init;
		end_fond_init:
			next_state = init;
		init:
			if ( round_i == 4'ha)
				next_state = end_init;
			else
				next_state = init;
		end_init:
			next_state = idle_da;
		idle_da:
			if( data_valid_i == 1'b0)
				next_state = idle_da;
			else
				next_state = conf_da;
			default:
				next_state = idle;
	//modelisation des sorties
	//meme structures que pour les entrées
	always_comb begin : comb1
		case ( current_state )
		idle : 
			data_sel_0 = 1'b0;
			.
			.
		conf_init :
		end_fonc_init:		
		

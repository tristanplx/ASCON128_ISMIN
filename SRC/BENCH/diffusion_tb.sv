`timescale 1 ns / 1 ps
module diffusion_tb;
    import ascon_pack::*;

    type_state state_i_s;
    type_state state_o_s;

    diffusion DUT (
        .state_i(state_i_s),
        .state_o(state_o_s)
    );

    initial begin
        state_i_s = {64'h78e2cc41faabaa1a, 64'hbc7a2e775aababf7, 64'h4b81c0cbbdb5fc1a, 64'hb22e133e424f0250, 64'h044d33702433805d};
    end
endmodule

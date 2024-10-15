`timescale 1ns / 1ps

module add_constant_tb;
    import ascon_pack::*;
    logic[3:0] round_s;
    type_state state_i_s;
    type_state state_o_s;

    add_constant DUT (
        .state_i(state_i_s),
        .round_i(round_s),
        .state_o(state_o_s)
    );

    initial begin
        state_i_s = {64'h80400c0600000000, 64'h8a55114d1cb6a9a2, 64'hbe263d4d7aecaaff, 64'h4ed0ec0b98c529b7, 64'hc8cddf37bcd0284a};
        round_s = 4'b0;

        repeat (12) begin
            
            #20;
            round_s = round_s + 1;
        end

        $display("Fin de la simulation");
    end
endmodule : add_constant_tb


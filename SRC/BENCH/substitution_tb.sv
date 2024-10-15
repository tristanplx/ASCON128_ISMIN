`timescale 1 ns / 1 ps
module substitution_tb;
    import ascon_pack::*;

    type_state sub_i_s;
    type_state sub_o_s;

    substitution DUT (
        .sub_i(sub_i_s),
        .sub_o(sub_o_s)
    );

    initial begin
        sub_i_s = {64'h80400c0600000000, 64'h8a55114d1cb6a9a2, 64'hbe263d4d7aecaa0f, 64'h4ed0ec0b98c529b7, 64'hc8cddf37bcd0284a};
    end
endmodule


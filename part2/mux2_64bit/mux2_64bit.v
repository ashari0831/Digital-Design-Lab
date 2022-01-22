module mux2to1 (
    w, s, f
);
input [1:0]w;
input s;
output reg f;

always @(*) begin
    if(s==0)
        f=w[0];
    else
        f=w[1];
end
    
endmodule



module mux2_64bit (
     w, s, f
);
input [127:0]w;
input s;
output [0:63]f;

    mux2to1 mux1({w[127], w[63]}, s, f[0]);
    mux2to1 mux2({w[126], w[62]}, s, f[1]);
    mux2to1 mux3({w[125], w[61]}, s, f[2]);
    mux2to1 mux4({w[124], w[60]}, s, f[3]);
    mux2to1 mux5({w[123], w[59]}, s, f[4]);
    mux2to1 mux6({w[122], w[58]}, s, f[5]);
    mux2to1 mux7({w[121], w[57]}, s, f[6]);
    mux2to1 mux8({w[120], w[56]}, s, f[7]);
    mux2to1 mux9({w[119], w[55]}, s, f[8]);
    mux2to1 mux10({w[118], w[54]}, s, f[9]);
    mux2to1 mux11({w[117], w[53]}, s, f[10]);
    mux2to1 mux12({w[116], w[52]}, s, f[11]);
    mux2to1 mux13({w[115], w[51]}, s, f[12]);
    mux2to1 mux14({w[114], w[50]}, s, f[13]);
    mux2to1 mux15({w[113], w[49]}, s, f[14]);
    mux2to1 mux16({w[112], w[48]}, s, f[15]);
    mux2to1 mux17({w[111], w[47]}, s, f[16]);
    mux2to1 mux18({w[110], w[46]}, s, f[17]);
    mux2to1 mux19({w[109], w[45]}, s, f[18]);
    mux2to1 mux20({w[108], w[44]}, s, f[19]);
    mux2to1 mux21({w[107], w[43]}, s, f[20]);
    mux2to1 mux22({w[106], w[42]}, s, f[21]);
    mux2to1 mux23({w[105], w[41]}, s, f[22]);
    mux2to1 mux24({w[104], w[40]}, s, f[23]);
    mux2to1 mux25({w[103], w[39]}, s, f[24]);
    mux2to1 mux26({w[102], w[38]}, s, f[25]);
    mux2to1 mux27({w[101], w[37]}, s, f[26]);
    mux2to1 mux28({w[100], w[36]}, s, f[27]);
    mux2to1 mux29({w[99], w[35]}, s, f[28]);
    mux2to1 mux30({w[98], w[34]}, s, f[29]);
    mux2to1 mux31({w[97], w[33]}, s, f[30]);
    mux2to1 mux32({w[96], w[32]}, s, f[31]);
    mux2to1 mux33({w[95], w[31]}, s, f[32]);
    mux2to1 mux34({w[94], w[30]}, s, f[33]);
    mux2to1 mux35({w[93], w[29]}, s, f[34]);
    mux2to1 mux36({w[92], w[28]}, s, f[35]);
    mux2to1 mux37({w[91], w[27]}, s, f[36]);
    mux2to1 mux38({w[90], w[26]}, s, f[37]);
    mux2to1 mux39({w[89], w[25]}, s, f[38]);
    mux2to1 mux40({w[88], w[24]}, s, f[39]);
    mux2to1 mux41({w[87], w[23]}, s, f[40]);
    mux2to1 mux42({w[86], w[22]}, s, f[41]);
    mux2to1 mux43({w[85], w[21]}, s, f[42]);
    mux2to1 mux44({w[84], w[20]}, s, f[43]);
    mux2to1 mux45({w[83], w[19]}, s, f[44]);
    mux2to1 mux46({w[82], w[18]}, s, f[45]);
    mux2to1 mux47({w[81], w[17]}, s, f[46]);
    mux2to1 mux48({w[80], w[16]}, s, f[47]);
    mux2to1 mux49({w[79], w[15]}, s, f[48]);
    mux2to1 mux50({w[78], w[14]}, s, f[49]);
    mux2to1 mux51({w[77], w[13]}, s, f[50]);
    mux2to1 mux52({w[76], w[12]}, s, f[51]);
    mux2to1 mux53({w[75], w[11]}, s, f[52]);
    mux2to1 mux54({w[74], w[10]}, s, f[53]);
    mux2to1 mux55({w[73], w[9]}, s, f[54]);
    mux2to1 mux56({w[72], w[8]}, s, f[55]);
    mux2to1 mux57({w[71], w[7]}, s, f[56]);
    mux2to1 mux58({w[70], w[6]}, s, f[57]);
    mux2to1 mux59({w[69], w[5]}, s, f[58]);
    mux2to1 mux60({w[68], w[4]}, s, f[59]);
    mux2to1 mux61({w[67], w[3]}, s, f[60]);
    mux2to1 mux62({w[66], w[2]}, s, f[61]);
    mux2to1 mux63({w[65], w[1]}, s, f[62]);
    mux2to1 mux64({w[64], w[0]}, s, f[63]);
    

endmodule
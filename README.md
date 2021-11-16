# some commands to compile and test this piece of code
## Compile
>iverilog -o [name].vvp [path to test bench verilog file]
- example: iverilog -o dec4_16_tb.vvp dec4_16_tb.v

## Test test bench file
> vvp [name].vvp
- example: vvp dec4_16_tb.vvp
- Note: This command must produce a .vcd file in your directory

## Getting Output in timeline
first run gtkwave (we use gtkwave as a software for displaying timeline)
>gtkwave
then select the .vcd file which has been created

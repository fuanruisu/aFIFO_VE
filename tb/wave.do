onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /afifo_tb/wr_rst
add wave -noupdate /afifo_tb/rd_rst
add wave -noupdate /afifo_tb/clk_wrt
add wave -noupdate /afifo_tb/clk_read
add wave -noupdate -childformat {{/afifo_tb/tester.exp_v -radix hexadecimal}} -expand -subitemconfig {/afifo_tb/tester.exp_v {-radix hexadecimal} /afifo_tb/tester.afifo {-height 15 -childformat {{/afifo_tb/tester.afifo.data_in -radix hexadecimal} {/afifo_tb/tester.afifo.data_out -radix hexadecimal}} -expand} /afifo_tb/tester.afifo.data_in {-height 15 -radix hexadecimal} /afifo_tb/tester.afifo.data_out {-height 15 -radix hexadecimal}} /afifo_tb/tester
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32965 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {42418 ps} {81976 ps}

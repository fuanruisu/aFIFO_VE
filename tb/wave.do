onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /afifo_tb/uut/wr_clk
add wave -noupdate /afifo_tb/uut/rd_clk
add wave -noupdate /afifo_tb/wr_rst
add wave -noupdate /afifo_tb/rd_rst
add wave -noupdate -expand /afifo_tb/tester
add wave -noupdate /afifo_tb/itf/push
add wave -noupdate /afifo_tb/itf/full
add wave -noupdate /afifo_tb/itf/data_in
add wave -noupdate /afifo_tb/itf/pop
add wave -noupdate /afifo_tb/itf/empty
add wave -noupdate /afifo_tb/itf/data_out
add wave -noupdate /afifo_tb/uut/rptr_r2w_1
add wave -noupdate /afifo_tb/uut/rptr_r2w_2
add wave -noupdate /afifo_tb/uut/wq2_rptr
add wave -noupdate /afifo_tb/uut/ram_w_addr
add wave -noupdate /afifo_tb/uut/wptr_w2r_1
add wave -noupdate /afifo_tb/uut/wptr_w2r_2
add wave -noupdate /afifo_tb/uut/rq2_wptr
add wave -noupdate /afifo_tb/uut/ram_r_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 179
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {235540 ps} {309440 ps}

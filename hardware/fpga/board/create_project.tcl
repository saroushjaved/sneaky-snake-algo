# Reconstruct the recovered ROM/clock/LED project without old absolute source paths.
# Usage: vivado -mode batch -source hardware/fpga/board/create_project.tcl -tclargs /absolute/path/to/memory.coe
# This prepares a project; it does not synthesize, implement, or program a board.
if {$argc != 1} { error "Supply the path to a 16-word, 400-bit binary COE file." }
set coe [file normalize [lindex $argv 0]]
if {![file isfile $coe]} { error "COE file not found: $coe" }
set board_dir [file dirname [file normalize [info script]]]
set fpga_dir [file dirname $board_dir]
set repo_dir [file dirname [file dirname $fpga_dir]]
set project_dir [file join $repo_dir build fpga-board]
if {[file exists $project_dir]} { error "Project directory already exists; preserve or remove it before recreating: $project_dir" }
create_project recovered_final $project_dir -part xc7vx485tffg1761-2
set_property target_language Verilog [current_project]
read_verilog [glob [file join $fpga_dir rtl *.v]]
read_verilog [file join $board_dir rtl top.v]
read_xdc [file join $board_dir constraints const_1.xdc]
# Work on copies so IP output generation never changes the archived configuration.
file mkdir [file join $project_dir ip]
foreach name {blk_mem_gen_0 clk_wiz_0} {
    set dest [file join $project_dir ip $name]
    file mkdir $dest
    set input [open [file join $board_dir ip ${name}.xci] r]
    set config [read $input]
    close $input
    if {$name eq "blk_mem_gen_0"} {
        set escaped_coe [string map {& &amp;} $coe]
        set config [string map [list memory.coe $escaped_coe] $config]
    }
    set output [open [file join $dest ${name}.xci] w]
    puts -nonewline $output $config
    close $output
    import_ip -files [file join $dest ${name}.xci]
}
set_property top top [get_filesets sources_1]
update_compile_order -fileset sources_1
report_ip_status -file [file join $project_dir ip-status.txt]
puts "Recovered project prepared at $project_dir. Inspect IP status, clock constraints, and REVIEW.md before generating outputs or building."
close_project

create_clock -period 4.000 -name clock -waveform {0.000 2.000} -add [get_ports -filter {NAME =~ "*clock*" && DIRECTION == "IN"}]

set text ""
for {set i 0} {$i < 32} {incr i} {
	set x [expr {int(rand() * (2**10))}]
	append text $x;
	append text "\n";
	puts [format "%8x" $x]
}


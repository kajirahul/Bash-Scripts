set terminal pngcairo  transparent enhanced background rgb 'white' font "arial,10" fontscale 1.0 size 1200, 800 
set output 'output.png'
set format x "%D %E" geographic
set format y "%D %N" geographic
set style data lines
set yzeroaxis
set title "Gnuplot Correspondences\ngeographic coordinate system" 
set xrange [ -180.000 : 180.000 ] noreverse nowriteback 
set x2range [ * : * ] noreverse writeback 
set yrange [ -90.0000 : 90.0000 ] noreverse nowriteback 
set y2range [ * : * ] noreverse writeback 
set zrange [ * : * ] noreverse writeback 
set cbrange [ * : * ] noreverse writeback 
set rrange [ * : * ] noreverse writeback 
NO_ANIMATION = 1
#Adding the label to the plot
set label 1 "Fig: Displays the customer's location" at -175.0,-60.0  font "arial,15"  textcolor rgb 'black' nopoint
#Adding key to describe plot aspects
set key at -100.0,-40.0 font "arial,15" 
plot 'world_10m.txt' with lines lc rgb "blue", 'world.cor' with points pt 5 lc "red"


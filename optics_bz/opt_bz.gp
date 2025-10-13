set terminal pngcairo color size 1500,1000 


set palette rgbformulae 33,13,10 negative

unset key

set label 1 at graph 0.25,0.08
set label 1 "K" tc rgb "black" font "Times,15" front
set label 2 at graph 0.95,0.53
set label 2 "K" tc rgb "black" font "Times,15" front
set label 3 at graph 0.25,0.91
set label 3 "K" tc rgb "black" font "Times,15" front

set label 4 at graph 0.71,0.08
set label 4 "K'" tc rgb "black" font "Times,15" front
set label 5 at graph 0.71,0.91
set label 5 "K'" tc rgb "black" font "Times,15" front
set label 6 at graph  0.01,0.53
set label 6 "K'" tc rgb "black" font "Times,15" front

set xlabel "k_{x}(Å^{-1})" font ",20"  offset 0,-1
set ylabel "k_{y} (Å^{-1})" font ",20" offset -1,0


set yrange[-1.5:1.5]
#set yrange[0:20]
set xrange[-1.5:1.5]

set lmargin 10
#set bmargin 5

set output 'opt-bz.png'

set tics font ",20"

set multiplot layout 2,3

unset key
#########################################################################

set title '(a) {/Symbol s}^{+} Polarization' font "Times,20"

#set cbrange[0:30]

plot './out/bz_act_sp.dat' u 1:2:4 w points pointtype 7 ps 0.1 lw 2 palette t " "

unset ylabel
set title '(b) {/Symbol s}^{-} Polarization' font "Times,20"

#set cbrange[0:60]

plot './out/bz_act_sm.dat'  u 1:2:4 w points pointtype 7 ps 0.1 lw 2 palette t " "

set title '(c) Circular Dichroism' font "Times,20"

#set cbrange[-1:1]

plot './out/dichroism_cp.dat' u 1:2:4 w points pointtype 7 ps 0.1 lw 2 palette t " "


#unset cbrange
set ylabel "k_{y} (Å^{-1})" font ",20" offset -1,0

set title '(d) Linear x Polarization' font "Times,20"

#set cbrange[0:30]

plot './out/bz_act_x.dat' u 1:2:4 w points pointtype 7 ps 0.1 lw 2 palette t " "

unset ylabel
set title '(e) Linear y Polarization' font "Times,20"

#set cbrange[0:60]

plot './out/bz_act_y.dat'  u 1:2:4 w points pointtype 7 ps 0.1 lw 2 palette t " "

set title '(f) Linear Dichroism' font "Times,20"

set cbrange[-1:1]
set cbtics -1.0,0.5,1.0

plot './out/dichroism_xy.dat' u 1:2:4 w points pointtype 7 ps 0.1 lw 2 palette t " "



#########################################################################





unset multiplot



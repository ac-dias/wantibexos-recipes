set terminal pngcairo color size 1600,800 


set palette rgbformulae 33,13,10 negative


set style line 1 \
    linecolor rgb 'black' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5

set style line 2 dt '-' \
    linecolor rgb 'red' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 3 \
    linecolor rgb 'blue' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5



#set ylabel "Energy (eV)" font "Times-Roman,20"
#set xlabel "Energy-Efermi (eV)" font "Times-Roman,20"


#set yrange[-10:10]
#set xrange[0:1]
set cbrange[-15:15]

set tics font  "Times-Roman,20"

set lmargin 10

set output 'berry.png'

unset key

set multiplot layout 1,2

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

set ylabel "k_{y} (Å^{-1})" font "Times-Roman,20" offset -1,0
set xlabel "k_{x} (Å^{-1})" font "Times-Roman,20" offset 0,-1

#set yrange[-1.5:1.5]
#set yrange[0:20]
#set xrange[-1.5:1.5]

plot './out/berry_curv_bz.dat' u 1:2:6 w points pointtype 7 ps 0.3 lw 2 palette t " "

################################################################################################################

unset label 1
unset label 2
unset label 3
unset label 4
unset label 5
unset label 6

unset xlabel
unset ylabel
set ylabel "Berry Curvature (Å^{-1})" font "Times-Roman,20"

#set yrange[-30:30]
set xrange[0:1]

set xtics ("{/Symbol G}"  0.00000,"K"  0.333,"K'"  0.666,"{/Symbol G}"  1.0)

set arrow from  0.333,  -15 to  0.333,   15 nohead dt 2 linewidth 2
set arrow from  0.666,  -15 to  0.666,   15 nohead dt 2 linewidth 2


set arrow from  0.0,  0.0 to  1.0,   0.0 nohead dt 2 linewidth 2

#set title '(a) 1T CrTeSe-a' font "Times-Roman,20"
plot './out/berry_curv_kpath.dat' u ($1):($4) w lines linestyle 1 \



unset multiplot

q

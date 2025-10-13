set terminal pngcairo color size 2000,800 


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



set ylabel "Energy (eV)" font "Times-Roman,20"
#set xlabel "Energy-Efermi (eV)" font "Times-Roman,20"


set yrange[-5:5]
set xrange[0:1]
set cbrange[-1:1]

set tics font ", 20"


set format cb "%.2f"      # sempre 2 casas decimais

set output 'bands.png'

unset key

set multiplot layout 1,2


set xtics ("{/Symbol G}"  0.00000,"K"  0.3333333,"K'"  0.6666666  ,"{/Symbol G}"  1.000000)

set arrow from  0.3333333 ,  -5 to  0.3333333,   5 nohead dt 2 linewidth 2
set arrow from  0.6666666 ,  -5 to  0.6666666 ,  5 nohead dt 2 linewidth 2

set arrow from  0.0,  0.0 to  1.0,   0.0 nohead dt 2 linewidth 2


plot './out/bands.dat' u 1:2:5 w linespoints pointtype 7 ps 0.1 lw 2 palette t " " \

####################################################################################

#unset arrow
#unset xtics
set key

set key at graph 0.90,0.60 font "Times-Roman,20"

plot './out/bands_mo_d.dat' u 1:2:($6*2) w points pt 6 ps variable linecolor rgb 'blue' title "Mo-d"\
,'./out/bands_s_p.dat' u 1:2:($6*2) w points pt 6 ps variable linecolor rgb 'red' title "S-p"\




unset multiplot

q


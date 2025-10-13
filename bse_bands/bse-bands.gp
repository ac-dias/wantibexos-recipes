set terminal pngcairo color size 1000,800 



set style line 1 \
    linecolor rgb 'blue' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.0

set style line 2  \
    linecolor rgb 'red' \
    linetype 1 linewidth 5 \
    pointtype 7 pointsize 1.0


set lmargin 13

set ylabel "Exciton Energy (eV)" font "Times-Roman,20" offset -3,0
#set xlabel "Energy-Efermi (eV)" font "Times-Roman,20"



set xrange[0:1]
set yrange[1.55:2.4]

set tics font ", 20"

set format y "%.2f"      # sempre 2 casas decimais

set output 'bse_bands.png'

unset key


set xtics ("{/Symbol G}"  0.00000,"K"  0.3333333,"K'"  0.6666666  ,"{/Symbol G}"  1.000000)

set arrow from  0.3333333 ,  1.55 to  0.3333333,   2.4 nohead dt 2 linewidth 2
set arrow from  0.6666666 ,  1.55 to  0.6666666 ,  2.4 nohead dt 2 linewidth 2





plot './out/bands_bse.dat' u ($1):($2) w linespoints linestyle 1 \





q

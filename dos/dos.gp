set terminal pngcairo color size 1600,800 


set style line 1 \
    linecolor rgb 'blue' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5

set style line 2 \
    linecolor rgb 'red' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5
    
    
set style line 3   \
    linecolor rgb 'dark-green' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5    

set style line 4   \
    linecolor rgb 'black' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5  
    
set style line 5   \
    linecolor rgb 'grey' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5
    
set style line 6   \
    linecolor rgb 'orchid' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5          



set ylabel "DoS (electrons/eV)" font "Times-Roman,20" offset -3,0
set xlabel "Energy (eV)" font "Times-Roman,20"


set xrange[-5:5]
set bmargin 4
set lmargin 12
set format y "%.1f"      # sempre 2 casas decimais

set tics font "Times-Roman,20"

set output 'dos.png'



set arrow from  0.0,  0.0 to  0.0,   4.5 nohead dt 2 linewidth 2


set multiplot layout 1,2


plot './out/dos.dat' u ($1):2 w lines linestyle 4 title "DOS"\
,'./out/dos_mo_d.dat' u ($1):6 w lines linestyle 1 title "Mo-d"\
,'./out/dos_s_p.dat' u ($1):6 w lines linestyle 2 title "S-p"\

unset arrow
unset ylabel

set arrow from  0.0,  -2.5 to  0.0,   2.5 nohead dt 2 linewidth 2

plot './out/dos.dat' u ($1):4 w lines linestyle 4 title  "Spin-UP" \
,'./out/dos.dat' u ($1):($5) w lines linestyle 1 title "Spin-DOWN"\







unset multiplot

q

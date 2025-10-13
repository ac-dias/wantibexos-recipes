set terminal pngcairo color size 1000,1000 


set palette rgbformulae 33,13,10 negative




set style line 1 \
    linecolor rgb 'black' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5

set style line 2  \
    linecolor rgb 'red' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5

set style line 3 \
    linecolor rgb 'blue' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5







set xrange[-1.5:1.5]
set xtics -1.5, 1.0, 1.5

set tics font "Times-Roman,20"

set lmargin 10

set format y "%.1f"      # sempre 2 casas decimais
set format x "%.1f"      # sempre 2 casas decimais

set output 'thermoelectrics.png'



set multiplot layout 2,2

set yrange[-1.5:1.5]
set ytics -1.5, 1.0, 1.5
set ylabel "Seebeck x10^{-3}  (mV/K)" font "Times-Roman,20" offset -1.0,0

plot './out/seebeck_900.000_K.dat' u 1:($2*1000) w lines linestyle 2 title "x" \
,'./out/seebeck_900.000_K.dat' u 1:($3*1000) w lines linestyle 3  title "y" \

set yrange[0:3.5]
set ytics 0, 1.0, 3.5
set ylabel "{/Symbol s} X 10^{5}(1/{/Symbol W} m)" font "Times-Roman,20"

plot './out/elec_condutivity_900.000_K.dat' u 1:($2/100000) w lines linestyle 2 title "x" \
,'./out/elec_condutivity_900.000_K.dat' u 1:($3/100000) w lines linestyle 3  title "y" \

set xlabel "{/Symbol m}-E_{fermi} (eV)" font "Times-Roman,20"

set yrange[0:10]
set ytics 0, 2.0, 10
set ylabel "{/Symbol K}_{e}(W/m.K)" font "Times-Roman,20"

plot './out/electron_thermal_conductivity_900.000_K.dat' u 1:2 w lines linestyle 2 title "x" \
,'./out/electron_thermal_conductivity_900.000_K.dat' u 1:3 w lines linestyle 3  title "y" \

set yrange[0:1]
set ytics 0, 0.2, 1.0
set ylabel "ZT" font "Times-Roman,20"

plot './out/ZT_900.000_K.dat' u 1:2 w lines linestyle 2 title "x" \
,'./out/ZT_900.000_K.dat' u 1:3 w lines linestyle 3  title "y" \



unset multiplot

q


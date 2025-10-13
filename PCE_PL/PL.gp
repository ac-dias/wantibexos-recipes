set terminal pngcairo color size 600,1000 


set palette rgbformulae 33,13,10 negative




set style line 1 \
    linecolor rgb 'red' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5

set style line 2  \
    linecolor rgb 'blue' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

set style line 3 dt "-" \
    linecolor rgb 'red' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 1.5
    
set style line 4 dt "-" \
    linecolor rgb 'blue' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5    



set xrange[1:2.5]
set xtics 1, 0.5, 2.5

set tics font "Times-Roman,20"

set key top left

set lmargin 15
set bmargin 5

set format y "%.1f"      # sempre 2 casas decimais
set format x "%.1f"      # sempre 2 casas decimais

set output 'PL.png'



set multiplot layout 2,1
################################################################################


#set yrange[0:3.5]
#set ytics 0, 1.0, 3.5
set ylabel "Abs. Coeff (10^{5} cm^{-1})" font "Times-Roman,20" offset -2.0,0

plot './out/bse_absorption_coef.dat' u 1:($2/100000) w lines linestyle 1 title "BSE-x" \
,'./out/bse_absorption_coef.dat' u 1:($3/100000) w lines linestyle 2  title "BSE-y" \
,'./out/ipa_absorption_coef.dat' u 1:($2/100000) w lines linestyle 3  title "IPA-x" \
,'./out/ipa_absorption_coef.dat' u 1:($3/100000) w lines linestyle 4  title "IPA-y" \


################################################################################


#set yrange[0:10]
#set ytics 0, 2.0, 10
set ylabel "PL (a.u)" font "Times-Roman,20" offset -3.0,0
set xlabel "Photon Energy (eV)" font "Times-Roman,20"

plot './out/bse_PL.dat' u 1:($2) w lines linestyle 1 title "BSE-x" \
,'./out/bse_PL.dat' u 1:($3) w lines linestyle 2  title "BSE-y" \
,'./out/ipa_PL.dat' u 1:($2) w lines linestyle 3  title "IPA-x" \
,'./out/ipa_PL.dat' u 1:($3) w lines linestyle 4  title "IPA-y" \




unset multiplot

q


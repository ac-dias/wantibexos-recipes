set terminal pngcairo color size 1500,1000 


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



set xrange[0:4]
set xtics 0, 1.0, 4

set tics font "Times-Roman,20"

set key top left

set lmargin 12
set bmargin 5

set format y "%.1f"      # sempre 2 casas decimais
set format x "%.1f"      # sempre 2 casas decimais

set output 'optics.png'



set multiplot layout 2,3
################################################################################

#set yrange[-1.5:1.5]
#set ytics -1.5, 1.0, 1.5
set ylabel "{/Symbol e}_{1}" font "Times-Roman,20" offset -1.0,0

plot './out/bse_diel-pol_x.dat' u 1:($2) w lines linestyle 1 title "BSE-x" \
,'./out/bse_diel-pol_y.dat' u 1:($2) w lines linestyle 2  title "BSE-y" \
,'./out/ipa_diel-pol_x.dat' u 1:($2) w lines linestyle 3  title "IPA-x" \
,'./out/ipa_diel-pol_y.dat' u 1:($2) w lines linestyle 4  title "IPA-y" \

################################################################################

#set yrange[-1.5:1.5]
#set ytics -1.5, 1.0, 1.5
set ylabel "{/Symbol e}_{2}" font "Times-Roman,20" offset -1.0,0

plot './out/bse_diel-pol_x.dat' u 1:($3) w lines linestyle 1 title "BSE-x" \
,'./out/bse_diel-pol_y.dat' u 1:($3) w lines linestyle 2  title "BSE-y" \
,'./out/ipa_diel-pol_x.dat' u 1:($3) w lines linestyle 3  title "IPA-x" \
,'./out/ipa_diel-pol_y.dat' u 1:($3) w lines linestyle 4  title "IPA-y" \

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
set ylabel "Refractive Index" font "Times-Roman,20" offset -2.0,0

plot './out/bse_refractive_index.dat' u 1:($2) w lines linestyle 1 title "BSE-x" \
,'./out/bse_refractive_index.dat' u 1:($3) w lines linestyle 2  title "BSE-y" \
,'./out/ipa_refractive_index.dat' u 1:($2) w lines linestyle 3  title "IPA-x" \
,'./out/ipa_refractive_index.dat' u 1:($3) w lines linestyle 4  title "IPA-y" \


################################################################################

set xlabel "Photon Energy (eV)" font "Times-Roman,20" 


#set yrange[0:10]
#set ytics 0, 2.0, 10
set ylabel "Reflectivity" font "Times-Roman,20" offset -2.0,0

plot './out/bse_reflectibility.dat' u 1:($2) w lines linestyle 1 title "BSE-x" \
,'./out/bse_reflectibility.dat' u 1:($3) w lines linestyle 2  title "BSE-y" \
,'./out/ipa_reflectibility.dat' u 1:($2) w lines linestyle 3  title "IPA-x" \
,'./out/ipa_reflectibility.dat' u 1:($3) w lines linestyle 4  title "IPA-y" \

################################################################################

#set yrange[0:10]
#set ytics 0, 2.0, 10
set ylabel "En. Loss Function" font "Times-Roman,20" offset -2.0,0

plot './out/bse_en_loss_func.dat' u 1:($2) w lines linestyle 1 title "BSE-x" \
,'./out/bse_en_loss_func.dat' u 1:($3) w lines linestyle 2  title "BSE-y" \
,'./out/ipa_en_loss_func.dat' u 1:($2) w lines linestyle 3  title "IPA-x" \
,'./out/ipa_en_loss_func.dat' u 1:($3) w lines linestyle 4  title "IPA-y" \

unset multiplot

q


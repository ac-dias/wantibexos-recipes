set terminal pdfcairo size 10cm,20cm enhanced font 'Times,20'
set output 'in2s2_phonons_aimd.pdf'



##############################
# 2. Multiplot Layout
##############################

set multiplot layout 1,2 scale 1.0,2.0    # 2x2 grid layout (only two plots used)

##############################
# 3. Global Variables
##############################

# High-symmetry point coordinates for band structure
a = 0.17223700
b = 0.34447410
c = 0.51671110


# Plot range
y1 = -10.5
y2 = 310
yf = y1
yg = y2

##############################
# 4. General Styles and Arrows
##############################

set style line 1 lc rgb "red"   lt 1 lw 2 pt 7 ps 1.5    # PBE band
set style line 2 lc rgb "blue"  lt 2 lw 1 pt 5 ps 1.5    # PBE+SOC band
set style line 3 lc rgb "black" lt 2 lw 1 pt 5 ps 1.5    # HSE06 band

# Set tics and axis formatting
set ytics format "%.1f"
set xrange [0:c]
set yrange [y1:y2]

# High-symmetry point labels (X, G, etc.)
set xtics ("{/Symbol G}" 0.000, "K" a, "K'" b, "{/Symbol G}" c)

# Vertical dashed lines at high-symmetry points
do for [x in "a b "]{
    eval(sprintf("set arrow from %s,%.3f to %s,%.3f nohead lc rgb 'gray' dt 2 lw 2", x, yf, x, yg))
}

# Horizontal line at Fermi level
set arrow from 0,0 to c,0 nohead dt 2 lw 2 lc rgb "gray"

# Annotation (example)
#set label "V.B.M." at graph 0.05, graph 0.4 front font ",15" tc rgb "dark-gray"

set label "(a)" at graph 0.03, graph 0.04 font ",20" front

##############################
# 5. First Plot: Phonon Dispersion
##############################

# Position and size for subplot 1
set origin 0.0, 0.5
set size 0.99, 0.50

# Axis labels
set ylabel "Frequency (cm^{-1})" offset 0.5
set xlabel ""

#set key r c
unset key

shift1=0.0
shift2=0.0
shift3=0.0

unset title

# Plot bands from data files
plot \
    './phonons-661/disp.dat' using ($1):($2*33.356) with lines linestyle 1 title "Total"
    

##############################
# 6. Second Plot: AIMD
##############################

# Reset arrows, labels, and tics from previous plot
unset arrow
unset label
unset ylabel
unset xtics
unset ytics
unset key
unset object 1

set label "(b)" at graph 0.03, graph 0.04 font ",20" front

# Position and size for subplot 2
set origin 0.0, 0.00
set size 0.99, 0.50

# Axis settings
set ytics format "%.2f"
set ylabel "Total Energy Variation per atoms (eV/atom)" offset 0.5
set xlabel "Time (ps)"
set xrange [0:5]
set yrange [0:0.12]

set ytics
set xtics

# Plot DOS curves (adjust file paths and styles as needed)
plot \
    "./aimd/aims_md.out" using ($2):(($4+0.553624468202318E+07)/64) with lines lw 2 lc rgb "black"  \



    


##############################
# End of Multiplot
##############################

unset multiplot

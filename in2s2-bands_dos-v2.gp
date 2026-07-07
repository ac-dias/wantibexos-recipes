set terminal pdfcairo size 20cm,10cm enhanced font 'Times,16'
set output 'in2s2_bands_dos.pdf'

########################################################################
# Gnuplot Script: Band Structure and DOS
# Author: Carlos Maciel O. Bastos
# Date: 09/07/2025
# Description: Creates a 2x2 multiplot figure with band structure and DOS
########################################################################


##############################
# 2. Multiplot Layout
##############################

set multiplot layout 3,2 scale 1.0,1.0    # 2x2 grid layout (only two plots used)

##############################
# 3. Global Variables
##############################

# High-symmetry point coordinates for band structure
a = 1.082
b = 2.164
c = 3.247
#d = 2.958
#e = 3.231
#f = 4.201
#g = 1.436889

# Fermi level
#ef = -6.474400
ef=0

# Plot range
y1 = -4
y2 = 6
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
# 5. First Plot: Band Structure
##############################

# Position and size for subplot 1
set origin -0.1, 0.0
set size 0.55, 0.99

# Axis labels
set ylabel "Energy (eV)" offset 1
set xlabel ""

set key r c

shift1=0.0
shift2=0.0
shift3=0.0

# Plot bands from data files
plot \
    './04_bandas_SEM_SOC_128/BAND.dat' using ($1):($2+shift1) with lines linestyle 1 title 'PBE', \
    './04_bandas_128/BAND.dat' using ($1):($2+shift2) with lines linestyle 2 title "PBE+SOC"

##############################
# 6. Second Plot: Density of States (DOS)
##############################

# Reset arrows, labels, and tics from previous plot
unset arrow
unset label
unset ylabel
unset xtics
unset ytics
unset key
unset object 1

set label "(b)" at graph 0.8, graph 0.04 font ",20" front

# Position and size for subplot 2
set origin 0.40, 0.012
set size 0.20, 0.978

# Axis settings
set xlabel "DOS"
set xrange [0:7]
set yrange [y1:y2]

# DOS legend settings
set key samplen 2 spacing 1 t at 6,2.5 font "Times,14"

# Plot DOS curves (adjust file paths and styles as needed)
plot \
    "./dos_pbe/DOS_0g.dat" using ($2):($1+shift3) with lines lw 2 lc rgb "black" title "Total", \
    "./dos_pbe/DOS_In_sumg.dat" using ($3):($1+shift3) with lines lw 2 lc rgb "red" title "In-s", \
    "./dos_pbe/DOS_In_sumg.dat" using ($4):($1+shift3) with lines lw 2 lc rgb "green" title "In-p", \
    "./dos_pbe/DOS_In_sumg.dat" using ($5):($1+shift3) with lines lw 2 lc rgb "blue" title "In-d", \
    "./dos_pbe/DOS_S_sumg.dat"  using ($3):($1+shift3) with lines lw 2 lc rgb "orange" title "S-s", \
    "./dos_pbe/DOS_S_sumg.dat"  using ($4):($1+shift3) with lines lw 2 lc rgb "coral" title "S-p", \

##############################
# 5. First Plot: Band Structure
##############################
unset label
# Set tics and axis formatting
set ytics format "%.1f"
set xrange [0:c]
set yrange [y1:y2]

unset ytics

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

# Position and size for subplot 1
set origin 0.55, 0.0
set size 0.40, 0.99

# Axis labels
#set ylabel "Energy (eV)" offset 1
set xlabel ""

set label "(c)" at graph 0.03, graph 0.04 font ",20" front

set key r c
set key at 3.2, 0.8

shift1=0.0
shift2=3.0334
shift3=0.0

# Plot bands from data files
plot \
    './04_bandas_128/BAND.dat' using ($1):($2+shift1) with lines linestyle 2 title "PBE+SOC", \
    './09_hse06-w90_SOC_xyz/wannier90_band.dat' using ($1):($2+shift2) with lines linestyle 3 title "HSE06+SOC"
    


##############################
# End of Multiplot
##############################

#unset multiplot

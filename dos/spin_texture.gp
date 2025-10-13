# Define o terminal para uma imagem PNG
set terminal pngcairo size 1600,800 

# Define o nome do arquivo de saída
set output 'spin_texture.png'

# Define os rótulos dos eixos
set ylabel "k_{y} (Å^{-1})" font "Times-Roman,20" offset -2,0
set xlabel "k_{x} (Å^{-1})" font "Times-Roman,20" offset 0,-1

# Define o título do gráfico
#set title "Textura de Spin"

# Configura a paleta de cores
#set palette defined (-1 "blue", 0 "white", 1 "red")
set palette rgbformulae 33,13,10 negative
set cblabel "<S_{z}>" font "Times-Roman,20" offset 1.5,0

set lmargin 10
set tics font "Times-Roman,20"
set cbtics -1,0.5,1
set format cb "%.1f"      # sempre 2 casas decimais

set xrange[-0.1:2.1]
set xtics 0,0.5,2.0
set format x "%.1f"      # sempre 2 casas decimais
set yrange[-0.1:3.5]
set ytics 0,0.5,3.5
set format y "%.1f"      # sempre 2 casas decimais

# Plota os dados do arquivo 'spin_texture_band_14.dat'
# Coluna 1: kx
# Coluna 2: ky
# Coluna 5: <sx> (componente x do vetor)
# Coluna 6: <sy> (componente y do vetor)
# Coluna 7: <sz> (cor do vetor)
# O fator 0.05 escala o tamanho dos vetores para uma melhor visualização

set multiplot layout 1,2

set title '(a) VBM Spin Texture' font "Times-Roman,20"
plot './out/spin_texture_band_14.dat' using 1:2:($5*0.05):($6*0.05):7 with vectors head filled linestyle 1 linewidth 2 palette title ''

set title '(b) CBM Spin Texture' font "Times-Roman,20"
plot './out/spin_texture_band_15.dat' using 1:2:($5*0.05):($6*0.05):7 with vectors head filled linestyle 1 linewidth 2 palette title ''

# Descomente a linha abaixo se quiser remover o arquivo de saída após a visualização
# pause -1 "Pressione Enter para sair"


unset multiplot

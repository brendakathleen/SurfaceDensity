using M3GTools
using DelimitedFiles
using PlotlyJS

include("../src/gencoord.jl")
include("../src/surfdensity.jl")

mysim = mysim = M3GTools.init(psf="../files/water_pt110.psf",
       dcd="../files/pt110_prod_e7_80_30ns_s1_5frames.dcd",
       vmd = "vmd")

oxygens = M3GTools.select(mysim, "oxygen")

coord = gencoord(mysim, oxygens, 28.1, 4.2) #4.2 é a distancia necessária para englobar os átomos de oxigênio da primeira camada

contagem = surfdensity(coord, 90, 90, 1.)

contagem = contagem ./ 5 #média de frames

contagem = contagem ./ 4.2 #quantidade de átomos por Å³

x = collect(0:90)
y = collect(0:90)

layout = Layout(xaxis_title="x / Å", yaxis_title = "y / Å")

PlotlyJS.plot(PlotlyJS.contour(

           x= x, # horizontal axis

           y= y, # vertical axis

           z= contagem, colorscale ="Portland",
), layout)


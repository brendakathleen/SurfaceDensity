using M3GTools
using BenchmarkTools

#Abrindo a trajetória

mysim = M3GTools.init(psf="files/water_pt110.psf",
       dcd="files/pt110_prod_e7_80_30ns_s1_15frames.dcd",
       vmd = "vmd")

#Selecionando apenas os átomos de oxigênio

oxygens = M3GTools.select(mysim, "oxygen");
oxygen = oxygens[1:10]

#Gerando as coordenadas z com BenchmarkTools
#Para apenas 10 átomos de oxigênio e marcando os átomos até 15A da superfície

@btime gencoord(mysim, oxygen, 28.1, 15)
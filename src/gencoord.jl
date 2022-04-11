#Gerador de coordenadas x,y para moléculas adsorvidas

include("distance.jl")
using M3GTools

function gencoord(mysim::M3GTools.Simulation, atoms::Vector, ys, dmax) #mysim = simulação, atoms = vetor de atomos de oxigênio, yw = y do oxigênio, ys = y da superfície, yb = y da caixa, dmax = distancia da primeira camada de solvatação

n = length(atoms)

coordinates = fill([0.,0.],(mysim.nframes, n))

for j in 1:n
M3GTools.firstframe(mysim)
for i in 1:mysim.nframes

sides,x,y,z = M3GTools.nextframe(mysim)
c = sides ./ 2 #centro da celula para pbc

M3GTools.wrap!(sides,x,y,z,center=[c[1],c[2],c[3]])  

d = distance(y[atoms[j]], ys, sides[2])

if d < dmax
coordinates[i,j] = [ x[atoms[j]] , z[atoms[j]] ] #No VMD, a coordenada y é de altura da caixa e xz é o plano da superfície

else
continue
end
end
end

return coordinates

end

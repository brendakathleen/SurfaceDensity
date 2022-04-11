#Gerador do mapa de densidade de átomos na superfície

function surfdensity(atomscoord, xmax, ymax, passo)

x = collect(0:passo:xmax)

y = collect(0:passo:ymax)

natoms = zeros(length(x), length(y))

for atom in atomscoord

if atom != [0.,0.]

if (atom[1] == xmax)
        xindex = length(x)-1
    else
        xindex = searchsortedlast(x, atom[1])
    end

    if (atom[2] == ymax)
        yindex = length(y)-1
    else
        yindex = searchsortedlast(y, atom[2])
    end

    natoms[xindex, yindex] += 1.0
           
end
end

return natoms

end


#for i in 1:size(atomscoord)[1]

#for j in 1:size(atomscoord)[2]

#if atomscoord[i,j] != [0.,0.]

#for l in 1:length(x)-1

#if x[l] < atomscoord[i,j][1] < x[l+1]

#for z in 1:length(y)-1

#if y[z] < atomscoord[i,j][2] < y[z+1]

#natoms[l,z] += 1

#end
#end
#end
#end
#end
#end
#end

#return natoms

#end



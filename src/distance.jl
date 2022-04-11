# função de distância entre o átomo de oxigênio e a superfície

function distance(yw, ys, yb) #yw = coordenada y do oxigênio, ys = coordenada y da superficie, yb = coordenada y da caixa

if (yw - ys) <= ( (yb - ys)/2 )
d = yw - ys

else (yw - ys) > ( (yb - ys)/2 )
d = yb - yw

end

return d

end



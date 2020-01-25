function [menor,medio,maior]=teste(x,y,z)
    if x>y then
        if y>z then
            menor=z
            medio=y
            maior=x
        elseif x>z then
            menor=y
            medio=z
            maior=x
        else
            menor=y
            medio=x
            maior=z
        end
    elseif y>z then
        if x>z then
            menor=z
            medio=x
            maior=y
        else
            menor=x
            medio=z
            maior=y
        end
    else
        menor=x
        medio=y
        maior=z
    end   
    //Ordem Crescente
    disp(maior,medio,menor)
    //------------
endfunction

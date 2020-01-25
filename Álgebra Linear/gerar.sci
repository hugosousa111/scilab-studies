function [limitados]=gerar_pseudo_aletorio(semente,n)
    m=2**32     //defino m, como a questão indica
    a=5         //baseado no pdf a deve ser um número que modulo 4 é 1
    c=3         //baseado no pdf defino c como um número impar
    vetor_aleatorio(1) = semente; 
    for i=2:n
        vetor_aleatorio(i)= modulo(a*vetor_aleatorio(i-1)+c,m)
    end
    //foram gerados números da semente até um número muito grande, temos que limita-los de 0 a 1
    for i = 1 : n 
             limitados(i) = vetor_aleatorio(i)/max(vetor_aleatorio)
    end
endfunction
//Exemplo:  g = gerar_pseudo_aletorio(3,1000)

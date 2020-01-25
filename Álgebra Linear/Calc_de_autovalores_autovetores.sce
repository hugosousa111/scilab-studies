disp("*****CALC DE AUTOVALORES E AUTOVETORES******")

A = input("Insira a matriz A ") 
disp("Matriz A: ")
disp(A)

I = eye(A)  //pega a matriz identidade de A
p = I(:,1)  //p é a primeira matriz dos coeficientes, de tamanho nx1, mesmo n de A
fa = A  //fa é uma matriz q nos auxilia no calculo do polinomio pelo metodo de Leverrier_Faddeev

for q = 1 : size(A,'c') //esse "for" irá rodar n vezes, (n da matriz A)
    p(q,1) = -((trace(fa))/q)   //nessa linha se calcula o coeficiente, pela soma da diagonal de fa, dividido pelo q da iteracao que vai ate o numero o tamanho da matriz (n)
    fa = A * (fa + (p(q,1) * I))   //o novo fa e calculado, pela multiplicacao de A pela soma do fa antigo, com o coefieciente encontrado(vezes a identidade)
end

pi = [I(:,1)]   //nova matriz de coeficientes
for j = 0: size(A,'c')-1    //este for tem como objetivo ordernar os coeficientes que estao em p, para dentro de pi, para podermos usar o comando poly
    pi(j+1,1)= p(length(p)-j,1) //faz a troca, invertendo as posicoes
end

vt = [1]    //vt é o coeficiente do elemento com maior indice do polinomio
pii = [pi;vt]   //unimos vt(coeficiente do maior elemento) e pi(demais coeficientes), para um unico vetor de coeficientes
polinomio = poly(pii,'Y','coeff')   //finalmente criamos o polinomio caracterisco da nossa matriz A

disp("Polinômio: ")
disp(polinomio)
auto_valores = roots(polinomio) //e tirando as raizes desse polinomio, temos os autovalores de A
disp("AutoValores: ")
disp(auto_valores)

    disp("---------------")
for i = 1 : size(auto_valores, 'r') //agora com os autovalores, aplicamos os metodos que fazemos a mao
    auto_vetor = A - (auto_valores(i)*I) //auto_vetor recebe a matriz A subtraida de um autovalor por iteracao(multipicado pela identidade para podermos fazer essa operacao)
    disp("AutoValor: ")
    disp(auto_valores(i))
    aveE = rref(auto_vetor)     //escalonamos a matriz auto_vetor, pois assim, a ultima coluna corresponde aos elementos(ex: x,y,z) do real autovetor
    meuqueridoautovetor = aveE (:,size(aveE,'c'))   //pegamos a ultima coluna, com os valores do autovetor
    
    for dp = 1: size(meuqueridoautovetor,'r') 
        meuqueridoautovetor(dp) = (-1)*meuqueridoautovetor(dp)  //neste "for" fazemos uma pequena correcao nestes valores, seria algo correspondente a passa-los pro outro lado da equacao, por isso, multiplicamos por -1
    end
    
    meuqueridoautovetor(size(meuqueridoautovetor,'r')) = 1  //outra correcao, e que o ultimo valor do autovetor(que nos estamos colocando em evidencia) ainda e 0, e deveria ser 1
    
    disp("AutoVetor: ")
    disp(meuqueridoautovetor)
    disp("---------------")
end

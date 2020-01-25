A = input("Insira a matriz A ") 
disp("Matriz A: ")
disp(A)

I = eye(A)
p = I(:,1)
fa = A  

for q = 1 : size(A,'c')
    p(q,1) = -((trace(fa))/q)
    fa = A * (fa + (p(q,1) * I))
end

pi = [I(:,1)]
for j = 0: size(A,'c')-1
    pi(j+1,1)= p(length(p)-j,1)
end

vt = [1]
pii = [pi;vt]
polinomio = poly(pii,'Y','coeff')

disp("Polinômio: ")
disp(polinomio)
auto_valores = roots(polinomio) 
disp("AutoValores: ")
disp(auto_valores)

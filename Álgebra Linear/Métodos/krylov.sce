matriz = input("Digite a matriz")

matrizY = zeros(matriz)
y = matrizY(:,1)
y(1,1) = 1
matrizY(:,size(matriz,'c'))=y

for i= size(matriz,'c')-1:-1:1
    matrizY(:,i)  = matriz * y
    y = matrizY(:,i)
end
y = -(matriz * y)
p = matrizY\y
id_a = eye(matriz)
pi = [id_a(:,1)]
pi(1,1)  = 0

for j = 0: size(matriz,'c')-1
    pi(j+1,1)= p(length(p)-j,1)
end

vt = [1]
pii = [pi;vt]
//disp(pii)
polin = poly (pii,'x','coeff')
disp(polin)
disp(roots(polin))

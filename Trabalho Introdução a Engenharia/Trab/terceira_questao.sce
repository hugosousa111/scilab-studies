exec("f.sci");
x=-10:0.01:10;
y=f(x);
//Gráfico
plot(x,y)
//polinômio para saber as raízes
p=poly([0 2 0 1], 'x', 'coeff');
//raízes
r=roots(p)
//Número de raízes
length(r)

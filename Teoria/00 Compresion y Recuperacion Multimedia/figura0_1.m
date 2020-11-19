% Guion  figura0_1.m
% Dibuja, para una línea de una imagen, sus niveles de gris y la
% correlación

clear; close all
I = imread('cameraman.tif');
figure,imshow(I),title('Imagen de entrada')
%
Row = 200; % fila de la que dibujaremos su perfil
x = double(I(Row,:));
Col = size(I,2);
%
MaxN = 200; % número de puntos de correlación que calcularemos
Cor = zeros(1,MaxN); % almacena los valores de correlación
for k = 1:MaxN
v=x(1:Col-(k-1));
u=x(k:Col) ;
Cor(k) = u*v'/(norm(u)*norm(v));
end
figure,subplot(1,2,1),plot(1:Col,x,'k','LineWidth',2)
xlabel('Número de píxel'), ylabel('Amplitud')
legend(['Fila' ' ' num2str(Row)])
subplot(1,2,2),plot(0:MaxN-1,Cor,'k','LineWidth',2)
xlabel('Desplazamiento de píxeles'), ylabel('Correlación')
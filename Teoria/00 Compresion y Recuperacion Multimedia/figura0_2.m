% Script figura0_2.m
% Example to show blockiness in DCT compression
% Quantizes and dequantizes an intensity image using
% 8x8 DCT and JPEG quantization matrix
close all
clear
I = imread('cameraman.tif');
figure,imshow(I), title('Original Image')
%
fun = @dct2; % 2D DCT function
N = 8; % block size of 2D DCT
T = blkproc(I,[N N],fun); % compute 2D DCT of image using NxN blocks
%
Scale = 4.0; % increasing Scale quntizes DCT coefficients heavily
% JPEG default quantization matrix
jpgQMat = [16 11 10 16 24 40 51 61;
12 12 14 19 26 58 60 55;
14 13 16 24 40 57 69 56;
14 17 22 29 51 87 80 62;
18 22 37 56 68 109 103 77;
24 35 55 64 81 194 113 92;
49 64 78 87 103 121 120 101;
72 92 95 98 121 100 103 99];
Qstep = jpgQMat * Scale; % quantization step size
% Quantize and dequantize the coefficients
for k = 1:N:size(I,1)
for l = 1:N:size(I,2)
T1(k:k+N-1,l:l+N-1) = round(T(k:k+N-1,l:l+N-1)./ Qstep).*Qstep;
end
end
% do inverse 2D DCT
fun = @idct2;
y = blkproc(T1,[N N],fun);
y = uint8(round(y));
figure,imshow(y), title('DCT compressed Image')
% Plot image profiles before and after compression
ProfRow = 164;
figure,plot(1:size(I,2),I(ProfRow,:),'k','LineWidth',2)
hold on
plot(1:size(I,2),y(ProfRow,:),'-.k','LineWidth',1)
title(['Intensity profile of row ' num2str(ProfRow)])
xlabel('Pixel number'), ylabel('Amplitude')
legend('Original','Compressed')
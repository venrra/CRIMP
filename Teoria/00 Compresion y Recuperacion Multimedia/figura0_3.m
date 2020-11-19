% Script figure0_3.m
% generates a differential frame by subtracting two
% temporally adjacent intensity image frames
% quantizes the differential frame and reconstructs
% original frame by adding quantized differential frame to the other frame.
close all; clear
file_name = 'foreman.yuv';
file_format = 'QCIF_PAL';
num_of_fotograma = 25;
[yuv_movie, yuv_array] = readYUV(file_name, num_of_fotograma, ...
file_format);
implay(yuv_movie); 
pause;
%%
I1=frame2im(yuv_movie(5));
I2=frame2im(yuv_movie(6));
Frm1=I1(:,:,1);
Frm2=I2(:,:,1);
%%
I1 = im2single(Frm1); % convert from uint8 to float single
I2 = im2single(Frm2); % convert from uint8 to float single
figure,imshow(I1,[]), title([num2str(5) 'th frame'])
figure,imshow(I2,[]), title([num2str(6) 'th frame'])
figure,imhist(I2,256),title(['Histogram of frame ' num2str(6)])
xlabel('Pixel Value'), ylabel('Pixel Count')
%%
Idiff = imsubtract(I2,I1); % subtract frame 5 from 6
figure,hist(Idiff(:),256),title('Histogram of difference image')
xlabel('Pixel Value'), ylabel('Pixel Count')
figure,imshow(Idiff,[]),title('Difference image')
IdiffQ = round(Idiff/4)*4;
figure,imshow(IdiffQ,[]),title('Quantized Difference image')
%%
y = I1 + IdiffQ; % reconstruct frame 6
figure,imshow(y,[]),title('Reconstructed image')

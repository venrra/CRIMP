%{
SCRIPT:         script3_3_2.m
SUPPLEMENT TO:  Tutorial 3.3
DESCRIPTION:    Example of cell mode
%}

%   Copyright 2011 O. Marques
%   Practical Image and Video Processing Using MATLAB, Wiley-IEEE, 2011.
%   $Revision: 1.0 Date: 2011/06/21 13:12:00 

%load image
I = imread('pout.tif');

%% Cell block 1
%   notice above how the cell block label is two percent signs (%%)
%   followed by a space.

gamma = 1;
I_adj = imadjust(I,stretchlim(I),[],gamma);

subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imhist(I), axis tight, ...
    title('Original Histogram')
subplot(2,2,3), imshow(I_adj), title('Adjusted Image')
subplot(2,2,4), imhist(I_adj), axis tight, ...
    title('Adjusted Histogram')
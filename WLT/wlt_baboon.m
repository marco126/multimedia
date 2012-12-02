% Wavelet transform.

clear all

X = imread('Baboon.bmp');
X = im2double(X);

% Perform single-level decomposition of X using db1.
[ca,ch,cv,cd] = dwt2(X,'haar');

% WLT Level-1 decompose image.
imwrite(ca,'Baboon_ca.bmp'); % Approximation coefficients

% Convert back
X2 = idwt2(ca,ch,cv,cd,'haar');

imwrite(X2,'Baboon_WLTinv.bmp');




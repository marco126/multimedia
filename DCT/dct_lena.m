% Discrete Cosine Transform for lena.
clear all

I = imread('lena512.bmp');
I = im2double(I);

T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';

% B will be the DCT result.
B = blockproc(I,[8 8],dct);
imwrite(B,'lena-DCTing.bmp');

% I am not sure what this mask does. 
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
    
B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);
invdct = @(block_struct) T' * block_struct.data * T;

% I2 will be the inverse DCT back to original data.
I2 = blockproc(B2,[8 8],invdct);
imwrite(I2,'lena-DCTinv.bmp');


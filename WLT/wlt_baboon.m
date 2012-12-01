% Wavelet transform.

clear all

X = imread('Baboon.bmp');

[CR,BPP] = wcompress('c',X,'Baboon.wtc','spiht','maxloop',12);
Xc = wcompress('u','Baboon.wtc');
%delete('Baboon.wtc');
imshow(Xc);

imwrite(Xc,'Baboon_WLTdec.bmp');




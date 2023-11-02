function testCircle

close all
%im = imread('D:\matlab\RareCyte_AlgScientist_Interview_2011\RareCyte_Interview_2011\cells\im01.tiff');
im = imread('A:\Amydis\Glaucoma SDEB Eye #2\Bottom\GC 090622-2 Bottom 1 40x 2011 Ab-647 01-Image Export-01\GC 090622-2 Bottom 1 40x 2011 Ab-647 01-Image Export-01_ChS1-T2_ORG.tif');
im = double(im);
im = im - min(im(:));
imN = imcomplement(im);
imN1 = imN - min(imN(:));
subplot(1,2,1),imshow(im,[])
subplot(1,2,2),imshow(imN1,[])
figure,histogram(imN1)

for ii = 1:10
   thresh = ii/20;
   togglefig('Threshold');
   imshow(im2bw(im,thresh));
   title(sprintf('Threshold = %0.2f',thresh));
   pause(1)
end

[accum, circen, cirrad] = ...
    CircularHough_Grd(im, [5 25],...
    20, 13, 1);
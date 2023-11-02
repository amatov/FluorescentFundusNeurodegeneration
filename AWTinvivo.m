function AWTinvivo

% SYNOPSIS   AWTinvivo.m
%
% INPUT      I   :    image for analysis
%            
% OUTPUT     metrics     :   Segmentated/de-noisied image with pixel intensity
% clusters
%
% DEPENDENCES   AWTinvivo uses {SpotDetector, awt}
%
% example run: AWTinvivo;
%
% Alexandre Matov, December 16th, 2022

%I1 = imread('A:\Amydis\GC01.tif');
%I1 = imread('A:\Amydis\Glaucoma SDEB Eye #2\Bottom\GC 090622-2 Bottom 1 40x 2011 Ab-647 01-Image Export-01\GC 090622-2 Bottom 1 40x 2011 Ab-647 01-Image Export-01_ChS1-T2_ORG.tif');
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 170395\Cyno1_000.tif');
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 170395\Cyno1_004.tif');
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 180424\Cyno1_006.tif');
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 191797\Cyno1_003.tif');%NO
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 191800\Cyno1_004.tif');%NO
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 191815\Cyno1_004.tif');
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 191817\Cyno1_005.tif');
%I = imread('A:\Amydis\NHP Data for Alex\Cyno 191823\Cyno1_006.tif');%NO
[fileName,dirName] = uigetfile('*.tif','Julie, please select a TIF file for analysis');
I = imread([dirName,filesep,fileName]);
I1 = rgb2gray(I);

%figure, imshow(I1(500:700,1400:1600),[0 4095]);
I = double(I1(1:end-150,:));%(500:700,1400:1600))
[detectionResults, detectionMask] = spotDetector(I);
[value, indx] = max(detectionResults.totalInt);
%figure; 
% imagesc(I); colormap(gray(256)); axis image; title('Raw Data - Image 13');
% figure
% imagesc(detectionMask); colormap(gray(256)); axis image; title('Wavelet Segmentation');

%figure,imshow(I,[])
%hold on
%plot(detectionResults.xmax(indx),detectionResults.ymax(indx),'ro')

figure
subplot(1,2,1); imagesc(I); colormap(gray(256)); axis image; title('Input');
subplot(1,2,2); imagesc(detectionMask); axis image; title('Detection');
hold on 
plot(detectionResults.xmax(indx),detectionResults.ymax(indx),'ro')

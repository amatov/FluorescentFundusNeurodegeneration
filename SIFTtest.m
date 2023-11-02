function [features,descriptors] = SIFTtest(sP,sU)

% SIFTtest(sP,sU) selects labelled protein aggregate areas in retinal
% images based on SIFT and ORB detectors
%
% STEPS:
% 1) run the program my writing its name with the input parameters in
% brackets
% 2) you will be promped to choose an image for analysis from your computer
% 3) segmented figure with selected aggregates areas labeled with metrics
% will be displayed 
%
% SYNOPSIS   metrics = SIFTtest(sP,sU)
%
% INPUT      sP   :    number of strongest SIFT keypoints to be displayed
%            sU   :    number of ORB uniformly distributed points
%
%
% OUTPUT     metrics     :    Feature detection figures
%
% DEPENDENCES   SIFTtest uses {Matlab native functions}
%
% example run: metrics = SIFTtest;
%
% Alexandre Matov, December 26th, 2022
%%
%I = imread('cameraman.tif');
%I = imread('A:\Amydis\Glaucoma SDEB Eye #2\Bottom\GC 090622-2 Bottom 1 40x 2011 Ab-647 01-Image Export-01\GC 090622-2 Bottom 1 40x 2011 Ab-647 01-Image Export-01_ChS1-T2_ORG.tif');
%I = imread('A:\Amydis\MatLab Quantification\Glaucoma SDEB Eye #1 Quantification\Inferior 1\GC 090622 Inf 1 40x 2011 Ab-647 01\GC 090622 Inf 1 40x 2011 Ab-647 01_ChS1-T3_ORG.tif');
%I1 = imread('A:\Amydis\NHP Data for Alex\Cyno 170395\Cyno1_000.tif');
%I1 = imread('A:\Amydis\NHP Data for Alex\Cyno 191797\Cyno1_000.tif');
%I1 = imread('A:\Amydis\AMYDIS FIH - COHORT 1\3\FF OS PREDOSE\PREDOSE OS_000.tif');% BAD detection
%I1 = imread('A:\Amydis\AMYDIS FIH - COHORT 1\3\FF OD PREDOSE\PREDOSE_000.tif');
[fileName,dirName] = uigetfile('*.tif','Julie, please select a TIF file for analysis');
I1 = imread([dirName,filesep,fileName]);

%imwrite(Ip,[dirName,filesep,fileName]);
%I2 = imread('A:\Amydis\NewDataJan2023\Cyno 180424\Visit 2\Cyno1_001.tif');



I2 = rgb2gray(I1);
I=I2(1:1500,:);%700,:);or 1500 for ex vivo
if nargin<1
    sP = 250; % strongest sift points
    sU = 5; % uniform points orb
end

points = detectSIFTFeatures(I);%,'ContrastThreshold',1);
imshow(I);
hold on;
plot(points.selectStrongest(sP))

% strongest = points.selectStrongest(10);
% strongest.Location
% 
% points1 = detectSURFFeatures(I);
% numPoints = 100;
% points2 = selectUniform(points1,numPoints,size(I));
% imshow(I);
% hold on
% plot(points2);
% hold off
% title("Uniformly distributed points");

points = detectORBFeatures(I);
% figure,imshow(I)
% hold on
% plot(points,'ShowScale',false)
% hold off

newPoints = selectUniform(points,sU,size(I))
%figure,imshow(I)
%hold on
%plot(newPoints)
%hold off

%  points1 = detectBRISKFeatures(im2gray(I),MinQuality=0.05);
%  figure, imshow(I);
% hold on
% plot(points1);
% hold off
% title("Original points");
% 
% numPoints = 100;
% points2 = selectUniform(points1,numPoints,size(I));
% figure, imshow(I);
% hold on
% plot(points2);
% hold off
% title("Uniformly distributed points");
% 
% points = detectORBFeatures(I,'ScaleFactor',1.01,'NumLevels',3);
% figure
% imshow(I)
% hold on
% plot(points)
% hold off
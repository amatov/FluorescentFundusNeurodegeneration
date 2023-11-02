function snr = snrEvaluation(p1min,p1max,p2min,p2max,minIn,cutoff);

% snrEvaluation computes the signal-to-noise ratio in AMDX-2011P retinal images
% 
% user can select min/max range of intensity values to facilitate the segmentation
%
% STEPS:
% 1) run the program my writing its name with the input parameters in
% brackets
% 2) you will be promped to choose an image for analysis from your computer
% 3) segmented figure with selected aggregates areas labeled with metrics
% will be displayed and saved to disk together with a TXT file with all
% metrics
%
% SYNOPSIS   metrics = snrEvaluation(p1min,p1max,p2min,p2max,cutoff)
%
% INPUT      p1min   :    lower boundary of parameter one (area)
%            p1max   :    upper boundary of parameter one (area)
%            p2min   :    lower boundary of parameter two (perimeter)
%            p2max   :    upper boundary of parameter two (perimeter)
%            minIn   :    minimal pixel intensity in any aggregate
%            cutoff  :    automated threshold correction
%            
% OUTPUT     snr     :    singal to noise ratio of the foreground vs
% backgrund AMDX-2011P aggregates
%
% DEPENDENCES   snrEvaluation uses {Gauss2D, cutFirstHistMode}
%
% example run: snr = snrEvaluation;
%
% Alexandre Matov, November 4th, 2022

[fileName,dirName] = uigetfile('*.tif','Julie, please select a TIF file for analysis');
aux1 = imread([dirName,filesep,fileName]);
aux1 = rgb2gray(aux1);


if nargin<4
    p1min = 10; % min pixel intensity in the background
    p1max = 30; % max pixel intensity in the background
    p2min = 80; % min pixel intensity in the foreground
    p2max = 150; % max pixel intensity in the background
end
if nargin<5
    minIn = 3600; % min pixel intensity in aggregates
end
if nargin<6
    cutoff = 1.25; % histogram cutoff factor
end

PixelSize = 0.08 ; % microns per pixel

% load images for analysis testing
%aux1 = imread('A:\Amydis\SNR Images for Intensity\Untitled48_c2.tiff');
figure,histogram(aux1)
Igray = Gauss2D(double(aux1),1); % filtering of high frequency background noise
Iblur = Gauss2D(double(aux1),4); % filtering of background nonspecific intensity
Idiff = Igray - Iblur; % difference of gaussians
Idiff(find(Idiff<0))=0; % clipping of negative values
figure, imshow(Igray,[])
    % automated selection of pixels which belong to foreground
    [cutoffInd, cutoffV] = cutFirstHistMode(Igray,0); 

threshold = cutoffV*cutoff;
%I = rgb2gray(I);
I = Igray>threshold;
%imshow (I);
%figure,imshow(I.*Igray,[])
frgr = aux1>=80 & aux1<150;%>=80 ;
bkgr = aux1> 10 & aux1<30;%30;
figure,imshow(frgr,[])
figure,imshow(bkgr,[])
figure,imshow(frgr.*double(aux1),[])
colormap jet
colorbar
figure,imshow(bkgr.*double(aux1),[])
colormap jet
colorbar
FG = frgr.*double(aux1);
nF = length(find(FG));
BG = bkgr.*double(aux1);
nB = length(find(BG));
SNR_med = median(FG(:))/median(BG(:))
SNR = (sum(FG(:))/nF)/(sum(BG(:))/nB)
%mask = zeros(sw(ize(I));
%mask(25:end-25,25:end-25) = 1;
%imshow(mask)
%title('Initial Contour Location')
%bw = activecontour(Igray,mask,300);
%imshow(bw)
%title('Segmented Image, 300 Iterations')

X = bwlabel(I.*Igray);
    stats = regionprops(X,'all'); %

        % Initialize 'feats' structure
    feats=struct(...
        'pos',[0 0],...                  % Centroid - [y x]
        'ecc',0,...                      % Eccentricity
        'ori',0);   % Orientation

    for j = 1:length(stats)
        feats.pos(j,1) = stats(j).Centroid(1);
        feats.pos(j,2) = stats(j).Centroid(2);
        feats.ecc(j,1) = stats(j).Eccentricity;
        feats.ori(j,1) = stats(j).Orientation;
        feats.len(j,1) = stats(j).MajorAxisLength;
    end
    h = figure,imshow(I.*Igray,[]);
    hold on
%list = find([stats.Area]>1600 & [stats.Area]<1705)
%list = find(Igray([stats.Centroid])>2000)
%list = find([stats.Area]>p1min);
%list = find([stats.MajorAxisLength]>80);
list = find([stats.Perimeter]>p2min & [stats.Perimeter]<p2max & [stats.Area]>p1min & [stats.Area]<p1max);

%for i = 1:length(stats)
%     x=round(stats(i).Centroid(1));
%            y=round(stats(i).Centroid(2));
%    if Igray(x,y)>3600
%               plot(x,y,'r*','LineWidth',2);
%    end
%end
% PLOTS the segmentation figure with the aggregates
metrics = stats(1:length(list));
%statsAgg=0;
k=0;
for i = 1:length(list)
                          if stats(list(i)).Area/stats(list(i)).Perimeter>6.3%4%7.8
                      k=k+1;
            x=stats(list(i)).Centroid(1);
            y=stats(list(i)).Centroid(2);
       %        plot(x,y,'r*','LineWidth',2);
           text(x+12,y+12,[num2str(round(stats(list(i)).Perimeter))],'Color','r');
                      text(x+50,y+50,[num2str(stats(list(i)).Area)],'Color','g');
                      metrics(k)=stats(list(i));
                      %writetable(struct2table(statistics), 'test.xls','sheet',k) 
                      end
end
%plot(metrics(1).PixelList(1,:),'r*')
title([num2str(k),' aggregates detected, Aggregate perimeter in pixels (red), Aggregate area in pixels (green)']);
 save([dirName,filesep,'metrics.mat'],'metrics');
 saveas(h,[dirName,filesep,'segmentedAggregates.tif']);
 SizeImage = size(aux1)
%        goodFeats = find(15<(feats.len));  
        
        
%    featNames = fieldnames(feats);
%    for field = 1:length(featNames)
%        feats.(featNames{field}) = feats.(featNames{field})(goodFeats,:);
%    end

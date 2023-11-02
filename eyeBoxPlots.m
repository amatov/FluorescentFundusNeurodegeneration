function box = eyeBoxPlots;

% eyeBoxPlots loads an .XLS file with four vectors and displays boxplots
%
% SYNOPSIS   box = eyeBoxPlots;
%
% INPUT       Sup  :    Sup area values vector
%             Tem  :    Tem area values vector
%             Nas  :    Nas area values vector
%             Inf  :    Inf area values vector
%
% OUTPUT     boxplot figures
%
% DEPENDENCES   eyeBoxPlots uses {native Matlab functions}
%
% example run: box = eyeBoxPlots;
%
% Alexandre Matov, November 4th, 2022

[filename,dirName] = uigetfile('*.xlsx','Julie, please select a file for analysis');

SDEB1 = xlsread([dirName,filename],1);
SDEB2 = xlsread([dirName,filename],2);
UCSD1 = xlsread([dirName,filename],3);
UCSD2 = xlsread([dirName,filename],4);
pxlSze = .09 * .09;
Areas = xlsread([dirName,filename],5)*pxlSze;%*pxlSze;
Inf1 = [Areas(1:12)',Areas(19:21)'];%15 aggregates
Nas1 = [Areas(16:18)',Areas(26:29)',nan(1,8)];%7 aggregates
Tem1 = [Areas(13:15)',Areas(22:25)',nan(1,8)];%7 aggregates
Sup1 = [Areas(30:34)',nan(1,10)];%5 aggregates


Sup = [SDEB1(1,1);SDEB2(1,1);UCSD1(1,1);UCSD2(1,1)];
Inf = [SDEB1(2,1);SDEB2(2,1);UCSD1(2,1);UCSD2(2,1)];
Nas = [SDEB1(3,1);SDEB2(3,1);UCSD1(3,1);UCSD2(3,1)];
Tem = [SDEB1(4,1);SDEB2(4,1);UCSD1(4,1);UCSD2(4,1)];

figure, boxplot([Sup,Inf,Nas,Tem],'notch','off','whisker',1.5,  ...
  'widths', 0.8, 'labels', {'Sup','Inf', 'Nas', 'Tem'},...
    'positions' , [ 1, 3, 5, 7])
ylim([5 30])
title('Aggregate counts distributions per region for four eyes');

% figure, boxplot([Tem1(1:7)',SupNas1(1:7)'],'notch','off','whisker',1.5,  ...
%    'widths', 0.8, 'labels', {'Tem', 'SupNas'},...
%      'positions' , [ 1, 5])
% %ylim([5 30])
% title('Area [um2] of the aggregates per region for four eyes');

figure, boxplot([Inf1',Tem1',Nas1',Sup1'],'notch','off','whisker',1.5,  ...
   'widths', 0.8, 'labels', {'Inf', 'Tem', 'Nas','Sup'},...
     'positions' , [ 1, 5, 9, 13])
%ylim([5 30])
title('Area [um2] of the aggregates per region for four eyes');
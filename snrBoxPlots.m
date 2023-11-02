function box = snrBoxPlots(sig,noi);

% snrBoxPlots provides an example of the boxplot functionality
%
% SYNOPSIS   box = snrBoxPlots(sig,noi);
%
% INPUT      sig   :    signal values vector
%            noi   :    noise values vector
%            
% OUTPUT     boxplot figure
%
% DEPENDENCES   snrBoxPlots uses {native Matlab functions}
%
% example run: box = snrBoxPlots(sig,noi);
%
% Alexandre Matov, November 4th, 2022

sig = [5.91; 6.32; 5.92; 6.18 ];

noi = [2.24; 1.80; 2.27; 2.49];

boxplot([sig,noi],'notch','off','whisker',1)

figure, boxplot([sig,noi],'notch','off','whisker',1.5,  ...
   'widths', 0.5, 'labels', {'TTR','Control'},...
     'positions' , [ 1, 3])
ylim([1 7])
ylabel('Comparison of fluorescent SNR: TTR vs Control');



%%  set all the MATLAB generic defaults for this user
%%
%% DO set your own path here
%%
%% run other init files which set some global variables 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% set the path such that all BMMG functions are found
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('*****************************************************************');
disp('* ATTENTION:                                                    *');
disp('* Do not forget to UPDATE & COMMIT your software every day!     *');
disp('*****************************************************************');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% set the path such that all my personal functions are found
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define a string variable mroot
% make sure there is no filesep at the end (to prevent double-seps)
homeDir = getenv('HOME');
if isempty(homeDir)
    error('no environment variable HOME: no personal *.m-files have been added to the path');
end
if strcmp(homeDir(end),filesep)
    disp('');
    disp('Warning: environment variable HOME has to end without a fileseparator (e.g. H:\)');
    disp('');
    homeDir = homeDir(1:end-1);
end
mroot = strcat(homeDir,filesep,'matlab');

% add all subdirectories to the path
if exist(mroot,'dir')
   addir(mroot);
   cd(mroot);
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% run through further init files 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Execute global variable defaults gDefaults.m, if it exists on the 
% path
if exist('gDefaults','file')
   gDefaults(homeDir)
end

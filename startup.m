function startup
%startup file to execute the defaults
%current defaults: cd to matlab-home

mroot = [getenv('HOME'),filesep,'matlab'];

try   
    defaults;
    cd(mroot);
catch
    %report error, but do not kill matlabrc
    disp('There was a problem changing your directory to HOME:')
    lasterr
    disp('')
    disp('Please make sure of the following:')
    disp('  - have you copied the matlabStandardFiles to your matlab/toolbox/local directory?')
    disp('  - have you set an environment variable HOME, containing the path where your matlab workdirectory is stored?')
    disp('  - this path should contain neither ''matlab'' nor end in a fileseparator')
    disp('  - if you are not logged in onto the domain: have you made sure that the network drives are all connected?')
    disp('')
    disp('If all of the above suggestions don''t help (remember to restart matlab after changing!), contact your caring sysadmin.')
end
function addir(dirName)
%ADDIR adds the subdirectories in the matlab HOME to the matlab path
%
%is about ten times faster than the previous implementation
%
%c: 2/04 jonas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% initialize
dirListInitLength = 1000;
dirListLength     = 1000;
dirList           = cell(1000,1);

dirList{1} = dirName;

checkDirCt = 1;
dirListCt  = 1;
more2check = 1;

% check every directory in dirList for subdirs and whether
% those are to be added to the list

while more2check
    
    % build list (struct!) of subdirectories
    subDirList = dir(dirList{checkDirCt});
    
    % loop through subDirList and add all the good entries
    for i = 3:length(subDirList) % first two are . and ..
        if subDirList(i).isdir
            subDirName = subDirList(i).name;
            % exclude priv/private, @, .svn
            if isempty(strmatch('priv',subDirName)) & ~strcmp(subDirName(1),'@') & ~strcmp(subDirName,'.svn')
                % good dir. write into list if it is long enough
                dirListCt = dirListCt + 1;
                
                % make sure that the dirList is long enough
                if dirListCt > dirListLength
                    tmpDirList = dirList;
                    newDirListLength = dirListLength + dirListInitLength;
                    dirList = cell(newDirListLength,1);
                    dirList(1:dirListLength) = tmpDirList;
                    dirListLength = newDirListLength;
                end
                
                % write into list
                dirList{dirListCt} = [dirList{checkDirCt},filesep,subDirName];
                
            end % exclude
        end % if subDirList(i).isdir
    end % for i = 3:length(subDirList)
    
    % all subdirs have now been added. write a semicolon after the current
    % dir and update the checkDirCt
    
    dirList{checkDirCt} = [dirList{checkDirCt},pathsep];
    checkDirCt = checkDirCt+1;
    
    %check whether there is more to check
    more2check = ~isempty(dirList{checkDirCt});
    
end % while more2check

% update path
newPath = [dirList{1:dirListCt}];
%add at beginning
path(newPath,path);

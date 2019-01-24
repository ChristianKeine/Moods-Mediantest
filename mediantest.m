function [p,tab,chi2,labels] = mediantest(varargin)

% TEST INPUTS, can either be several data groups, or data vector and group
% vector or matrix with columns 'data' and 'group' or table with columns
% data/group
inputClass = class(varargin{1});

switch inputClass
    case 'table'
        t = varargin{1};
        data = t.data;
        groups = t.groups;
    case 'double'
        if numel(varargin)>2 % assume data entered as several input arguments
          % SORT DATA
          sortFun = @(x) reshape(x,numel(x),1)
            
          nGroups = numel(varargin);
          g = cell(nGroups,1);
          data = cell(nGroups,1);
        end
        
        
        
end


nGroups = numel(varargin);


g = cell(nGroups,1);
data = cell(nGroups,1);
for iG=1:nGroups
   g{iG} = repmat(iG,size(varargin{iG}(:)));
   data{iG} = varargin{iG}(:);
end

[tab,chi2,p,labels] = crosstab(cell2mat(data)>median(cell2mat(data)),cell2mat(g));
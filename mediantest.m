function [p,tab,chi2,labels] = mediantest(varargin)

% TEST INPUTS, can either be several data groups, or data vector and group
% vector or matrix with columns 'data' and 'group' or table with columns
% data/group
inputClass = class(varargin{1});

inputData = varargin;

switch inputClass
    case 'table'
        t = inputData{1};
        data = t.data;
        groups = t.groups;
    case 'double'  
        if numel(inputData)<2 % NOT ENOUGH GROUPS
        warning('Please specify at least two groups.'), return
        elseif numel(inputData)>2 % assume data entered as several input arguments
            % SORT DATA
            [data, groups] = sortData(inputData);
            
            
        elseif numel(inputData) == 2 % COULD BE TWO GROUPS OR DATA/GROUP
            isCat = cellfun(@iscategorical, inputData);
            if any(isCat) % IF ONE VECTOR IS CATEGORICAL ONE INPUT ARE DATA SECOND IS GROUP
                data = inputData{~isCat};
                groups = inputData{isCat};
            else
                [data, groups] = sortData(inputData);
            end
        end     
end

[tab,chi2,p,labels] = crosstab(data>median(data),groups);

end

function [data,groups] = sortData(inputData)
nGroups = numel(inputData);
g = cell(nGroups,1);
d = cell(nGroups,1);

for iG=1:nGroups
    g{iG} = repmat(iG,size(inputData{iG}(:)));
    d{iG} = inputData{iG}(:);
end

groups = cell2mat(g);
data = cell2mat(d);

end


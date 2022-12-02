function [ois, oisDates, futures, futuresDates] = getdata()

fileName = "Data.xlsx";

[data,txt,raw] = xlsread(fileName, "ois", '', 'basic');
futures = cell2mat(raw(5:end,1:end));

dates = cell2mat(raw(3:end,1));
dates = dates + datenum(1899,12,30);

% Remove dates which include NaN values for any asset
ind = ~any(isnan(futures),2);
dates = dates(ind);
futures = futures(ind,:);

% Change order (oldest value first)

dates = dates(end:-1:1);
prices = prices(end:-1:1,:);

[data,txt,raw] = xlsread(fileName, "future", '', 'basic');
ois = cell2mat(raw(1:end,1:end));

% dates = cell2mat(raw(3:end,1));
% dates = dates + datenum(1899,12,30);
% 
% % Remove dates which include NaN values for any asset
% ind = ~any(isnan(prices),2);
% dates = dates(ind);
% prices = prices(ind,:);
% 
% % Change order (oldest value first)
% 
% dates = dates(end:-1:1);
% prices = prices(end:-1:1,:);

end
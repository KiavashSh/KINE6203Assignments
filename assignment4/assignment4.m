clear all
clc
% Import data from the CSV file 'isok_data_6803.csv'. The data starts from row 2, and all columns are imported.
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile("isok_data_6803.csv", [2, Inf]);


% Calculate the individual and group mean isometric strength values for males and females using the genderIsoCalc function
[maleIsoIndMean,femaleIsoIndMean, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc (Gender, Day1, Day2, Day3);


% Determine which subjects show an increase in strength from Day 1 to Day 2, and from Day 2 to Day 3 using the dayComparer function
[day1toDay2] = dayComparer (SubjectID, Day1, Day2);
[day2toDay3] = dayComparer (SubjectID, Day2, Day3);


% Normalize the strength data by body weight for each day, and calculate the mean normalized strength for each day using the Norm function
[normDay1mean,normDay2mean, normDay3mean] = Norm (SubjectID, Weight, Day1, Day2, Day3);

%we cannot have a table with different number of rows in each column in
%matlab. we have two choice. the option one is transpose all of our data
%and then store them in a table to have a column with the equal number of
%rows in each column. the second option is that we convert numbers to cells
%and then create a cell arrays. In this case matlab is not going to give us error for the length of the rows. So I chose the second option. 




% Convert numeric arrays (double) to cell arrays to facilitate storing in a cell array.
% This step is necessary because MATLAB cannot directly assign numeric values to a cell array
maleIsoIndMean = num2cell(maleIsoIndMean);
femaleIsoIndMean = num2cell(femaleIsoIndMean);
maleGroupIsoMean= num2cell(maleGroupIsoMean);
femaleGroupIsoMean = num2cell(femaleGroupIsoMean);
day1toDay2 = num2cell(day1toDay2);
day2toDay3 = num2cell(day2toDay3);
% Convert table values for each normalized day to arrays and then to cell arrays.
normDay1mean = num2cell(table2array(normDay1mean));
normDay2mean = num2cell(table2array(normDay2mean));
normDay3mean = num2cell(table2array(normDay3mean));
% Find the maximum length of all arrays to ensure the resultsCell has enough rows.
maxL = max([length(maleIsoIndMean), length(femaleIsoIndMean), length(maleGroupIsoMean), length(femaleGroupIsoMean), length(day1toDay2), length(day2toDay3), length(normDay1mean), length(normDay2mean), length(normDay3mean)]);
% Initialize a cell array to store all data, with rows equal to maxLength and 9 columns.
resultsCell = cell(maxL, 9); 
% Collect all the data arrays into a single cell array to be used for filling resultsCell.
variables = {maleIsoIndMean, femaleIsoIndMean, maleGroupIsoMean, femaleGroupIsoMean, day1toDay2, day2toDay3, normDay1mean, normDay2mean, normDay3mean};
% Loop through each variable in the variables list and assign its values to the corresponding column in resultsCell.
for i = 1:numel(variables)
    resultsCell(1:length(variables{i}), i) = variables{i};
end
% Define the header names for each column in the output CSV.
headers = {'maleIsoIndMean', 'femaleIsoIndMean','maleGroupIsoMean','femaleGroupIsoMean','day1toDay2','day2toDay3','normDay1mean','normDay2mean','normDay3mean'};
% Prepend the header row to the resultsCell array.
resultsCell = [headers; resultsCell]; 
% Write the cell array to a CSV file on the desktop.
writecell(resultsCell, 'C:\Users\Kiavash\Desktop\iso_results.csv');


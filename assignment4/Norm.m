function [normDay1mean,normDay2mean, normDay3mean] = Norm (SubjectID, Weight, Day1, Day2, Day3)
%This function normalizes the strength values for each day by dividing the strength 
%values (Day1, Day2, Day3) by the corresponding subject's weight. It then computes the 
%mean of the normalized strength values for each day across all subjects.
%inputs: SubjectID, Weight, Day1, Day2, Day3
%outputs: normDay1mean,normDay2mean, normDay3mean


    % Initialize empty tables for storing normalized strength values per subject per day
    normDay1mean = table();
    normDay2mean = table();
    normDay3mean = table();
    % Loop through each subject and normalize strength for each day
    for i=1:length(SubjectID)
        % Normalize the strength for each day and store the results in the  tables
        normDay1mean(i,:) = {SubjectID(i), (Day1(i)/Weight(i))}; % Day 1 normalization
        normDay2mean(i,:) = {SubjectID(i), (Day2(i)/Weight(i))}; % Day 2 normalization
        normDay3mean(i,:) = {SubjectID(i), (Day3(i)/Weight(i))}; % Day 3 normalization
    end

% Calculate the mean of the normalized strength for each day across all subjects
normDay1mean = mean(normDay1mean(:,2)); % Mean of normalized Day 1 values
normDay2mean = mean(normDay2mean(:,2)); % Mean of normalized Day 2 values
normDay3mean = mean(normDay3mean(:,2)); % Mean of normalized Day 3 values
end
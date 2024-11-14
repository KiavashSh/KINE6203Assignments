function [IncreaseStrength] = dayComparer (SubjectID, FisrtDay, SecondDay)
%This function takes the subject ids and two days as inputs and
%returns a matrix with the subject IDs of the subjects who had an increase from the first day to the
%second day (it should also work for the second day to the third day).
%inputs: SubjectID, FisrtDay, SecondDay
%outputs: IncreaseStrength

 % Initialize output variable
IncreaseStrength=[]; %store Subject IDs of subjects with strength increase
counter1=1;
    % Loop through each subject and check for an increase in strength
        for i=1:length(SubjectID)
            if FisrtDay(i)<SecondDay(i)
             % If the strength on the second day is greater than the first day, record the subject's ID
                IncreaseStrength(counter1,:)= SubjectID(i); % Store the subject ID
                counter1=counter1+1; % Increment the counter for the next subject
            end
        end
end





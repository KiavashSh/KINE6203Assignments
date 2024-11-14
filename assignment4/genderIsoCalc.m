function [maleIsoIndMean,femaleIsoIndMean, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc (Gender, Day1, Day2, Day3)
%this function returns four outputs. The first set of outputs (one
%for males and one for females) should return a matrix with individual mean isometric strength
%values across all 3 days of lifting for the appropriate group. The second set of outputs will return the
%single mean value for each group (mean of subject means).
%inputs: Gender, Day1, Day2, Day3
%outputs:maleIsoIndMean,femaleIsoIndMean, maleGroupIsoMean, femaleGroupIsoMean

% Initialize output variables
maleIsoIndMean= [];% store individual means for males
femaleIsoIndMean= []; % store individual means for females
counter1=1; % Counter for male participants
counter2=1; % Counter for female participants


% Loop through each participant and compute individual means
        for i=1:length(Gender)
        % Check gender and compute individual mean for each participant
                if Gender(i)=="M"
                    maleIsoIndMean(counter1,:)=[(Day1(i)+Day2(i)+Day3(i))/3]; % Mean across three days for male
                    counter1=counter1+1; % Increment counter for males
                else
                    femaleIsoIndMean(counter2,:)=[(Day1(i)+Day2(i)+Day3(i))/3];  % Mean across three days for female
                    counter2=counter2+1; % Increment counter for females
                end
        end
 % Calculate the sum of isometric strengths for males and females
 SumMale=0;
 SumFemale=0;
    % Sum the individual means for males

        for i=1:length(maleIsoIndMean)
            SumMale = SumMale + maleIsoIndMean(i,1);  % Add each male's mean to total
        end
    % Sum the individual means for females
   
        for i=1:length(femaleIsoIndMean)
            SumFemale = SumFemale + maleIsoIndMean(i,1); % Add each female's mean to total
        end
% Calculate the group mean for males and females        
maleGroupIsoMean=SumMale/length(maleIsoIndMean); % Mean of male group
femaleGroupIsoMean = SumFemale/length(maleIsoIndMean); % Mean of female group
end
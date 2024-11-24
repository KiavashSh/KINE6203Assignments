function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Kiavash Sharifi
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;     % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

while level ~= 1 && level ~= 2 && level ~= 3  %Bug 1 found: if the user should enter a level from 1 to 3, 
    % it must be level ~= 1 && level ~= 2 && level ~= 3 to check if the user correctly enters the number but the original version was
    %level ~= beginner || level ~= moderate || level ~= advanced that was
    %wrong because it does not contain the numbers. Also The condition
    %should ensure that level is not equal to any of the valid options.That
    %is why the || replaced with &&. The original condition will always evaluate to true. Here’s why:
    %If level is  1, level ~= 2 || level ~= 3 is true, making the entire condition true.
    %If level is 2, level ~= 1 is true, so the condition remains true.
    %If level is 3, level ~= 1 || level ~= 2 is true, so again, the entire
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner %Bug 2 found: I found this by trying to run the code and getting a incorrect use of '=' error message.
%level = beginner, stores beginner in level. However, level == beginner checks if the value of level is beginner.        

highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
highest = advancedHighest; %Bug 3 found: advancedhighest should be advancedHighest        
end

% randomly select secret number between 1 and highest for level of play

secretNumber = floor(rand() * highest);  %Bug 4 found: for generating a number between 1 and the highest the appropriate approach 
% is rounding a random number between 0 and 1 and multiply it by the
% highest value but the original version (floor(rand() + 1 * highest))
% rounded a value between the highest value and the highest value + rand()

% initialize number of guesses and User_guess

numOfTries = 1; %Bug 5 found: it should start with 0 otherwise when it wants to check if it exceed the alowable number of try
% it gives you one other chance to guess a number
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user
if numOfTries >5 %Bug 6 found: for showing Game Over there must be a condition that meets it and this is numOfTries >20. Also this 
    % condition is seperate from the previous condition. Therefore, elseif
    % should be here  to difrentiate between this condition and the
    % previous condition
fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
break %Bug 7 found:To avoid continuing the while loop, I wrote a break statement to exit the loop if the user gets a game over.
end

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');
while userGuess < 1 || userGuess >= highest

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made




% report whether the user's guess was high, low, or correct

if userGuess < secretNumber %Bug 8 found: if the user guess is too low it should be userGuess < secretNumber but the original code was userGuess > secretNumber
fprintf('Sorry, %d is too low.\n', userGuess);

elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);

elseif numOfTries == 1 & userGuess == secretNumber   %Bug 9 found: we shoudl have two condition here: the first one should check if it is the first time they guess and got the correct answer 
    % that is shown by this code. the other thing that should be considered is if the userGuess is the secretNumber (userGuess == secretNumber) 
fprintf('\nLucky You!  You got it on your first try!\n\n');
else

fprintf('\nCongratulations!  You got %d in %d tries.\n\n',secretNumber,numOfTries);%Bug 10 found: for the first %d in "You got %d in %d tries" 
% the code should returns secretNumber and for the second %d it should
% return numOfTries. in the original version which was
% fprintf('\nCongratulations!  You got %d in %d tries.\n\n',secretNumber)
% it returns secretNumber for both ds.

end  % of guessing while loop
numOfTries = numOfTries + 1;%Bug 11 found:the increment should be after checking all of the conditional functions. 
% otherwise when it returns numOfTries the number would be one more than
% the actual number of try
end %Bug 13 found: there was no end for the while loop in the original code. the end of loop should be the place after 
% checking all of the possibility of the user guess

% end of game
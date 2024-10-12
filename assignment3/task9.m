%This function takes a string value as input and returns the length of the 
%string and the first and last character as outputs.
%Inputs : One string
%Output : The length of the string and the first and last character
function [len, firstl, lastl] = task9(name)
%Matlab reads a string as a one character and cannot returns length of a
%string or the first and the last character as a string is just one
%character by itslef. So we should change the type of string to character
%first
%Change input to character if it is not (if it is string)
   name = char(name);
%length function gives the length of a character
   len = length(name);
%name(1) is the first letter of the input
   firstl = name(1);
   %Name(length(name)) is the last letter of the input
   lastl = name(length(name));
end
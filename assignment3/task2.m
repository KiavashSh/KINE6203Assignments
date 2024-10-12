% This function takes 2 numbers as input and returns values for the sum,
%difference, product and max of the two numbers as outputs.

%Input : 2 numbers
% Output : Values for the sum, difference, product and max of the input values

function [diff, sum, pr, max]=task2(num1,num2)
%  This if checks which number is grater than the other one and works with
%  both negative and positive values
if abs(num1)>abs(num2)
    %Store the difference of num1 and num2 to diff
    diff= abs(num1-num2);
    %Store the maximum of num1 and num2 to max
    max = num1;
else
    diff= abs(num2 - num1);
    max= num2;
end
%Store the sum and product of num1 and num2 to sum and pr respectively
sum= num1+num2;
pr=num1*num2;

end

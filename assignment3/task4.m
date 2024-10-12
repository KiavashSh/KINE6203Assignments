function [sum]=task4(quarters, dimes, nickels, pennies)
%This function  takes in a number of quarters, dimes, nickels, and pennies
%as inputs and returns the total amount as output.

%Input : Number of quarters, dimes, nickels, and pennies
%Output : The total amount as output

%A penny is worth 0.01 US dollars
%A nickel is worth 0.05 US dollars
%A dime is worth 0.1 US dollars
%A quarter is worth 0.25 US dollars
pen = 0.01*pennies;
nick = 0.05*nickels;
dim = 0.1*dimes;
quar = 0.25*quarters;
sum = pen+nick+dim+quar;
end

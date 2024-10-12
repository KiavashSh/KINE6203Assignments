%This function takes 2 numbers as inputs and returns Woo if their sum is
%even and Hah if their sum is odd.

%Input: 2 numbers
%Output : Woo if the sum of numbers is even and Hah if the sum of numbers is odd
function [evenorodds]=task3(num1,num2)
sum=num1+num2;
%Mod function returns the remainder after division of sum by 2
Mod = mod(sum,2);
% If sum is devisible by 2 it returns Woo. Ohterwise, it returns Hah
if Mod==0
    evenorodds="Woo";
else
    evenorodds="Hah";
end
%you can also create an output like task3(num1,num2) and instead
%disp("Woo") approach, write disp("Woo")
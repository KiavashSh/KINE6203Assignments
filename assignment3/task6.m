%This function takes a number as input and returns true if the number is a
%prime number and false if the number is not prime.
%Input : One number
%Output : Returns true if the number is a prime number and false if the number is not prime

function [isprime]=task6(a)
%If a <= 1 the number is not prime and if a <= 3 the number is prime.
    if a<=1
        isprime = "false";
    elseif a<=3
        isprime = "true";
    else
        isprime = "true";
%If the input is divisible by from 2 to the square root of it, it is not prime. 
% If not,the input is prime and the for loop will be broken  
        for i = 2 : sqrt(a)
            if mod(a,i) == 0
                isprime = "false";
                break
            end
        end
    end
end

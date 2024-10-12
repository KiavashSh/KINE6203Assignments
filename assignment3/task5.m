function [tri]=task5(num1)
%This function accepts a single 3-element array (e.g. [3 4 5]), and returns a logical value (0 or 1) 
% indicating if the 3 elements of the array represent the sides of a valid triangle.

%Input: a 3-element array 
%Output: a logical value (0 or 1)
%First of all we want to define the min, max and the median of arrays. 
max = num1(1);
min = num1(1);
mid = num1(1);
%Min, max and mid should have a default value so that they can be
%comparable in the following loops



%Find maximum from element 1 to the last element and store it in max 
for i=1:length(num1)
    if num1(i)>max
        max = num1(i);
    end
end



%Find minimum from element 1 to the last element and store it in min
for i=1:length(num1)
    if num1(i)<min
        min = num1(i);
    end
end



%Find median from element 1 to the last element and store it in mid. Here
%as we have just 3 elements, the one that is not min or max is the median 
for i=1:length(num1)
    if num1(i)~=min && num1(i)~=max
        mid = num1(i);
    end
end



%Check to see if the inputs represent the sides of a valid triangle. The sum of the lengths of the 2
%shorter sides should be greater than the length of the longest side.
if min+mid>max
    tri=1;
else
    tri=0;
end


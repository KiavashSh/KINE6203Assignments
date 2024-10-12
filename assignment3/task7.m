%This function takes two vectors and plots their values on a figure. This
%function should set up the figure with titles for the chart and each axis (can be
%generic names).
%Input : Two vectors with the same size
%Output : Plot two vectors on a figure 
function [pl]=task7(v1,v2)
pl = plot(v1,v2);
%Title function gives the plot a title
title('v1 and v2 value on the table')
%Xlabel and ylabel functions give anem to the x axis and y axis
xlabel('v1')
ylabel('v2')
end
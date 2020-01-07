
%
% Initialize data
%
% This file opens a blank Matlab figure that you can click on with the mouse 
% to create 2D data points.  The resulting points are grouped into Matlab cell
% arrays, which contain individual (sub-)vectors. Each consecutive sequence of
% clicks, separated by pressing enter, creates a distinct array within the 
% cell array. Pressing enter twice terminates the program and saves the data
% to disk. You can then write your own separate Matlab script to load and display
% the data as you see fit. It also saves out the Figure's axis data, 'v'.

clear all; close all;

figure();

i = 1;
axis([0 1 0 1]);
while true
    % enter sequence of clicks
    [x{i},y{i}]=ginput;
    % breaks out of the loop when you have pressed enter twice in a row
    hold on;
    plot(x{i},y{i},'*'); %draw the points on screen
    if isempty(x{i}) 
        x(i)=[]; y(i)=[]; % delete the empty segment
        break; 
    end
    
    i=i+1;
end
x
v=axis;
clf;
save('data.mat','x','y','v');

load data.mat

plot(x,y,'o');



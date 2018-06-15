function [seam] = getMinSeam(E)

h = size(E,1);
w = size(E,2);

dp = makeSeamTable(E,h,w);
seam = backtrackMinSeam(dp,h,w);
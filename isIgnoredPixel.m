function [is_ignored] = isIgnoredPixel(ignore,h,w)
% ignore is a 4-vec in the form [xmin ymin width height]

is_ignored = w>=ignore(1) && w<ignore(1)+ignore(3) && h>=ignore(2) && h<ignore(2)+ignore(4);
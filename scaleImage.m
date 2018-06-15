function [new_image] = scaleImage(image, w_factor)

new_image = image;

w = size(image, 2);

num_seams=floor((1-w_factor) * w);

for i=1:num_seams
    E = rgb2gray(imfilter(new_image, fspecial('sobel')));
    seam = getMinSeam(E);
    new_image = seamCarve(new_image,seam);
end

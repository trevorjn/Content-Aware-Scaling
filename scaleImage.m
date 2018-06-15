function [new_image] = scaleImage(image, w_factor)

new_image = image;

w = size(image, 2);

num_seams=floor((1-w_factor) * w);

for i=1:num_seams
    v_grad = imfilter(new_image,fspecial('sobel'));
    h_grad = imfilter(new_image,fspecial('sobel')');
    % Compute energy map as gradient magnitude
    E = rgb2gray(sqrt(v_grad.^2 + h_grad.^2));
    seam = getMinSeam(E);
    new_image = seamCarve(new_image,seam);
end

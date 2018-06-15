function [new_image] = seamCarve(image, seam)

h = size(image,1);
w = size(image,2);

new_image = zeros(h,w-1,3);
for i=1:h
    % Copy left half of image
    new_image(i,1:max([1 seam(i)-1]),:) = image(i,1:max([1 seam(i)-1]),:);
    % Copy right half of image, overwriting seam
    new_image(i,seam(i):w-1,:) = image(i,(seam(i)+1):w,:);
end
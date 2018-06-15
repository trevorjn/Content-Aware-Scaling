function [] = drawSeams(image)

E = rgb2gray(imfilter(image, fspecial('sobel')));

h = size(image,1);
w = size(image,2);

dp = makeSeamTable(E,h,w);

for seam_num=1:w
    figure(2);
    imshow(image);
    
    seam = zeros(1,h);
    
    seam(h) = seam_num;
        
    for i=h-1:-1:1
        prev = seam(i+1);
        mid_cost = dp(i,prev);

        if (prev == 1)
            % On left edge
            right_cost = dp(i,prev+1);

            [~, delta] = min([mid_cost right_cost]);
            delta = delta - 1; % map [1 2] to [0 1]

        elseif (prev == w)
            % On right edge
            left_cost = dp(i,prev-1);

            [~, delta] = min([left_cost mid_cost]);
            delta = delta - 2; % map [1 2] to [-1 0]

        else
            % Default case; not on either edge
            left_cost = dp(i,prev-1);
            right_cost = dp(i,prev+1);

            [~, delta] = min([left_cost mid_cost right_cost]);
            delta = delta - 2; % map [1 2 3] to [-1 0 1]

        end
        
        seam(i) = min([w max([1 prev + delta])]);
        image(i,seam(i),:) = [255 0 0];
    end
end

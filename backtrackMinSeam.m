function [seam] = backtrackMinSeam(dp,h,w)

seam = zeros(1,h);

[~, seam(h)] = min(dp(h,:));
for i=h-1:-1:1
    prev = seam(i+1);
    mid_cost = dp(i,prev);
    
    if (prev == 1)
        % On left column
        right_cost = dp(i,prev+1);
        
        [~, delta] = min([mid_cost right_cost]);
        delta = delta - 1; % map [1 2] to [0 1]
        
    elseif (prev == w)
        % On right column
        left_cost = dp(i,prev-1);
        
        [~, delta] = min([left_cost mid_cost]);
        delta = delta - 2; % map [1 2] to [-1 0]
        
    else
        % Default case; not on either edge column
        left_cost = dp(i,prev-1);
        right_cost = dp(i,prev+1);
        
        [~, delta] = min([left_cost mid_cost right_cost]);
        delta = delta - 2; % map [1 2 3] to [-1 0 1]
        
    end
    % Constrain seam; ensures no out-of-bounds errors
    seam(i) = min([w max([1 prev + delta])]);
end
function [dp] = makeSeamTable(E,h,w)

dp = zeros(h, w);
dp(1,:) = E(1,:);

for i=2:h
    for j=1:w
        if (j == 1)
            % Left column
            dp(i,j) = E(i,j) + min([dp(i-1,j) dp(i-1,j+1)]);
        elseif (j == w)
            % Right column
            dp(i,j) = E(i,j) + min([dp(i-1,j-1) dp(i-1,j)]);
        else
            % Somewhere in the middle
            dp(i,j) = E(i,j) + min([dp(i-1,j-1) dp(i-1,j) dp(i-1,j+1)]);
        end
    end
end
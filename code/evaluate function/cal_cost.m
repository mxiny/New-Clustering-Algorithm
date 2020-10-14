% 计算目标函数的值
function [cost, ave] = cal_cost(data, S, W)
    [N, K] = size(W);
    [~, C] = max(W, [], 2);
    
    % 计算cost   
    cost = 0;
    for i = 1:N
        c = C(i);
        n = 0;
        m = 0;
        for j = 1:N
           n = n + W(j, c) * S(i, j);
           m = m + S(i, j);
        end
        cost = cost + log(m) - log(n);
    end
    
    % 计算ave
    % 计算类中心点
    centers = zeros(K, size(data, 2));
    cnt = zeros(K, 1);
    for i = 1:N
        centers(C(i), :) = centers(C(i), :) + data(i, :);
        cnt(C(i)) = cnt(C(i)) + 1;
    end
    for i = 1:K
        centers(i, :) = centers(i, :) ./ cnt(i);
    end
    
    % 计算点到类中心的距离代价
    ave_distance = zeros(K, 1);
    for i = 1:N
         ave_distance(C(i)) = ave_distance(C(i)) + norm(data(i, :) - centers(C(i), :), 2);
    end
    ave = sum(ave_distance);
end
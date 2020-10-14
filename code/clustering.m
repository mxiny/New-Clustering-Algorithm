function [C, W] = clustering(data, S, W, lambda, iter)
    [N, K] = size(W);
%     array_cost = zeros(1, iter);
%     array_ave = zeros(1, iter);
    for time = 1:iter
        delta_W = zeros(N, K);
        [~, C] = max(W, [], 2);
        Temp = zeros(N, 1);
        for i = 1:N
            for k = 1:N
                Temp(i) = Temp(i) + W(k, C(k)) * S(i, k);
            end
        end
        
        for j = 1:N
            for i = 1:N
                delta_W(j, C(i)) = delta_W(j, C(i)) + (-1 / Temp(i)) * S(j, i);
            end
        end
        
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
       
        for i = 1:N
            delta_W(i, C(i)) = delta_W(i, C(i)) + norm(data(i, :) - centers(C(i), :), 2);
        end
        
        W = W - lambda * delta_W;
%         [cost, ave] = cal_cost(data, S, W);
%              
%         array_cost(time) = cost;
%         array_ave(time) = ave;
        
    end
%     plot(array_ave + array_cost);
end
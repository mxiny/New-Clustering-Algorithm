function [C, W] = smoothing(S, W, lambda, iter)    
    [N, K] = size(W);
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
        
        W = W - lambda * delta_W;
    end
end
% ������Ŀk
K = 6;
e = 0.12;
lambda = 0.1;
iter1 = 1000;
iter2 = 10;

% data = importdata("wdbc.data");
% [N, dim] = size(data);
% label = data(:, 2);
% data = data(:, 3:dim);

% data = importdata("iris.data");
% [N, dim] = size(data);
% label = data(:, dim);
% data = data(:, 1:dim-1);

% data = importdata("wine.data");
% [N, dim] = size(data);
% label = data(:, 1);
% data = data(:, 2:dim);

data = importdata("Compound.txt");
[N, dim] = size(data);
label = data(:, dim);
data = data(:, 1:dim-1);


% ��һ����������
min_val = repmat(min(data), N, 1);
max_val = repmat(max(data), N, 1);
data = (data - min_val) ./ (max_val - min_val);

% �����ڽӾ������
D = zeros(N, N);
for i = 1:N
    for j = 1:N
        D(i, j) = norm(data(i, :) - data(j, :), 2);
    end
end

% �����ڽ�ָʾ����
S = (D - e) < 0;

% Kmeans�������
% C = kmeans(data, K);

% DBSCAN�������
% C = DBSCAN(data, 0.5, 8);
% C = C + 1;

% Spectral Cluster�������
% [C] = spectral_clust(data, K, 1);

% W = trans_one_hot(C, K);

% ���㷨�������
W = rand(N, K);
[~, W] = clustering(data, S, W, lambda, iter1);
[C, W] = smoothing(S, W, lambda, iter2);


% [cost, ave] = cal_cost(data, S, W);
% disp("cost:  ");
% disp(cost);
% disp("ave: ");
% disp(ave);

ClusteringMeasure(C, label)
plot_color(data, C);

function W = trans_one_hot(C, K)
    N = size(C, 1);
    W = zeros(N, K);
    for i = 1:N
        W(i, C(i)) = 1;
    end
end
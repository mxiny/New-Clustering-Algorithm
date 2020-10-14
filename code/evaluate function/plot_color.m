% ×÷²ÊÉ«É¢µãÍ¼
function plot_color(data, C)
    colorlist = ['r', 'g', 'c', 'k', 'b', 'm', 'y', 'w'];
    N = size(data, 1);
    for i = 1:N
        scatter(data(i, 1), data(i, 2), colorlist(C(i)));
        hold on;
    end
end
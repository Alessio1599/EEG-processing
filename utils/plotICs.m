function [] = plotICs(t,ICs)

[n m]=size(ICs);
ICs_names=[1:n];
ICs_names = strcat('IC ', arrayfun(@num2str, ICs_names, 'UniformOutput', false));


delta=100;
figure
for i = 1:n
	plot(t,ICs(i,:)-(i-1)*delta)
	hold on
    grid on
end
ylim([-n*delta,delta])
yticks([(-n+1)*delta:delta:0])
yticklabels(fliplr(ICs_names))
title('Independent components')
xlabel('Time[sec]')

end
function [] = plot_EEGs(t,EEG, ch_names)

[n m]=size(EEG);
delta=100;
figure
for i = 1:n
	plot(t,EEG(i,:)-(i-1)*delta)
	hold on
    grid on
end
ylim([-n*delta,delta])
yticks([(-n+1)*delta:delta:0])
yticklabels(fliplr(ch_names))

end
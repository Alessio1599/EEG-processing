function [] = plot_PSDs(F, P, ch_names)

figure
for i=1:n
    subplot(ceil(sqrt(n)),ceil(sqrt(n)),i) 
    %subplot(int(n/2), int(n/2), i) line assumes that n is even. If n is odd, you may need to adjust the subplot indices accordingly.
    plot(F,P(i,:))
    xlabel('Frequency[Hz]')
    xlim([0.5,40])
    title(ch_names(i))
end 
end 
function [P, F] = compute_plot_PSDs(X, ch_names, WINDOW, NOVERLAP, NFFT, srate)
% plot_PSDs calculates and plots the Power Spectral Densities (PSDs) for each channel of the input signal matrix.
%
% Inputs:
%   X        - [n x m] matrix, where n is the number of channels and m is the number of samples.
%   ch_names - Cell array of strings containing the names of each channel.
%   WINDOW   - Vector or scalar specifying the length of the window used in the Welch method.
%   NOVERLAP - Scalar specifying the number of samples the sections overlap.
%   NFFT     - Scalar specifying the number of FFT points.
%   srate    - Scalar specifying the sampling rate of the signal.
%
% Outputs:
%   P        - [n x (NFFT/2+1)] matrix, where each row contains the PSD of the corresponding channel.
%   F        - Vector containing the frequency values corresponding to the PSD estimates.
%
% The function calculates the PSD using Welch's method for each channel, plots them in a grid layout,
% and labels each subplot with the corresponding channel name. The x-axis of the plots is limited to [0.5, 40] Hz.
%
% Example usage:
%   [P, F] = plot_PSDs(X, {'Channel 1', 'Channel 2', 'Channel 3'}, 256, 128, 512, 1000);
%


%this function automatically create the grid for the subplots
%also return the values for the PSD 

[n m]=size(X);
[P,F]=pwelch(X',WINDOW,NOVERLAP,NFFT,srate);
P=P';

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

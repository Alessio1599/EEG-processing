clc
clear all
close all

% Step 1: Get the full path of the current script
current_script = mfilename('fullpath'); %current_dir = pwd; I cannot use this since I am using VScode
current_dir = fileparts(current_script);
base_dir = fileparts(current_dir);
data_dir = fullfile(base_dir, 'data');
utils_dir = fullfile(base_dir, 'utils');

addpath(utils_dir)

data = load(fullfile(data_dir, 'sub-035_ses-01_task-Rest_eeg.mat'));
disp('Loaded variables:')
disp(data)

X = data.X;
ch_names = data.ch_names;
srate = data.srate;
stim_samples = data.stim_samples;
stim_types = data.stim_types;

%% Transform from single to double precision; Resampling
X = double(X);

[n_or, m_or] = size(X);
disp(['Original number of channels: ', num2str(n_or)])
disp(['Original number of samples: ', num2str(m_or)])

p = 1;
q = 2;
srate_or = srate; % Original sampling rate
srate = srate_or * p/q; % New sampling rate
Xresampled = resample(X', p, q); % resamples the input sequence, x, at p/q times the original sample rate
X = Xresampled';

stim_samples_or = stim_samples;
stim_samples = floor(stim_samples * p/q);

[n, m] = size(X);
disp(['Number of channels: ', num2str(n)])
disp(['Number of samples: ', num2str(m)])

%% LINEAR DETRENDING
Xdetrended = detrend(X');
X = Xdetrended';

Ts = 1/srate;
t = 0:Ts:(m-1)*Ts;
plot_EEGs(t, X, ch_names)

%% PSD 
window = 10*srate; 
NFFT = window;
NOVERLAP = [];

compute_plot_PSDs(X, ch_names, window, NOVERLAP, NFFT, srate);


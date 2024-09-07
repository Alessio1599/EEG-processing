# EEG-analysis
> Check the codes that you wrote, on matlab, you wrote few comments

> Move the files in the proper folders: preprocessing and time analysis

> do the preprocessing steps

> search for an online database for oddball task!

This repository is designed to apply initial preprocessing steps to EEG data collected during a 3-stimulus auditory oddball task. The data preprocessing includes various signal processing techniques essential for preparing the EEG data for further analysis.
## 3-stimulus auditory oddball task
The experiment consists of a 3-stimulus auditory oddball task, where the subject is exposed to three types of auditory stimuli:

- Standard Stimulus: 440 Hz sinusoidal tone (70% of trials)
- Target Stimulus: 660 Hz sinusoidal tone (15% of trials)
- Distractor Stimulus: Naturalistic sound (15% of trials)
Each stimulus lasts for 200 ms with a random inter-stimulus interval. The subject's task is to mentally count the target stimuli while ignoring the standard and distractor stimuli.

## Data description
The .mat file, sub-035_ses-01_task-Rest_eeg.mat, contains the following variables:
- X: EEG data organized as a 2-D matrix whit size 𝑛 × 𝑚 where 𝑛 is the number of electrodes and 𝑚 the number of time samples.
- ch_names: cell array containing the labels of the 𝑛 electrodes.
- srate: containing the value of the sampling rate.
- stim_samples: array containing the time samples at which the stimuli were applied
- stim_types: cell array indicating the type of each applied stimulus (labels: ‘standard’, ‘target’, ‘distractor’)

## Preproessing steps
- **Resampling**
- **Linear detrending**: Remove linear trends from the EEG data.
- **Filtering**: Apply low-pass, high-pass, and notch filters to clean the signal.
- **Power Spectral Density (PSD) computation**
- **Epoching**: Segment the continuous EEG data into epochs around each stimulus.
- **Identification of bad channels** using the correlation method
- **Removal of bad channels**:Exclude identified bad channels from the data.


## Useful functions
- resample: Resamples the values of a uniformly sampled signal.
- pwelch: Computes the power spectral density using Welch’s method.
- ellipord and ellip: Design low-pass and high-pass elliptic filters.
- iirnotch: Design a notch filter.
- filtfilt: Apply zero-phase digital filtering.
- freqz: Plot the frequency response of a filter


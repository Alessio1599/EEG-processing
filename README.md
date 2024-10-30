# EEG-analysis
> Check the codes that you wrote, on matlab, you wrote few comments

> Move the files in the proper folders: preprocessing and time analysis

> do the preprocessing steps

> search for an online database for oddball task!

This repository is designed to apply initial preprocessing steps to EEG data collected during a 3-stimulus auditory oddball task. The data preprocessing includes various signal processing techniques essential for preparing the EEG data for further analysis.

## Table of content
- [EEG-analysis](#eeg-analysis)
  - [Table of content](#table-of-content)
  - [Directory structure](#directory-structure)
  - [3-stimulus auditory oddball task](#3-stimulus-auditory-oddball-task)
  - [Another possible dataset](#another-possible-dataset)
  - [Data description](#data-description)
  - [Useful functions](#useful-functions)
  - [Tools](#tools)


## Directory structure
```
├── LICENSE
├── README.md
├── frequency_analysis
│   └── README.md
├── preprocessing
│   ├── README.md
│   ├── main.m
│   └── preprocessing.m
└── time_analysis
    ├── README.md
    └── time-domain-analysis.m
```


## 3-stimulus auditory oddball task
The experiment consists of a 3-stimulus auditory oddball task, where the subject is exposed to three types of auditory stimuli:

- Standard Stimulus: 440 Hz sinusoidal tone (70% of trials)
- Target Stimulus: 660 Hz sinusoidal tone (15% of trials)
- Distractor Stimulus: Naturalistic sound (15% of trials)
Each stimulus lasts for 200 ms with a random inter-stimulus interval. The subject's task is to mentally count the target stimuli while ignoring the standard and distractor stimuli.

## Another possible dataset
- [ EEG data from an auditory oddball task. OpenNeuro](https://openneuro.org/datasets/ds003061/versions/1.1.1/file-display/task-P300_events.json)
  - The only difference is that i don't think that is a matlab file

## Data description
The .mat file, sub-035_ses-01_task-Rest_eeg.mat, contains the following variables:
- X: EEG data organized as a 2-D matrix whit size 𝑛 × 𝑚 where 𝑛 is the number of electrodes and 𝑚 the number of time samples.
- ch_names: cell array containing the labels of the 𝑛 electrodes.
- srate: containing the value of the sampling rate.
- stim_samples: array containing the time samples at which the stimuli were applied
- stim_types: cell array indicating the type of each applied stimulus (labels: ‘standard’, ‘target’, ‘distractor’)


## Useful functions
- resample: Resamples the values of a uniformly sampled signal.
- pwelch: Computes the power spectral density using Welch’s method.
- ellipord and ellip: Design low-pass and high-pass elliptic filters.
- iirnotch: Design a notch filter.
- filtfilt: Apply zero-phase digital filtering.
- freqz: Plot the frequency response of a filter

## Tools
- EEGLAB
- Fieldtrip
- MNE

> I can do the matlab and also the python implementation
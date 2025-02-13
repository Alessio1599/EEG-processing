# EEG-analysis
This repository is designed to apply initial preprocessing steps to EEG data collected during a 3-stimulus auditory oddball task. The data preprocessing includes various signal processing techniques essential for preparing the EEG data for further analysis.

This project includes implementations in both Python (MNE) and MATLAB.

## Table of content
- [EEG-analysis](#eeg-analysis)
  - [Table of content](#table-of-content)
  - [Directory structure](#directory-structure)
  - [3-stimulus auditory oddball task](#3-stimulus-auditory-oddball-task)
  - [Data description](#data-description)
  - [Preprocessing steps](#preprocessing-steps)
  - [MATLAB Useful functions](#matlab-useful-functions)
  - [Tools](#tools)
  - [Installation \& Setup](#installation--setup)
  - [Configuration instructions](#configuration-instructions)
    - [Setting Up the Configuration (Python)](#setting-up-the-configuration-python)


## Directory structure
```
eeg-processing/
├── 1_preprocessing
│   ├── README.md
│   ├── main.m
│   └── preprocessing.m
├── 2_time_analysis
│   ├── README.md
│   └── time-domain-analysis.m
├── README.md
└── utils
    ├── compute_plot_PSDs.m
    ├── plotICs.m
    ├── plot_EEGs.m
    ├── plot_IC.m
    └── plot_PSDs.m
```


## 3-stimulus auditory oddball task
The experiment consists of a 3-stimulus auditory oddball task, where the subject is exposed to three types of auditory stimuli:

- Standard Stimulus: 440 Hz sinusoidal tone (70% of trials)
- Target Stimulus: 660 Hz sinusoidal tone (15% of trials)
- Distractor Stimulus: Naturalistic sound (15% of trials)
Each stimulus lasts for 200 ms with a random inter-stimulus interval. The subject's task is to mentally count the target stimuli while ignoring the standard and distractor stimuli.


## Data description
The .mat file, `sub-035_ses-01_task-Rest_eeg.mat`, contains the following variables:
- `X`: EEG data organized as a 2-D matrix whit size 𝑛 × 𝑚 where 𝑛 is the number of electrodes and 𝑚 the number of time samples.
- `ch_names`: cell array containing the labels of the 𝑛 electrodes.
- `srate`: containing the value of the sampling rate.
- `stim_samples`: array containing the time samples at which the stimuli were applied
- `stim_type`: cell array indicating the type of each applied stimulus (labels: ‘standard’, ‘target’, ‘distractor’)

## Preprocessing steps
- Resampling
- Linear detrending
- Filtering
- Epoching
- Identification and removal of bad channels 
- Artifact removal via Independent Component Analysis
- Interpolation of bad channels

## MATLAB Useful functions
- `resample`: Resamples the values of a uniformly sampled signal.
- `pwelch`: Computes the power spectral density using Welch’s method.
- `ellipord` and ellip: Design low-pass and high-pass elliptic filters.
- `iirnotch`: Design a notch filter.
- `filtfilt`: Apply zero-phase digital filtering.
- `freqz`: Plot the frequency response of a filter

## Tools
- [EEGLAB](https://eeglab.org)
- Fieldtrip
- [MNE, Open-source Python package for exploring, visualizing, and analyzing human neurophysiological data](https://mne.tools/stable/index.html)

## Installation & Setup
```bash
git clone https://github.com/Alessio1599/EEG-processing.git
cd EEG-processing
```

```bash
python main.py
```

## Configuration instructions
The repository includes a configs directory that contains configuration files for customizing the analysis workflow.

### Setting Up the Configuration (Python)
Modify `config.yml` to adjust key parameters such as:
- low cutoff frequency
- high cutoff frequency
- Notch filter frequency
- Resample frequency
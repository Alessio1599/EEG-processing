# EEG-Preprocessing
The aim of this repository is to apply some first steps of preprocessing to the EEG data.
3-stimulus auditory oddball task
The .mat file contains:
- X: EEG data organized as a 2-D matrix whit size 𝑛 × 𝑚 where 𝑛 is the number of electrodes and 𝑚 the number of time samples.
- ch_names: cell array containing the labels of the 𝑛 electrodes.
- srate: containing the value of the sampling rate.
- stim_samples: array containing the time samples at which the stimuli were applied
- stim_types: cell array indicating the type of each applied stimulus (labels: ‘standard’, ‘target’, ‘distractor’)

## Preproessing steps
- Resampling
- Linear detrending
- Filtering (Low-pass, high-pass and notch filter)
- Computation of the Power Spectral Density (PSD)
- Epoching
- Identification of bad channels using the correlation method
- Removal of bad channels

## Time Domain Analysis: ERP waveforms and topographical maps (Within- Subject Analysis, i.e. Within Subject Averages (WSA))


## Time Domain Analysis: ERP waveforms and topographical maps (Across- Subject Analysis, i.e. Grand Averages (GA))

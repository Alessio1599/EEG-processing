# Preprocessing steps

## Table of contents
- [Preprocessing steps](#preprocessing-steps)
  - [Table of contents](#table-of-contents)
  - [Resampling](#resampling)
  - [Linear detrending](#linear-detrending)
  - [Filtering](#filtering)
  - [Epoching](#epoching)
  - [Identification  and removal of bad channels via correlation method](#identification--and-removal-of-bad-channels-via-correlation-method)
  - [Artifact removal via Independent Component Analysis](#artifact-removal-via-independent-component-analysis)
  - [Interpolation of bad channels](#interpolation-of-bad-channels)
  - [Save the preprocessed data](#save-the-preprocessed-data)
  
## Resampling

## Linear detrending
Remove linear trends from the EEG data.

## Filtering
Apply low-pass, high-pass, and notch filters to clean the signal.

## Epoching
Segment the continuous EEG data into epochs around each stimulus.

## Identification  and removal of bad channels via correlation method

## Artifact removal via Independent Component Analysis
Independent Component Analysis (ICA)
- EEGLab

The artifacts were identified based on the time pattern, topographical map and PSD of the estimated Independent Components.

## Interpolation of bad channels

## Save the preprocessed data
`sub-035_Preprocessed.mat`

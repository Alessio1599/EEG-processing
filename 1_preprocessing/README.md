# Preprocessing steps
This section describes the detailed preprocessing steps applied to EEG data to ensure it is clean and ready for analysis. These steps include resampling, detrending, filtering, epoching, identification and removal of bad channels, artifact removal via ICA, and interpolation of bad channels. Finally, the preprocessed data is saved for further analysis.

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
Resampling the EEG data is performed to standardize the sampling rate across different datasets and to reduce the computational load. This step involves changing the original sampling rate to a new, desired rate using an appropriate resampling method.

## Linear detrending
Linear detrending involves removing any linear trends present in the EEG data. These trends can arise from various sources, including slow drifts in the recording equipment. 

## Filtering
Filtering the EEG data involves applying various filters to remove unwanted frequencies:
- Low-pass filter: Removes high-frequency noise above a certain threshold.
- High-pass filter: Removes low-frequency noise and drifts below a certain threshold.
- Notch filter: Removes specific frequency bands, such as power line interference (e.g., 50/60 Hz).

## Epoching
Epoching is the process of segmenting the continuous EEG data into shorter segments (epochs) around each stimulus. This step is crucial for event-related potential (ERP) analysis, allowing the study of brain responses to specific events or stimuli.

## Identification  and removal of bad channels via correlation method
This step involves identifying bad channels that exhibit poor signal quality. The correlation method compares each channel with the others, and channels with low correlation are marked as bad and removed from further analysis.

## Artifact removal via Independent Component Analysis
Independent Component Analysis (ICA) is used to identify and remove artifacts from the EEG data. ICA separates the data into independent components, and artifacts are identified based on their time pattern, topographical map, and power spectral density (PSD). EEGLab, a popular EEG analysis toolbox, can be used for this purpose.

## Interpolation of bad channels
After identifying and removing bad channels, their data is interpolated using data from neighboring channels. This step ensures that the spatial structure of the EEG data is preserved and that no information is lost due to the removal of bad channels.

## Save the preprocessed data
The final step involves saving the preprocessed EEG data into a new file (`sub-035_Preprocessed.mat`). This file will contain the cleaned and processed data, ready for further analysis.

# main.py

import os
import scipy
import numpy as np
import matplotlib.pyplot as plt
import mne
import logging
from configs.config import cfg

# Configure logging
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")


def load_data(file_path: str) -> mne.io.RawArray:
    """ Load EEG data from a .mat file and return an MNE RawArray object."""
    if not os.path.exists(file_path):
        logging.error(f"File not found: {file_path}")
        raise FileNotFoundError(f"File not found: {file_path}")
    
    logging.info(f"Loading data from {file_path}...")
    data = scipy.io.loadmat(file_path, simplify_cells=True)
    #print(data.keys())
    #print(data.items())
    #print(data['X'])

    raw = mne.io.RawArray(data['X'], mne.create_info(ch_names=list(data['ch_names']), sfreq=data['srate']))
    raw.set_channel_types({ch: "eeg" for ch in raw.ch_names})
    #print(raw.info)
    #print(raw.get_data().shape) 
    return raw


def apply_filters(raw, cfg):
    """ Apply preprocessing filters (bandpass, notch) to the EEG data."""
    logging.info("Applying preprocessing filters...")
    preproc_cfg = cfg["preprocessing"]
    
    raw_filtered = raw.copy()  # Avoid modifying original raw data
    raw_filtered.filter(l_freq=preproc_cfg["l_freq"], h_freq=preproc_cfg["h_freq"], fir_design="firwin")
    raw_filtered.notch_filter(preproc_cfg["notch_freq"])
    
    logging.info("Filtering completed.")
    return raw_filtered

def preprocess(raw, cfg):
    preproc_cfg = cfg["preprocessing"]
    # Resampling (if enabled)
    if preproc_cfg["resample_freq"]:
        logging.info(f"Resampling from {raw.info['sfreq']} Hz to {preproc_cfg['resample_freq']} Hz...")
        raw.resample(preproc_cfg["resample_freq"])
        logging.info("Resampling completed.")

    # Linear detrending (if enabled)
    if preproc_cfg["detrend"] in [1, 2]:  # 1 = linear, 2 = quadratic
        logging.info(f"Applying detrending (mode={preproc_cfg['detrend']})...")
        raw._data = scipy.signal.detrend(raw._data, axis=1, type='linear' if preproc_cfg["detrend"] == 1 else 'quadratic')
        logging.info("Detrending completed.")

    logging.info("Preprocessing completed.")
    return raw


def main():
    """ Main function to load, preprocess, and visualize EEG data."""
 
    file_path = os.path.join(cfg['data']['raw_root'], 'sub-035_ses-01_task-Rest_eeg.mat')
    raw = load_data(file_path)
    
    # Preprocess raw data (Resampling, detrending)
    raw = preprocess(raw, cfg)
    
    # Plot raw data (10 seconds)
    #raw.plot(duration=10, block=True)
    
    # Plot raw PSD
    raw.compute_psd().plot(amplitude=False)
    plt.show()
    
    # Apply filtering
    raw = apply_filters(raw, cfg)
    
    # Plot filtered PSD
    raw.compute_psd(fmax=100).plot(amplitude=False)
    plt.show()

if __name__ == "__main__":
    main()

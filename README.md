This is a stat project

# Config
In order for the code to work, create a copy of `config_global.py` and name it `config_local.py`. Adjust content as described in the file to fit your machines needs.

# Analysis plan
- Regression on phenotypic data (iq, adhd measure, etc.) as baseline
- Simple Lasso on fmri data
- fMRI data
    - Mean resting state data: `wmean_mrda{subject#}_session_{session#}_rest_{scan#}.nii.gz`
    - Possibly use brain mask `mask_wmean_mrda{subject#}_session_{session#}_rest_{scan#}.nii.gz`
    - Timeseries data `sfnwmrda{subject#}_session_{session#}_rest_{scan#}.nii.gz`

# TODO
- create folder with three files per subject, phenotypics, train-test split and n folds

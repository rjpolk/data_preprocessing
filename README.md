# data_preprocessing
This repository contains code to use for preprocessing fMRI data. This was originally created for the Ebner Lab OT Aging study.

Steps:
1. Convert dicoms to BIDS using dcm2bids. Example config file is included here.
2. Deface the BIDS compliant data using pydeface.
3. Run quality checks on data using MRIQC.
4. Preprocessing data using fMRIprep.

# data_preprocessing
This repository contains code to use for preprocessing fMRI data. This was originally created for the Ebner Lab OT Aging study.

Steps:
1. Deface the BIDS compliant data using pydeface.
2. Run quality checks on data using MRIQC.
3. Preprocessing data using fMRIprep.
   This can be submit to slurm manually, or you can loop through multiple participants using the looping script to submit to slurm.

# data_preprocessing
This repository contains code to use for preprocessing fMRI data. This was originally created for the Ebner Lab OT Aging study.

Steps:
1. Convert raw dicoms to BIDS compliant niftis.
2. Deface the BIDS anatomical data using pydeface.
3. Run quality checks on data using MRIQC.
4. Preprocessing data using fMRIprep.
   This can be submit to slurm manually, or you can loop through multiple participants using the looping script to submit to slurm.

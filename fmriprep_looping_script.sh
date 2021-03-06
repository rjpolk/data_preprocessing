#!/bin/bash

#for use on server with slurm sbatch scripts

script_dir=/full_directory_path/slurmscript_location_folder
BIDS_dir=/full_directory_path/BIDS_data_folder
output_dir=/full_directory_path/fmriprep_output_folder
singularity_dir=/full_directory_path/singularity_location_folder
version=fmriprep-1.4.1.simg
freesurfer_dir=/full_directory_path/freesurfer_license_folder

#loops through list of subject files
for sub in 1 2 3
do

#copies processing and preprocessing scripts in to subject folder
 cp $script_dir/fmriprep_slurm.sh $script_dir/fmriprep_slurm_run_$sub.sh


#renames variable in fsl melodic, fsl feat, and freesurfer recon-all processing script to subject number 
 sed -i -e "s|SUB_sed|${sub}|g" fmriprep_slurm_run_$sub.sh
 sed -i -e "s|BIDS_sed|${BIDS_dir}|g" fmriprep_slurm_run_$sub.sh
 sed -i -e "s|OUTPUT_sed|${output_dir}|g" fmriprep_slurm_run_$sub.sh
 sed -i -e "s|SINGULARITY_sed|${singularity_dir}|g" fmriprep_slurm_run_$sub.sh
 sed -i -e "s|VERSION_sed|${version}|g" fmriprep_slurm_run_$sub.sh
 sed -i -e "s|FREESURFER_sed|${freesurfer_dir}|g" fmriprep_slurm_run_$sub.sh


#runs subject-level preprocessing scripts via sbatch on the hipergator
   sbatch fmriprep_slurm_run_$sub.sh
 
done

#removing the run script
 rm fmriprep_slurm_run*.sh
                  
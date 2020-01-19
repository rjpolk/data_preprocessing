#!/bin/bash
#SBATCH --account=XXXXaccountnamehere
#SBATCH --qos=XXXXqosnamehere
#SBATCH --job-name=mriqc
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=XXXXemailhere
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=24gb
#SBATCH --time=60:00:00
#SBATCH --output=mriqc_%j.out
#pwd; hostname; date
 
module load singularity

singularity_dir=/full_directory_path/singularity_location_folder
BIDS_dir=/full_directory_path/BIDS_data_folder
BIDS_folder=data_example_folder
MRIQC_dir=/full_directory_path/MRIQC_folder
output_folder=MRIQC_output_folder
#fd_thres= #set this to voxel size

 
# RUNNING PARTICULAR SUBJECTS
for SUB in	1 2 3
do

# running dataset for single participants
singularity run --cleanenv $mydirpath/MRIQC/mriqc_0.15.0.img $BIDS_dir/$BIDS_folder $MRIQC_dir/$output_folder participant --participant-label $SUB --hmc-fsl --fd_thres 3 --work-dir $MRIQC_dir/$output_folder --float32 

done


# RUNNING WHOLE DATASET

# running whole dataset for single and group. change memory requested -- 10gb is barely enough
#singularity run --cleanenv $mydirpath/MRIQC/mriqc_0.15.0.img $BIDS_dir/$BIDS_folder $MRIQC_dir/$output_folder participant --hmc-fsl --fd_thres 3 --work-dir $MRIQC_dir/$output_folder --float32 

# running for just group level. Change memory requested -- 5gb seems to be more than enough
#singularity run --cleanenv $mydirpath/MRIQC/mriqc_0.15.0.img $BIDS_dir/$BIDS_folder $MRIQC_dir/$output_folder group --hmc-fsl --fd_thres 3 --work-dir $MRIQC_dir/$output_folder --float32 




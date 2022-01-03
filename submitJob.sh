#!/bin/bash 
#SBATCH --job-name=FDM_Linearization_Method
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j 
#SBATCH --partition nocona 
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=128 
#SBATCH --time=48:00:00 
##SBATCH --mem-per-cpu=3994MB ##3.9GB, Modify based on needs 
module load matlab/R2020b 
matlab -nodisplay -nojvm -r RUn_Model_FDM > matlab.out 
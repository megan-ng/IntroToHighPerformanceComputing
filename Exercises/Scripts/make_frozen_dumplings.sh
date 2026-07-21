#!/bin/bash
#SBATCH --account=def-siddiqi                                               
#SBATCH --time=00:10:00                                                     
#SBATCH --mem=5G                                                            

#SBATCH --chdir=/home/meganng/projects/def-siddiqi/meganng/IntroToHighPerformanceComputing/      
#SBATCH --output=Outputs/Logs/dumplings_%j.out  
#SBATCH --error=Outputs/Logs/dumplings_%j.err                            

#SBATCH --mail-user=megan.ng@mail.mcgill.ca                                 
#SBATCH --mail-type=ALL                                                     

# Define all paths
script_path="Scripts/make_frozen_dumplings.py"
input_data="data/dumpling_filling1.txt"
output_folder="Outputs/Results/"

# Load Python module
module load python/3.11

echo "--- ENTERING PYTHON SCRIPT ---"

# Run the Python script with the input and output paths
python3 "${script_path}" "${input_data}" "${output_folder}"

# Print a message indicating that the job has completed
echo "--- PYTHON SCRIPT COMPLETED ---"


#!/bin/bash
#SBATCH --account=def-youraccountname                                         # CHANGE
#SBATCH --time=00:05:00
#SBATCH --mem=1G

#SBATCH --chdir=/your/path/to/IntroToHighPerformanceComputing/                # CHANGE
#SBATCH --output=Outputs/Logs/dumplings_%j.out
#SBATCH --error=Outputs/Logs/dumplings_%j.err

#SBATCH --mail-user=youremail@mail.mcgill.ca                                  # CHANGE
#SBATCH --mail-type=ALL

# Define all paths
script_path="Scripts/make_frozen_dumplings.py"
input_data="data/dumpling_filling1.txt"
output_folder="Outputs/Results/"

# Check that all required paths exist
if [ ! -f "${script_path}" ]; then
    echo "Error: Python script not found at ${script_path}"
    exit 1
fi

if [ ! -f "${input_data}" ]; then
    echo "Error: Input data not found at ${input_data}"
    exit 1
fi

if [ ! -d "${output_folder}" ]; then
    echo "Error: Output folder not found at ${output_folder}"
    exit 1
fi

# Load Python module
module load python/3.11

# Run the Python script with the input and output paths
python3 "${script_path}" "${input_data}" "${output_folder}"



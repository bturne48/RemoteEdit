#! /bin/bash

#SBATCH --partition=Pegasus	
#SBATCH --job-name=MaySnake
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --mem=376Gb
#SBATCH --time=48:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=bturne48@uncc.edu


echo "======================================================"
echo "Start Time  : $(date)"
echo "Submit Dir  : $SLURM_SUBMIT_DIR"
echo "Job ID/Name : $SLURM_JOBID / $SLURM_JOB_NAME"
echo "Num Tasks   : $SLURM_NTASKS total [$SLURM_NNODES nodes @ $SLURM_CPUS_ON_NODE CPUs/node]"
echo "======================================================"
echo ""


cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"

module load gatk
module load R

# run snakemake
snakemake --use-conda --rerun-incomplete --cores $SLURM_NTASKS
#python /projects/rogers_research/fnb/Brandon/RemoteEdit/ComplexVarAlign/MayotteHMM/workflow/scripts/Popgen/dendro.py

echo ""
echo "======================================================"
echo "End Time   : $(date)"
echo "======================================================"

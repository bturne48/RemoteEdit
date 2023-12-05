rule blastSplitSpecies:
     input:
          s
     output:
          'results/'
     conda:
          "../envs/blast.yaml"
     shell:
          cmd
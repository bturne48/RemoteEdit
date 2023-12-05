rule blastSplitSpecies:
     input:
          config['pathToVertabrateDatabase']
     output:
          'results/{species}.fa'
     conda:
          "../envs/blast.yaml"
     shell:
          'samtools view {input}'
#!/bin/bash

for sample in $(cat sample_names.txt); do

python3 /app/release_MitoZ_v2.4-alpha/MitoZ.py all2 \
--genetic_code 5 \
--clade Arthropoda \
--outprefix ${sample} \
--thread_number 16 \
--fastq1 /project/trim/${sample}_R1_trim.fq.gz \
--fastq2 /project/trim/${sample}_R2_trim.fq.gz \
--fastq_read_length 150 \
--insert_size 250 \
--run_mode 2 \
--filter_taxa_method 1 \
--requiring_taxa 'Arthropoda' \
--species_name ${sample} \
>${sample}_mitoZ.txt

done



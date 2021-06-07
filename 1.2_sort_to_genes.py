#!/usr/bin/python3

import os ,sys
from Bio import SeqIO
import glob

#mkdir cds_taxa
#cp *.result/*.cds cds_taxa/.
  
path_in='cds_taxa'
if os.path.exists(path_in):
    pass
else:
    os.makedirs(path_in)

path_out='cds_gene'
if os.path.exists(path_out):
    pass
else:
    os.makedirs(path_out)

gene_names=[]

filenames=glob.glob(path_in + '/' + '*.cds')
print (len(filenames))

for filename in filenames:
    for record in SeqIO.parse(filename,'fasta'):
        gene=record.id.split(';')[1]
        if gene not in gene_names:
            gene_names.append(gene)
print (len(gene_names))

for gene in gene_names:
    outname=gene+'.mitoz.fas'
    out=open(path_out+'/'+outname,'w')
    for filename in filenames:
        #filename = cds_taxa/taxon.cds
        taxon=filename.split('/')[1].replace('.cds','')
        for r in SeqIO.parse(filename,'fasta'):
            if gene == r.id.split(';')[1]:
                r.id=taxon
                r.description=''
                SeqIO.write(r,out,'fasta')
    out.close()
print ('ok')
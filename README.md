## Simple Nextflow script to subsample a bam file ##

hardcoded to subsample at 1% level

usage example:
```
nextflow run nf-subsamplebam/main.nf -with-docker [nextflow-image] --bam1 [path or s3 folder uri] --outdir [path to folder or s3 folder uri]
```


#!/usr/bin/env nextflow

nextflow.enable.dsl=2

/*  Process an input file
 *  usage example:
 *    nextflow run nf-subsamplebam/main.nf -with-docker [nextflow-image] --bam1 [path or s3 folder uri] --outdir [path to folder or s3 folder uri]
 *    nextflow run ~/src/nf-subsamplebam/main.nf --bam1 $testfile
 */ 

params.bam1 = ''
params.outdir = 'results'

process subsample {

    container '829680141244.dkr.ecr.us-west-1.amazonaws.com/artemys-biocontainers/sarekbase'

    publishDir "$params.outdir"
    
    input:
      path bamfile

    output:
      path 'subsampled.bam'
      path 'subsampled.bam.bai'

    script:
      """
      samtools view -bs 42.01 $bamfile > subsampled.bam
      samtools index subsampled.bam
      """
}

workflow {
    bamfile1 = channel.fromPath(params.bam1)
    subsample(bamfile1)
}

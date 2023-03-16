#!/usr/bin/env nextflow


process FASTQC {
    input:
    tuple val(sample), path(reads)

    output:
    tuple val(sample), path("*_fastqc.{zip,html}"), emit: fastqc_out

    script:
    """
    fastqc --threads ${task.cpus} ${reads}
    """
}
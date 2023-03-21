#!/usr/bin/env nextflow

include { FASTQC_MULTIQC } from "./workflows/fastqc_multiqc/main"

workflow fastqc_multiqc {

    if( params.fastqc_multiqc.input =~ /\{*\}/ ) {
        reads = channel.fromFilePairs(params.fastqc_multiqc.input, checkIfExists: true)
    } else {
        reads = channel.fromPath(params.fastqc_multiqc.input, checkIfExists: true) \
        | map { it -> tuple(it.getSimpleName(), it) }
    }

    reads | view

    FASTQC_MULTIQC(reads)

}
#!/usr/bin/env nextflow

include { FASTQC_MULTIQC } from "./workflows/fastqc_multiqc/main"

workflow fastqc_multiqc {
    reads = channel.fromFilePairs(params.fastqc_multiqc.input, checkIfExists: true)

    FASTQC_MULTIQC(reads)

}
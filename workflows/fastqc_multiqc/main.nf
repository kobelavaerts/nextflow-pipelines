#!/usr/bin/env nextflow

include { FASTQC } from "../../modules/fastqc/main"
include { MULTIQC } from "../../modules/multiqc/main"


workflow FASTQC_MULTIQC {
    take:
    reads //channel: [ val(sample), [reads] ]

    main:
    FASTQC(reads)
    multiqc_input = FASTQC.out.fastqc_out \
    | map{sample, reads -> reads} \
    | collect | view
    MULTIQC(multiqc_input)

    
}


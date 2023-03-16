#!/usr/bin/env nextflow

process MULTIQC {
    input:
    path(inputfiles)

    output:
    path("multiqc_report.html"), emit: multiqc_output		

    script:
    """
    multiqc .
    """

}
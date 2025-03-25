#!/usr/bin/env nextflow

process scDblFinder_random {
    tag "$task.name"
    label 'process_medium'

    // Specify the conda environment
    conda "${moduleDir}/environment.yml"

    // Specify the container to use based on the container engine
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'oras://community.wave.seqera.io/library/bioconductor-scdblfinder_bioconductor-singlecellexperiment_r-argparser_r-arrow_pruned:10318b538764fb5d':
        'community.wave.seqera.io/library/bioconductor-scdblfinder_bioconductor-singlecellexperiment_r-argparser_r-arrow_pruned:10318b538764fb5d' }"

    input:
    path rds // Input RDS file
    val prefix // Input prefix value

    output:
    path "${prefix}.rds" // Output RDS file
    path "${prefix}.csv" // Output predictions CSV file
    path "versions.yml", emit: versions // Output the versions file

    script:
    """
    Rscript "${moduleDir}/scDblFinder_random.R" \\
        --rds ${rds} \\
        --prefix ${prefix}
    """
}

workflow {
    // Define the input channels
    ch_rds = Channel.fromPath('./test-datasets/test__Dbl_sce.rds')
    ch_prefix = Channel.value("test__Dbl")

    // Run the scDblFinder_random process
    scDblFinder_random(ch_rds, ch_prefix)
}


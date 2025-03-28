#!/usr/bin/env nextflow

process scDblFinder_random {
    tag "$prefix"
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
    path "${prefix}.rds", emit: predictions // Output RDS file
    path "${prefix}.csv", emit: rds // Output predictions CSV file
    path "versions.yml", emit: versions // Output the versions file

    script:
    template 'scDblFinder_random.R', rds: rds, prefix: prefix
}

// pipeline parameters
params.moduleDir = './test_scDbl_Finder_random'
params.rds = "test-datasets/test__Dbl_sce.rds"
params.prefix = "test_Dbl_random"

workflow {
    // Define the input channels
    ch_rds = Channel.fromPath(params.rds)
    ch_prefix = Channel.value(params.prefix)

    // Run the scDblFinder_random process
    scDblFinder_random(ch_rds, ch_prefix)
}


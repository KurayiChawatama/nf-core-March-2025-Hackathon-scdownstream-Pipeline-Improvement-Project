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

    output:
    path "*.rds", emit: rds // Output RDS file
    path "*.csv", emit: predictions // Output predictions CSV file
    path "versions.yml", emit: versions // Output the versions file

    script:
    prefix = task.name // Set the prefix for output files
    template "${moduleDir}/scDblFinder_random.R" // Run the R script template
}

workflow {
    // Define the input channel
    ch_rds = Channel.fromPath('./test-datasets/test__Dbl_sce.rds')

    // Run the scDblFinder_random process
    scDblFinder_random(ch_rds)
}

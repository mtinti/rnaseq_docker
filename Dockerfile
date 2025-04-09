FROM mambaorg/micromamba:2.0.8

# Set user to root for installation (needed to avoid permission issues)
USER root

# Set working directory
WORKDIR /app

CMD ["/bin/bash"]
# Create and activate the RNA-seq environment 
# Use proper channel priority to avoid conflicts
RUN micromamba -h
RUN micromamba install -y -n base -c conda-forge -c bioconda \
    bowtie2 \
    subread \
    samtools \
    fastp \
    fastqc \
    multiqc \
    rseqc \
    bcftools \
    deeptools \
    bedtools \
    picard \
    bwa-mem2 \
    sra-tools \
    fastq-screen \
    kraken \
    qualimap \
    snakemake && \
    micromamba clean --all --yes

# Set bash shell and activate base environment by default
SHELL ["/bin/bash", "-c"]

# Default command when running the container
CMD ["bash"]
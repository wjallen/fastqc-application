FROM sd2e/base:ubuntu16

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install wget -y \
    && apt-get install zip -y \
    && apt-get install default-jre -y 

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip \
    && unzip fastqc_v0.11.7.zip \
    && rm fastqc_v0.11.7.zip \
    && chmod +x FastQC/fastqc 

ENV PATH "/FastQC/:$PATH"

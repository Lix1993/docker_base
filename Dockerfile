FROM ubuntu:latest

RUN apt update && \
    apt install -y curl && \
    apt clean  -y

RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    conda config --set channel_priority strict && \
    conda update -y conda && \
    conda clean --all -y

ENV PATH=/miniconda/bin:${PATH}

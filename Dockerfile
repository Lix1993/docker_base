FROM ubuntu:latest

RUN apt update && \
    apt install -y curl && \
    apt clean  -y

RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    /miniconda/bin/conda config --add channels bioconda && \
    /miniconda/bin/conda config --add channels conda-forge && \
    /miniconda/bin/conda config --set channel_priority strict && \
    /miniconda/bin/conda update -y conda && \
    /miniconda/bin/conda clean --all -y

ENV PATH=/miniconda/bin:${PATH}

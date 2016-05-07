FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get --assume-yes install git unzip python-pip

RUN git clone https://github.com/kwkroll32/QuaCRS.git
RUN mkdir dependencies

RUN cd dependencies; wget http://www.broadinstitute.org/cancer/cga/tools/rnaseqc/RNA-SeQC_v1.1.8.jar
RUN pip install RSeQC
RUN cd dependencies; wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip; unzip fastqc_v0.11.5.zip

RUN apt-get --assume-yes install samtools
RUN apt-get --assume-yes install picard-tools
RUN 

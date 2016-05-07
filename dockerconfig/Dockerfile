FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get --assume-yes install git unzip python-pip

RUN git clone https://github.com/kwkroll32/QuaCRS.git
RUN rm -R QuaCRS/QC_Database
RUN mkdir dependencies

RUN wget -O dependencies/RNASeQC.jar http://www.broadinstitute.org/cancer/cga/tools/rnaseqc/RNA-SeQC_v1.1.8.jar
RUN pip install RSeQC
RUN wget -O dependencies/fastqc.zip http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
RUN unzip depdendencies/fastqc.zip

RUN apt-get --assume-yes install samtools
RUN apt-get --assume-yes install picard-tools
RUN apt-get --assume-yes install ncurses-hexedit ncurses-term ncurses-base ncurses-bin ncurses-doc
RUN apt-get --assume-yes install imagemagick


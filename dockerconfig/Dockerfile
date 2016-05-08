FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get --assume-yes install software-properties-common

RUN add-apt-repository ppa:webupd8team/java
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get -y update

RUN apt-get --assume-yes install openjdk-7-jdk
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get --assume-yes install oracle-java8-installer

RUN apt-get --assume-yes install git
RUN apt-get --assume-yes install unzip python-pip
RUN apt-get --assume-yes install python-pip
RUN apt-get --assume-yes install curl
RUN apt-get --assume-yes install zlibc zlib1g-dev

RUN git clone https://github.com/kwkroll32/QuaCRS.git
RUN rm -R QuaCRS/QC_Database

RUN mkdir dependencies

RUN curl -o dependencies/RNASeQC.jar http://www.broadinstitute.org/cancer/cga/tools/rnaseqc/RNA-SeQC_v1.1.8.jar
RUN pip install RSeQC
RUN curl -o dependencies/fastqc.zip http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
RUN unzip dependencies/fastqc.zip

RUN apt-get --assume-yes install subread
RUN apt-get --assume-yes install samtools
RUN apt-get --assume-yes install picard-tools
RUN apt-get --assume-yes install ncurses-hexedit ncurses-term ncurses-base ncurses-bin ncurses-doc
RUN apt-get --assume-yes install imagemagick

RUN curl -o dependencies/GRCh37.p13.gtf.gz ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_19/gencode.v19.annotation.gtf.gz
RUN curl -o dependencies/GRCh37.p13.fa.gz ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_19/GRCh37.p13.genome.fa.gz


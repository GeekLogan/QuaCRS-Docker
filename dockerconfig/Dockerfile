FROM ubuntu:latest

MAINTAINER Logan Walker <walker.1698@osu.edu>

#ENV http_proxy 'http://10.127.20.41:8080'
#ENV https_proxy 'http://10.127.20.41:8080'
#ENV HTTP_PROXY 'http://10.127.20.41:8080'
#ENV HTTPS_PROXY 'http://10.127.20.41:8080'
#ENV FTP_PROXY 'http://10.127.20.41:8080'
#ENV ftp_proxy 'http://10.127.20.41:8080'

RUN apt-get -y update
#RUN apt-get --assume-yes install software-properties-common

#RUN add-apt-repository ppa:webupd8team/java
#RUN add-apt-repository ppa:openjdk-r/ppa
#RUN apt-get -y update

#RUN apt-get --assume-yes install openjdk-7-jdk
#RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
#RUN apt-get --assume-yes install oracle-java8-installer

RUN apt-get --assume-yes install openjdk-8-jdk-headless 

RUN apt-get --assume-yes install unzip
RUN apt-get --assume-yes install python-pip
RUN apt-get --assume-yes install zlibc zlib1g-dev

ADD https://github.com/kwkroll32/QuaCRS/archive/master.zip /
RUN unzip master.zip
RUN mv QuaCRS-master/ QuaCRS/
RUN rm -R QuaCRS/QC_Database

RUN mkdir dependencies

ADD http://www.broadinstitute.org/cancer/cga/tools/rnaseqc/RNA-SeQC_v1.1.8.jar /dependencies/RNASeQC.jar
RUN pip install RSeQC
ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip dependencies/fastqc.zip
RUN unzip dependencies/fastqc.zip
RUN mv FastQC/ dependencies/

ADD https://github.com/broadinstitute/picard/releases/download/2.3.0/picard-tools-2.3.0.zip dependencies/picard.zip
RUN unzip dependencies/picard.zip
RUN mv picard* dependencies/

RUN apt-get --assume-yes install subread
RUN apt-get --assume-yes install samtools
RUN apt-get --assume-yes install ncurses-term ncurses-base ncurses-bin
RUN apt-get --assume-yes install imagemagick

#RUN curl -o dependencies/GRCh37.p13.gtf.gz ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_19/gencode.v19.annotation.gtf.gz
#RUN curl -o dependencies/GRCh37.p13.fa.gz ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_19/GRCh37.p13.genome.fa.gz
#RUN gunzip /dependencies/*.gz

RUN chmod +x /*/*/fastqc

RUN echo "WGF=" > /QuaCRS/QC_Pack/tools.cfg
RUN echo "ANNOT=" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "ANNOT_BED=" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "FASTQC_EXEC=$(find / | fgrep fastqc | fgrep -v .)" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "PICARD_JAR=$(find / -name 'picard.jar')" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "RNASEQC_JAR=$(find / | fgrep RNASeQC | fgrep jar)" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "SAMTOOLS_EXEC=$(which samtools)" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "RSEQC_DIR=$(find / -name "read_quality.py" | sed 's/read_quality.py//')" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "FEATURECOUNTS_EXEC=$(find / | fgrep featureCounts | fgrep -v man)" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "lncRNA_genes=" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "lincRNA_genes=" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "coding_genes=" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "housekeeping_genes=" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "other_genes=" >> /QuaCRS/QC_Pack/tools.cfg
RUN echo "threads=6" >> /QuaCRS/QC_Pack/tools.cfg

ADD ./buildcfg.sh /

ENTRYPOINT sh /buildcfg.sh;

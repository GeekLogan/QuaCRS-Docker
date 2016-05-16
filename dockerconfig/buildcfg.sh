echo "Building tools.cfg..."
echo
echo "WGF=$(find /reference -name *.fa)" > /QuaCRS/QC_Pack/tools.cfg
echo "ANNOT=$(find /reference -name *.gtf)" >> /QuaCRS/QC_Pack/tools.cfg
echo "ANNOT_BED=$(find /reference -name *.bed)" >> /QuaCRS/QC_Pack/tools.cfg
echo "FASTQC_EXEC=$(find / | fgrep fastqc | fgrep -v .)" >> /QuaCRS/QC_Pack/tools.cfg
echo "PICARD_JAR=$(find / -name 'picard.jar')" >> /QuaCRS/QC_Pack/tools.cfg
echo "RNASEQC_JAR=$(find / | fgrep RNASeQC | fgrep jar)" >> /QuaCRS/QC_Pack/tools.cfg
echo "SAMTOOLS_EXEC=$(which samtools)" >> /QuaCRS/QC_Pack/tools.cfg
echo "RSEQC_DIR=$(find / -name "read_quality.py" | sed 's/read_quality.py//')" >> /QuaCRS/QC_Pack/tools.cfg
echo "FEATURECOUNTS_EXEC=$(find / | fgrep featureCounts | fgrep -v man)" >> /QuaCRS/QC_Pack/tools.cfg
echo "lncRNA_genes=" >> /QuaCRS/QC_Pack/tools.cfg
echo "lincRNA_genes=" >> /QuaCRS/QC_Pack/tools.cfg
echo "coding_genes=" >> /QuaCRS/QC_Pack/tools.cfg
echo "housekeeping_genes=" >> /QuaCRS/QC_Pack/tools.cfg
echo "other_genes=" >> /QuaCRS/QC_Pack/tools.cfg
echo "threads=6" >> /QuaCRS/QC_Pack/tools.cfg

echo
echo "----------------------------------------------------------"
echo "                   USING CONFIG AS FOLLOWS"
echo "----------------------------------------------------------"
echo

echo "TOOLS.CFG:"
cat /QuaCRS/QC_Pack/tools.cfg
echo

echo "----------------------------------------------------------"
echo

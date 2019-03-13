#' Convert BAM alignments to FASTQ files. 
#' 
#' @param i <BAM>
#' @param fq <FQ>
#' @param fq2 FASTQ for second end.  Used if BAM contains paired-end data.
#'   BAM should be sorted by query name is creating paired FASTQ.
#' 
#' @param tags Create FASTQ based on the mate info
#'   in the BAM R2 and Q2 tags.
#' 
bamtofastq <- function(i, fq, fq2 = NULL, tags = NULL)
{ 
	# Required Inputs
	i = establishPaths(input=i,name="i",allowRobjects=FALSE)
	fq = establishPaths(input=fq,name="fq",allowRobjects=FALSE)

	options = "" 

	# Options
	options = createOptions(names = c("fq2","tags"),values= list(fq2,tags))

	# establish output file 
	tempfile = tempfile("bedtoolsr", fileext=".txt")
	bedtools.path <- getOption("bedtools.path")
	if(!is.null(bedtools.path)) bedtools.path <- paste0(bedtools.path, "/")
	cmd = paste0(bedtools.path, "bedtools bamtofastq ", options, " -i ", i[[1]], " -fq ", fq[[1]], " > ", tempfile) 
	system(cmd) 
	results = read.table(tempfile,header=FALSE,sep="\t")

	# Delete temp files 
	deleteTempfiles(c(tempfile,i[[2]],fq[[2]]))
	return (results)
}
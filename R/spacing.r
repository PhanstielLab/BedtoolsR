#' Report (last col.) the gap lengths between intervals in a file.
#' 
#' @param i <bed/gff/vcf/bam>
spacing <- function(i)
{ 

            if (!is.character(i) && !is.numeric(i)) {
            iTable = paste0(tempdir(), "/iTable.txt")
            write.table(i, iTable, append = "FALSE", sep = "	", quote = FALSE, col.names = FALSE, row.names = FALSE) 
            i=iTable } 
            
		options = "" 

	# establish output file 
	tempfile = tempfile("bedtoolsr", fileext=".txt")
	bedtools.path <- getOption("bedtools.path")
	if(!is.null(bedtools.path)) bedtools.path <- paste0(bedtools.path, "/")
	cmd = paste0(bedtools.path, "bedtools spacing ", options, " -i ", i, " > ", tempfile) 
	system(cmd) 
	results = read.table(tempfile,header=FALSE,sep="\t") 
        if (file.exists(tempfile)){ 
        file.remove(tempfile) 
        }
        return (results)
        }
         
        if(exists("iTable")) { 
        file.remove (iTable)
        } 

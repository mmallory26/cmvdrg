#' CMV Resistance Genotyping from command line
#'
#' Command line version of the website application
#' Takes as input a VCF, varscan tab or fasta file.
#' The program assumes variant files are generated relative to Merlin strain.
#' Fasta files if not Whole Genome, or not aligned / assembled relative to Merlin 
#' are Processed using MAFFT & snp-sites.
#' In this case the output files are returned to your working directory.
#'
#' @param infile the input fasta, vcf or varscan.tab file
#' @param all_mutations when FALSE only recognised resistant variants present are returned.
#' @param inc_anecdotal include anectodat database entries in returned results?
#' @param outdir for fasta input files intermediate alignment fasta & vcf files are generated, this defines the directory they are saved to. "out.fasta" "out.vcf"
#' @return A data.frame containing resistance information for variants identified
#' @export

call_resistance = function(infile = system.file("testdata",  "A10.vcf", package = "cmvdrg"), all_mutations = FALSE, inc_anecdotal = FALSE, outdir = ""){
  
  #package variables
  global = list()
  global$res_table = system.file("db", "cmvdrg-db1.csv", package = "cmvdrg")
  #create unique session folder
  global$date <- format(Sys.time(), "%Y-%m-%d")
  global$dir = outdir
  global$genome = genome="NC_006273.2"
  global$path_gff3_file=system.file("ref", "NC_006273.2.gff3", package = "cmvdrg")
  global$path_fasta_file=system.file("ref", "NC_006273.2.fasta", package = "cmvdrg")
  global$path_txdb=system.file("ref", "NC_006273.2e.sqlite", package = "cmvdrg")
  
  
  dat1 = read_input(infile, global = global)
  
  ### annotate variants
  dat2 <- annotate_variants(f.dat = dat1, global = global)
  
  ### add res info
  dat3 <- add_resistance_info(f.dat = dat2, resistance_table=global$res_table, all_muts = all_mutations, anecdotal = inc_anecdotal)
  
  dat3=dat3
  
  return(dat3)
}

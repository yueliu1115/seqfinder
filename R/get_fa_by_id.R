#' Title get fasta by id from fasta file
#'
#' @param geneid a data frame with gene id
#' @param fasta a fasta file
#' @param output a fasta file
#'
#' @return a fasta file
#' @export
#'
#' @examples
#' get_fa_by_id(geneid = './geneid.ID',
#' fasta = 'Oryza_sativa.pep.fasta',
#' output = 'tmp3.fasta')
#'
get_fa_by_id <- function(geneid, fasta, output){
  # Reading geneid file
  print("Reading geneid file")

  ID <-  readr::read_delim(file = geneid, col_names = F, delim = "\t") %>%
    purrr::set_names("ID")

  # Reading fasta file
  print("Reading fasta file")

  fasta <- Biostrings::readAAStringSet(filepath = fasta, format = "fasta") %>%
    as.data.frame() %>%
    tibble::rownames_to_column(var = "ID", "sequence") %>%
    dplyr::mutate(ID = stringr::str_split(ID, pattern = " ", simplify = T)[,1])

  outfile <- dplyr::left_join(ID, fasta, by = c("ID" = "ID")) %>%
    dplyr::mutate(out = stringr::str_c(">",ID,"\n",sequence)) %>%
    dplyr::select("out")
  utils::write.table(outfile,
              file = output,sep = "\n",
              row.names = F,col.names = F,quote = F)
}

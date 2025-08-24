query_gene_network_analysis <- function(load_query_gene, mapped_gene_str_IDs, neighbor_genes_symbols){
  query_gene_ids <- find_unique_neighbors(string_db, mapped_gene_str_IDs)
  
  # Match query genes with neighbors
  matched_genes <- match_query_with_neighbors(load_query_gene, neighbor_genes_symbols)
  matched_gene_ids <- matched_genes[, 1]
  
  # OUTPUT
  write.csv(matched_genes, "matched_genes_between_all_neighbor_genes_of_input_genes_and_your_query_genes.csv")
  
  # Plot network and perform enrichment analysis for input genes
  pdf("ppi_of_matched_genes_between_neighbor_genes_of_input_genes_and_your_query_genes.pdf")
  # Ensure the plot is printed
  gene_identityN <- "Query Genes"
  
  # OUTPUT
  print(plot_network(string_db, matched_gene_ids, gene_identityN))
  # Close PDF device
  dev.off()
  
  return(matched_gene_ids)
}

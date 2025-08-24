source("1_setup_string_env.R")
source("2_map_n_plot_input_genes.R")
source("3_single_gene_analysis.R")
source("4_enrichment_analysis_n_plot_alt.R")
source("5_query_genes_analysis.R")
source("6_cluster_finder.R")
source("7_single_gene_analysis_compiled.R")
source("8_query_gene_network_analysis.R")
source("9_query_gene_enrichment_analysis.R")
source("11_input_genes_enrichment_analysis.R")
################# Workflow #####################################
setup_stringdb_environment()
# Load organism list and initialize STRING database

# INPUT (the "Organism_List.csv" should be kept saved in the background)
# It won't be uploaded by the USER
organism_List <- read.csv("Organism_List.csv") 
print(organism_List) #Front end

# INPUT (user will select)
species_name <- 'Homo sapiens'
taxon_id <- get_taxon_id(organism_List, species_name)
string_db <- initialize_stringdb(taxon_id)

# Input gene list (User will input the list in comma or tab separated format)
gene_symbols <- c("LTBP4", "SNX2", "STAT1", "SULF2", "SLC2A14", "TUBGCP2", "DUOX1") #User Input

######################### Mapping and Plotting Network of Input Genes ###################

# Map genes to STRING IDs
mapped_genes <- map_genes_to_string_ids(string_db, gene_symbols)

# Output
write.csv(mapped_genes, "string_ids_according_to_initial_input_genes.csv")

mapped_gene_str_IDs <- mapped_genes$STRING_id

input_genes_neighbors <- find_unique_neighbors(string_db, mapped_gene_str_IDs)
neighbor_genes_symbols <- map_neighbors_to_symbols(string_db, input_genes_neighbors)

# Output
write.csv(neighbor_genes_symbols, "all_neighbor_genes_of_initial_input_genes.csv")

# Plot ppi network
gene_identity1 <- "Input Genes" #For title in the figure
# Output
pdf("ppi_network_of_input_genes.pdf")
# Ensure the plot is printed
plot_network(string_db, mapped_gene_str_IDs, gene_identity1)
# Close PDF device
dev.off()

####################### Cluster Finder ########


clustering_methods <- c("fastgreedy", "walktrap", "spinglass", "edge.betweenness")
#Show in front end
print(clustering_methods)
# INPUT-- Give user options to Choose: "fastgreedy", "walktrap", "spinglass", "edge.betweenness"
clustering_method <- "fastgreedy"
# OUTPUTs are inside the function
find_all_clusters(gene_symbols, clustering_method)

####################### Enrichment Analysis #########
input_genes_enrichment_analysis(mapped_gene_str_IDs)

############################# Single Gene Analysis ##########################

# INPUT : read CAREFULLY!!
# If user wants "input genes" to be the INPUTS for Single Gene Analysis keep mapped_gene_str_ids as input
# If user wants to insert genes for single gene analysis, take those input

single_gene_lists <- mapped_gene_str_IDs
single_gene_analysis(single_gene_lists)


# single_gene_lists_df <- map_genes_to_string_ids(string_db, single_gene_lists)
# single_gene_ID_lists <- single_gene_lists_df$STRING_id
# single_gene_analysis(single_gene_lists)


##############################################################################
############################# Query Gene Analysis ############################

# INPUT
load_query_gene <- "Fibro_UP_genes.csv"
matched_gene_ids <- query_gene_network_analysis(load_query_gene, mapped_gene_str_IDs, neighbor_genes_symbols)

##################### Cluster Finder for matched genes #######################

clustering_methods <- c("fastgreedy", "walktrap", "spinglass", "edge.betweenness")
#Show in front end
print(clustering_methods)
# INPUT-- Give user options to Choose: "fastgreedy", "walktrap", "spinglass", "edge.betweenness"
clustering_method <- "fastgreedy"
find_all_clusters(matched_gene_ids, clustering_method)

############################# Enrichment Analysis ############################
query_genes_enrichment_analysis(matched_gene_ids)


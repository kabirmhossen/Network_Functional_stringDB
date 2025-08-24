######################### Gene Symbol to String ID Converter (Gene Mapping) and vice versa ######################
# Load organism list and initialize STRING database
organism_List_converter <- read.csv("Organism_List.csv")
species_name_converter <- 'Homo sapiens'
taxon_id_converter <- get_taxon_id(organism_List_converter, species_name_converter)
string_db_converter <- initialize_stringdb(taxon_id_converter)

gene_symbol_list <- c("ZNF212") #User input as list , "ZNF451", "PLAGL1", "NFAT5", "ICAM5", "RRAD"
map_gsl <- map_genes_to_string_ids(string_db_converter, gene_symbol_list)
print(map_gsl)

# Reverse Mapping
string_ID_List <- map_gsl$STRING_id #User input as list
map_reverese_sil <- map_reverse_to_symbols(string_db_converter, string_ID_List)
map_reverese_sil$alias

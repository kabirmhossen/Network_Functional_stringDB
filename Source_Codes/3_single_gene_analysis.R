# # Function to retrieve interactions for a given STRING ID
# get_single_gene_interactions <- function(string_db, single_string_id) {
#   # Retrieve neighbors
#   neighbors <- string_db$get_neighbors(single_string_id)
#   
#   # Combine single_string_id with neighbors
#   ssi_and_neighbors <- c(single_string_id, neighbors)
#   
#   # Retrieve interactions and process
#   interactions <- string_db$get_interactions(ssi_and_neighbors) %>%
#     filter(from == single_string_id | to == single_string_id) %>%
#     mutate(target = ifelse(from == single_string_id, to, from)) %>%
#     distinct(target, .keep_all = TRUE) %>%
#     arrange(desc(combined_score))
#   
#   # Get all targets
#   all_targets <- interactions %>% select(target)
#   all_targets_and_ssi <- rbind(all_targets, single_string_id)
#   
#   # Select top 20 interactions
#   top_interactions <- interactions %>% head(20)
#   top_targets <- top_interactions %>% select(target)
#   
#   # Combine top targets with single_string_id
#   combined_targets <- rbind(top_targets, single_string_id)
#   
#   # Return results as a list
#   return(list(interactions = interactions,
#               combined_targets = combined_targets,
#               all_targets = all_targets_and_ssi))
# }
# 
# # Function to plot the network based on the retrieved interactions
# plot_gene_interaction_network <- function(string_db, combined_targets) {
#   string_db$plot_network(combined_targets)
# }

# Function to retrieve interactions for a given STRING ID
get_single_gene_interactions <- function(string_db, single_string_id) {
  # Retrieve neighbors
  neighbors <- string_db$get_neighbors(single_string_id)
  
  # Combine single_string_id with neighbors
  ssi_and_neighbors <- c(single_string_id, neighbors)
  
  # Step 1: Get interactions
  interactions <- string_db$get_interactions(ssi_and_neighbors)
  
  # Step 2: Ensure 'from' and 'to' columns are character type
  interactions$from <- as.character(interactions$from)
  interactions$to <- as.character(interactions$to)
  
  # Step 3: Filter interactions where either 'from' or 'to' is the single gene
  interactions <- interactions[
    interactions$from == single_string_id | interactions$to == single_string_id,
  ]
  
  # Step 4: Add a 'target' column that is the interaction partner of single_string_id
  interactions$target <- ifelse(
    interactions$from == single_string_id,
    interactions$to,
    interactions$from
  )
  
  # Step 5: Keep only distinct targets (avoid duplicates)
  interactions <- interactions[!duplicated(interactions$target), ]
  
  # Step 6: Sort interactions by combined score (descending)
  interactions <- interactions[order(-interactions$combined_score), ] 
  # Get all targets
  all_targets <- as.data.frame(interactions$target)
  colnames(all_targets) <- "targetID"
  
  #All
  all_targets_and_ssi <- as.data.frame(c(all_targets, single_string_id))
  
  # Select top 20 interactions
  top_interactions <- interactions %>% head(20)
  top_targets <- top_interactions[, "target", drop = FALSE]
  
  # Combine top targets with single_string_id
  # combined_targets <- rbind(top_targets, single_string_id)
  
  combined_targets <- c(top_targets, single_string_id)
  # Return results as a list
  return(list(interactions = interactions,
              combined_targets = combined_targets,
              all_targets = all_targets_and_ssi))
}

# A part of the GUI-omicML

## Overview
This project integrates Network and Functional Analysis of any gene. Sometimes, when we upload a lesser number of genes, stringDB do not show possble interactions between them. Here, this problem has been solved. Even, single gene analysis could be done through this. It features Protein-Protein Interactions of the Uploaded genes, even the number is just over 1; All possible enrichments including KEGG, Reactome, Molecular Functions, Cellular Components, Biological Processes and so on. For single gene, you will find all the necessary data. But You may need to sort them.

## Example PPI

## Workflow

### 1. Input Data
- Enter any gene name or Ensembl Id of the desired genes

### 2. PPI Construction of the input genes
- **Neighbor identification**: Finding all possible neighbor genes with combined scores evaluation.
- **Gene Mapping**: Extract all the genes in interaction with the gene input.
- **Combined Score Threshold**: Maintain theshold of interaction score > 150
## Schematic illustration of the Workflow
![Graphical Abstract](figure/Figure-01_Graphical_Abstract.png)
### 3. Enrichment Finder: for all the uploaded gene
- **Get all the Enrichment**: Used the `get_enrichment` function in `STRINGdb` package.
- **Check available categories of the Enrichments**: There are multiple categories of enrichments including KEGG, Reactome, Gene Ontology, pfam etc.
- **Filtering the Enrichments**: enrichments with p_value < 0.05 was selected for plotting
- **Plot the top Enrichments**: Through filtering the top enrichments based on p_value enrichments are plotted

### 4. Interaction Finder: for individual gene
- **Fetches first‑degree neighbors of a given single_string_id.**
- **Downloads all interactions among {single_string_id ∪ neighbors}.**
- **Keeps only edges where the focal gene participates (from == id or to == id).**
- **Adds a target column: “the other node” in each interaction with the focal gene.**
- **De‑duplicates targets (one row per unique partner).**
- **Sorts by combined_score (descending) and prepares:**
- **interactions: full, filtered, sorted edge list (one row per partner)**
- **combined_targets: the top 20 target IDs plus the focal gene**
- **all_targets: all target IDs plus the focal gene (for broader subnetworks)**

### 4. PPI Construction: for individual gene
- **Neighbor identification**: Finding all possible neighbor genes with combined scores evaluation.
- **Gene Mapping**: Extract all the genes in interaction with the gene input.
- **Combined Score Threshold**: Maintain theshold of interaction score > 150

### 4. Enrichments Finder: for individual gene
- **Get all the Enrichment**: Used the `get_enrichment` function in `STRINGdb` package.
- **Check available categories of the Enrichments**: There are multiple categories of enrichments including KEGG, Reactome, Gene Ontology, pfam etc.
- **Filtering the Enrichments**: enrichments with p_value < 0.05 was selected for plotting
- **Plot the top Enrichments**: Through filtering the top enrichments based on p_value enrichments are plotted


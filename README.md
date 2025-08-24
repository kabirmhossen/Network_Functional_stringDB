# A part of the GUI-omicML

## Overview
This project integrates Network and Functional Analysis of any gene. Sometimes, when we upload a lesser number of genes, stringDB do not show possble interactions between them. Here, this problem has been solved. Even, single gene analysis could be done through this. It features Protein-Protein Interactions of the Uploaded genes, even the number is just over 1; All possible enrichments including KEGG, Reactome, Molecular Functions, Cellular Components, Biological Processes and so on. For single gene, you will find all the necessary data. But You may need to sort them.

## Example PPI

## Workflow

### 1. Input Data
- Enter any gene name or Ensembl Id of the desired genes

### 2. PPI Construction
- **Normalization**: Performed to ensure comparability across samples.
- **Outlier Removal**: Removed to improve data quality.

### 3. Enrichment Finder: for all the uploaded gene
- **Microarray Data**: 
  - Used the `limma` package for DEG analysis.
- **RNA-Seq Data**: 
  - Performed using the `DESeq2` package.
- **Log Fold Change (LFC)**: 
  - Calculated for DEGs and visualized using volcano plots.

### 4. Interaction Finder: for individual gene

### 4. PPI Construction: for individual gene
### 4. Enrichments Finder: for individual gene


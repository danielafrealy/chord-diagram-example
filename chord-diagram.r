# Load necessary libraries
library(googlesheets4)
library(circlize)
library(tidyverse)

# Read in data
sheet_url <- "https://docs.google.com/spreadsheets/d/1NLi3ffSt2oWGSVF1eDgkGqXiEwZLSoNJqKliyml60pI/edit#gid=0"
water_bottles <- read_sheet(sheet_url)


# format data as a matrix
# make sure that the first row and column are treated as names, not data
bottle_matrix <- as.matrix(water_bottles[, -1])
rownames(bottle_matrix) <- water_bottles[[1]]

# make sure that counts are treated as numeric and not as strings
class(bottle_matrix) <- "numeric"

# generate the chord diagram
chordDiagram(bottle_matrix)

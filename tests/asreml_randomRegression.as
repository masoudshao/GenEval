running on behalf of my own program when using pedigree

 ANIMAL !P
 ENV    
 y

pedigree.txt !MAKE  !SKIP 1
phenotype_randomRegression !MAX 100

y ~ mu ENV !r !{ ANIMAL ANIMAL.ENV !} ENV.units

0 0 1
ANIMAL 2
2 0 US 1. 1. 1.
ANIMAL 

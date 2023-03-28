running on behalf of my own program when using pedigree

 ANIMAL !P
 ENV   10 
 y

pedigree.txt !MAKE  !SKIP 1
phenotype_singleTrait1FixEff !MAX 100

y ~ mu ENV !r ANIMAL

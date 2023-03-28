running on behalf of my own program when using pedigree

 ANIMAL !P
 y

pedigree.txt !MAKE  !SKIP 1
phenotype_singleTrait !MAX 100

y ~ mu !r ANIMAL

# NOTES.md

## 2017-11-30
Classic matrixes

Variables can hold anything
Discrete vs. continuous values
- Important to know which you are working with if trying to perform calculations on a matrix
- Depending on the input variables, the output varies
- Every type of variable has its own rules of behavior
- Cannot make a regression for every type of variable (e.g. temp = polution * 13 is just false)
- What to do with missing data? Throw the whole row out? Or find "the meaning of the missing"

Simple operations on matrixes
- Means
  - Has two meanings:
    1. Arithmetic mean -- standard "average" calculation
    2. Expected value -- a.k.a. theoretical mean: arithmetic means are representatives of this common value
- Variances

When we devide values by their standard deviation, we remove the dependence on units

### Corelations
- Fall between -1 and +1
- Do not depend on units
- Work with these because they are easy to compare


### Distance Properties
- dist(A, A) is 0
- dist(A, B) = dist(B, A)
- dist(A, B) is always less than or equal to dist(A, C) + dist(C, B)
- *But these only apply to Euclidian distances*

### Taxicab geometry (Manhattan distance)
- dist(A, B) depends on one-way-streets

### Getting started with R
Define a matrix:
`mat=matrix(runif(25),ncol=5,nrow=5,byrow=T)`

Get the 4th col:
`mat[,4]`


Get the 2nd row:
`mat[2,]`

???
`mat[c(2,4),5]`

Transpose:
`t(mat)`

Get the inverse:
`matinv = solve(mat)`

Check identity (`%*%` used to multiply matrixes):
`mat%*%matinv`


### Singular Matrixes
- Determinant = 0
- Don't have an inverse
- Some column is linearly dependent on another column

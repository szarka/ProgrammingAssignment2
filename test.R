# test for cachematrix.R
# setwd() here
source('cachematrix.R')
test <- matrix(data=c(1,2,3,4),nrow=2)
test2 <- makeCacheMatrix(test)
cacheSolve(test2)
# should see "getting cached data" message on second run:
cacheSolve(test2)
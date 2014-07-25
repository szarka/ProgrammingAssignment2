# 
# A pair of functions to invert matrices
# with caching of results to save computations.
#
# See test.R for an example of usage
#

# makeCacheMatrix accepts a matrix and returns a list
# that can be consumed by cacheSolve
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inv) m <<- inv
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

# cacheSolve accepts a list produced by makeCacheMatrix
# and returns the inverse of the associated matrix.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
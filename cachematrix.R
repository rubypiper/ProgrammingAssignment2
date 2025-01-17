## caches the inverse of a matrix

## creates a special "matrix" object that can cache its inverse. Has the ability to 
## set the matrix, get the matrix, set the inverse of the matrix, get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function()x
        setInverse <- function(inverse)inv <<- inverse
        getInverse <- function()inv
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
        
        ## Returns a matrix that is the inverse of 'x'
}

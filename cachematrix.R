## 
## These functions make a list that stores a matrix and 
## its inverse so the inverse only needs to be calculated 
## when the matrix the changes.

## Make a list that provides methods for getting
## and setting a matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
        inverted <- NULL
	set <- function(newMatrix) {
	        x <<- newMatrix
		inverted <<- NULL
	}
	get <- function() x
	setinverse <- function(value) inverted <<- value
	getinverse <- function() inverted
	list(set = set, get = get, 
	       setinverse = setinverse,
	       getinverse = getinverse)

}


## Tests whether its argument has a cached inverse.
## If it does, return the cached value.
## Otherwise, compute the answer, cache it, and return it. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
	if(!is.null(i)) {
	        message("getting cached data")
		return(i)
	}
	data <- x$get()
	i <- solve(data)
	x$setinverse(i)
	i
}

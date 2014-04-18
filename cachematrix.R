## These comments give an overall description of what my functions do

makeCacheMatrix <- function(x = matrix()) {
    # Creates a list containing a function to 
    # set and get the value of the matrix and its inverse
    m <- NULL
    set <- function(y) {
        #sets the value of the matrix
        x <<- y
        m <<- NULL
    }
    get <- function() {
        #gets the value of the matrix
        x
    }
    setinverse <- function(solve) {
        #sets the value of the matrix's inverse
        m <<- solve
    }
    getinverse <- function() {
        #gets the value of the matrix's inverse
        m
    }
    
    list(set = set, 
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


cacheSolve <- function(x, ...) {
    # Calculates (or looks up) the inverse created by makeCacheMatrix.
    # If not, it calculates it and adds it to the cache for future lookup.

    # Return a matrix that is the inverse of 'x' from the cache
    m <- x$getinverse()
    
    #
    if(!is.null(m)) {
        # First checks to see if the inverse has already been found in the cache 
        # If so, return it
        message("getting cached matrix inverse")
        return(m)
    }
    
    # If the inverse wasn't found in the cache, calculate it and add it to the  
    # cache.
    data <- x$get()    
    m <- solve(data, ...)
    x$setinverse(m)
    
    m

}

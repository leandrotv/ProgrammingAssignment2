## Put comments here that give an overall description of what your
## functions do

## creates a special "matrix", which is really a list containing utility
##   functions to set/get the value of the matrix and set/get the value of the
##   inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setSolve <- function(solve) s <<- solve
  getSolve <- function() s
  
  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## calculates the inverse of the special "matrix" created with the above function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getSolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setSolve(s)
  s
}

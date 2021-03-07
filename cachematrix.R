## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <<- NULL
  set <- function(y){            ##Define the set function to assign new values
    x <<- y                      ##Move value to parent environment
    m <<- NULL                   ##Reset m value
  }
  
  get <- function () x           ##Get the value of x
  setInverse <- function(solve) m <<- solve   ##move value to parent environment
  getInverse <- function() m     ##Get the value of m
  list(set = set,                ##Define pointers
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()             ##Getting the value of inverse matrix
  if(!is.null(m)){                ##Checking if m value has any of NA
    message("getting cached data")
    return(m)
  }
  data <- x$get()                 ##Get the value of x into data
  m <- solve(data,...)            ##Making inverse value
  x$setInverse(m)                 ##Setting the inverse value into x
  m                               ##Display m value
}

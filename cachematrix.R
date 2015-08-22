## This function will create and use a cache for the results of a matrix operation
## Instead of comptuing the inverse of a matrix, it will allow the inverse to be cached and used

## This function will create a function with 4 funtions, set matrix, get matrix, set inverse, get inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <- NULL
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function retrieves or caculates the inverse of a matric 'x'

cacheSolve <- function(x, ...) {
  i<- x$getinv()
  if(!is.null(i)) {
    message("Getting data from cache")
    return(i)
  }
  data<- x$get()
  i <- solve(data)
  x$setinv(i)
  i
}
  
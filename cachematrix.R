## Caching the inverse of a matrix

## Function creates a special "matrix" object that can cache
## it's inverse
makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL

  set <- function(y){

    x <<- y

    inv <<- NULL

  }

  get <- function() x

  setInverse <- function(solveMatrix) inv <<- solveMatrix

  getInverse <- function() inv

  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
 
}


## Function computing the inverse of the special "matrix"

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()

  if(!is.null(inv)){

    message("getting cached data")

    return(inv)

  }

  data <- x$get()

  inv <- solve(data)

  x$setInverse(inv)

  inv      
}

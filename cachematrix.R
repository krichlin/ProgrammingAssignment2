## makeCacheMatrix() and cacheSolve() functions by Kenneth Richlin for R Programming PA-2

## makeCacheMatrix accepts a square matrix as an input.  It then checks to see if the matrix has
## already been cached.  After this check, it then solves the matrix by calling another function, 
## cacheSolve() defined below.  It will then take the solved matrix and save it in a cached location
## that is globally accessable for future reference.  

## cacheSolve is a function that "solves" a matrix, that is, it mathematically inverts the matrix.
## It accepts a square matrix as its input, and returns a different square matrix.
## if there is already a solution stored in the cache, it forgos the calculation and instead simply 
## retrieves the value from the cached location.

## Each function really should really have its own separate file, but let's keep them both here 
## together in the same file, because of the PA2 submission requirements.


makeCacheMatrix <- function(x = matrix()) {

  arr <- NULL                   ## define a matrix arr to hold the result matrix.  Initialize it as NA
                                ## to indicate it hasn't been calculated yet.
  
  arr <<- cacheSolve(arr)    ## call the cacheSolve() function on the array (defined below), 
                             ## and save the result array in the cache
     
  arr        ## it seems like instead of returning a list like in the example we should return a matrix.
 
}


cacheSolve <- function(x, ...) {
     
  ## Return a matrix that is the inverse of 'x'
  ## This function will look very similar to the "cachemean()" function in the assignment.  However,
  ## instead of calling "mean()", we will be calling "solve()" instead.
        
  ## A matrix needs to be square to be inverted.  The first thing we should do is to check this,
  ## and throw an error if the dimensions don't match up.  However the assignment specifically stated 
  ## that we don't have to check for this, so I've left this part commented out for the time being.
          
  ##   is_square <-  (nrow(x) = ncol(x))                   ## is it square?  save result as a logical     
  ##   if !(is_square) { throw an error  }                 ## if it's not, throw an error 
  ##   else if {proceed with the calculation}              ## otherwise continue as normal
     
  arr  <- x$getmean()      ## here we check "arr" to see if this calcuation has been performed previously.
  
  if (!is.null(arr)) {
       
       message("getting cached data")  ## if arr = NA, we've done this before, and should retrieve the cache
       return(m)
       
  }
  
  ## data <- x$get()               
  
  arr <- solve(data, ...)                 ## use the solve() function to solve the array
  
  ## x$setmean(m)
  
  arr                                     ## Return arr, the solved array.  
    
}

## makeCacheMatrix() and cacheSolve() by Kenneth Richlin for R Programming rprog-014 PA-2 5/24/2015

## makeCacheMatrix accepts a square matrix as an input.  After creating a new matrix to hold the result,
## this function defines a list of four new seperate functions, get, set, getinverse and setinverse.
## It bundles this list with the original matrix it was passed and returns this new matrix-like object.

## cacheSolve is a function that "solves" a matrix, that is, it mathematically inverts the matrix.
## It accepts a the special matrix-like object created in makeCacheMatrix() as its input, and it returns a 
## different square matrix containing the inverted matrix.  If there is already a solution stored in the cache, 
## cacheSolve will forgo the calculation and instead simply return the value from the cached location, saving
## both time and processing power.

## Each function really should really have its own separate file, but let's keep them both here 
## together in the same file, because of the PA2 submission requirements.

makeCacheMatrix <- function(x = matrix()) {

       arr <- NULL              ## define a matrix arr to hold the result matrix.  Initialize it as NULL 
                                ## to indicate it hasn't been calculated yet.
       
       set <- function(y)              {x <<- y              # added curly braces and whitespace for 
                                        arr <<- NULL    }    # CLARITY which the example code was lacking
       
       get <- function()               {x               }  
       
       setinverse <- function(inverse) {arr <<- inverse }  
       
       getinverse <- function()        {arr             }
       
       list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  # the list of functions
        
         ## We are returning a matrix like the original, but one that is now convoluted with a list
         ## of functions.  So it is a new matrix-like object data type.  This new "matrix" is what the input 
         ## for cacheSolve() expects as its input argument.
       
}




cacheSolve <- function(x, ...) {
     
  ## Return a matrix that is the inverse of 'x'
  ## 'x' is expected to be the "array" that was returned from makeCacheMatrix()
  ## This function will look very similar to the "cachemean()" function in the assignment.  However,
  ## instead of calculating the mean, we will be calling "solve()" to get an inverted matrix back.
        
  ## A matrix needs to be square to be inverted.  The first thing we should do is to check this,
  ## and throw an error if the dimensions don't match up.  However the assignment specifically stated 
  ## that we don't have to check for this, so I've left this part commented out for the time being.
          
  ##   is_square <-  (nrow(x) = ncol(x))                   ## is it square?  save result as a logical     
  ##   if !(is_square) { message("input not square"  }     ## if it's not, throw an error 
  ##   else if { proceed with the calculation }            ## otherwise continue as normal
     
     
  arr  <- x$getinverse()     
  
  if (!is.null(arr)) {       ## here we check "arr" to see if this calcuation has been performed previously.
       
       message("returned cached inverse")  ## if arr = NA, we've done this before, and should retrieve the cached
       return(arr)                         ## matrix and return it.  We're done!
  }
  
  data <- x$get()                         ## get the array and save it in local variable "data"
  
  arr <- solve(data, ...)                 ## use the solve() function to solve the array, save back into "arr"
  
  x$setinverse(arr)                       ## save the solved array to cache
  
  arr                                     ## Return arr, the solved array.  
    
}                                         ## We're done!


## BONUS ITEMS: TEST SCRIPT
## Following is a test script that I used to test my code from the command prompt.
## I create a test matrix and then invert it twice, checking to see the cache is called the second time.
## Then I take the inverted matrix, use it to create a new CacheMatrix, and then try inverting that twice,
## expecting my original result back.


##  m <- matrix(c(-1,-2,1,1),2,2)
##  x <- makeCacheMatrix(m)
##  x$get()
##  inv <- cacheSolve(x)
##  inv
##  inv <- cacheSolve(x)
##  inv
##  x <- makeCacheMatrix(inv)
##  x$get()
##  inv <- cacheSolve(x)
##  inv
##  inv <- cacheSolve(x)
##  inv

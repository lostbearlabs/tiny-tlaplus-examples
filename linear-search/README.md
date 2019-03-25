
# Tiny TLA+ Example:  Linear Search

This is an extremely simple example of using TLA+ to validate the behavior of a single-threaded algorithm.

This is adapted from the the binary search example at: 
   http://herbrete.vvv.enseirb-matmeca.fr/IF311/lecture01.xhtml
   

To validate this algorithm, create a model with values like

```
     N = 3
     MAXINT = 5
```
     
The model checker will examine all MAXINT^N possible input arrays for
all MAXINT possible values of X and ensure the correct result is returned.

To see the model checker FAIL, just break the final condition, for example
by specifying `ar[j] = x-1`



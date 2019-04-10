# tiny-tlaplus-examples

## Description

This repo contains *very small* examples of TLA+ functionality or applications, intended to help you learn TLA+.

For more sophisticated examples, see:

* https://github.com/tlaplus/Examples
* https://www.hillelwayne.com/post/list-of-tla-examples/

## List of Examples

### [state-machine](./state-machine)


TLA+ works by modeling systems via state machines.  If we model an actual state machine this way, how does the generated state graph compare to the machine we're modeling?

`#safety`

### [linear-search](./linear-search)

What does it look like to validate the correctness of a procedural algorithm?

`#correctness` 

### [secret-santa](./secret-santa)

What does it look like to model a concurrent system?

`#concurrency` `#safety` `#correctness`

### [count-down](./count-down)

What does it look like to specify a temporal condition?

`#correctness`

### [simple-logic](./simple-logic)

How can you use TLA+ to validate formulas in predicate logic?

`#correctness`

### [deadlock](./deadlock)

How can you use TLA+ to find deadlocks in a concurrent system?

`#concurrency` `#liveness`

### [race-condition](./race-condition)

What does it look like when two processes interact incorrectly due to a race condition?

`#concurrency` `#safety`

### [extends](./extends)

How can one module use operators defined in another module?

`#modules`



## Contributing

Contributions are welcome.  
* Please make sure examples are *very small*.
* Put each example in its own subfolder with a README.md file.  (These examples use README files instead of putting all documentation into the spec itself so that they will be easier to explore on Github.  As soon as a user navigates to a folder they will be reading the documentation in their browser, rather than having to navigate into the individual spec file.)
* Name sub-folders and examples using the existing pattern of "spec-name" for the folder and "SpecName.tla" for the TLA+ file.


# Tiny TLA+ Example:  Simple Logic

This is a TLA+ module that asserts some simple logical formulas to
be true.  It is modeled on https://github.com/tlaplus/Examples/blob/master/specifications/SpecifyingSystems/SimpleMath/SimpleMath.tla

Running model code like this is a good way to:

* confirm your grasp of TLA+ mathematical syntax
* check truth-tables if your 1st order logic is rusty
* etc.

You can run this model with the model checker specifying the invariant `Implication`.


At the end of the TLA file there is also an `ASSUME` statement.  This is checked as part of loading the model, and it covers exactly the same logical equation in a single statement.  You can execute this test by running the model checker with **No behavior spec** selected.  If you try this with a broken formula, for example by changing the last clause from `~F \/ G` to `~F \/ ~G` the model checking results will show you an error even though no state count or other model checking information is generated.

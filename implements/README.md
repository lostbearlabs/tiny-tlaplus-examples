
# Tiny TLA+ Example:  Implements

This is a trivial example of having one module (`ModuleB`) extend and use definitions
from another (`ModuleA`) with parameterization and namespacing.

`ImplementsA` just defines the (local) variable `A`.

`ImplementsB` creates two instances of `ImplementsA`, one named `X` and one named `Y`.

When creating a spec in the TLA+ explorer, use `ImplementsB` as the root-module file.  The explorer will automatically load both modules into editor tabs.


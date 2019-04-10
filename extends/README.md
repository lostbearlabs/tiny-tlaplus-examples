
# Tiny TLA+ Example:  Extends

This is a trivial example of having one module (`ExtendsB`) extend and use definitions
from another (`ExtendsA`).

`ExtendsA` just defines the two operators `IsEven` and `IsOdd`.

`ExtendsB` EXTENDS `ExtendsA` and models a trivial program that exercises the operators.

When creating a spec in the TLA+ explorer, use `ExtendsB` as the root-module file.  The explorer will automatically load both modules into editor tabs.


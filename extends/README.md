
# Tiny TLA+ Example:  Extends

This is a trivial example of having one module (`ModuleB`) extend and use definitions
from another (`ModuleA`).

`ModuleA` just defines the two operators `IsEven` and `IsOdd`.

`ModuleB` EXTENDS `ModuleA` and models a trival program that exercises the operators.

When creating a spec in the TLA+ explorer, use `ModuleB` as the root-module file.  The explorer will automatically load both modules into editor tabs.



---- MODULE ImplementsA ----
LOCAL INSTANCE Integers
CONSTANT A
ASSUME A \in Int

\* See README.md

IsEven == (A % 2) = 0
IsOdd == (A % 2) = 1

====

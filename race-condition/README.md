
# Tiny TLA+ Example:  Race Condition

This is the simplest example I could think of that exhibits a race condition.

We start with a variable, `count=0`.

Two processes (`A` and `B`) each attempt to read count and increment it.

If this were atomic, then we would end with `count=2`, but since the reads can overlap this sometimes fails.




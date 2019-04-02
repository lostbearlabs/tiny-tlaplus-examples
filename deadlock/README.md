
# Tiny TLA+ Example:  Deadlock

This is the simplest example I could think of that exhibits deadlock.

Two processes (`A` and `B`) compete for two resources (`Lock1` and `Lock2`).

There are no invariants or properties to check here.  Just create a default model and run it, and it will fail with a reported deadlock.  A typical example looks like this in the stack trace:


```
lock_holder:     <<"A", "B">>
pc:              [A |-> "Lock2", B |-> "Lock1"]
```

In this case, `Lock1` is held by `A` (the first element of `lock_holder`) and `Lock2` is held by `B`.  `A` now wants to acquire `Lock2` and `B` wants to acquire `Lock1`, so nobody can proceed.



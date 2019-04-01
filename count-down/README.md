
# Tiny TLA+ Example:  Count Down

This is a trivial countdown timer that counts from 10 to 0.  No rocket
ship is included.


To validate that the count decreases, we can either model check with the invariant `CountHasDecreased` or with the equivalent temporal property `CountDecreases`.

To ensure that the count reaches zero, we can check the temporal property `CountReachesZero`.




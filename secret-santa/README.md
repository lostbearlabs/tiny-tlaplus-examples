# Tiny TLA+ Example:  Secret Santa

This is an extremely simple example of using TLA+ to model a concurrent system.

In our system, we have N people participating in a "Secret Santa" exchange.  Each person is assigned one other person to give a gift to.  They can do this in any order.  Once the exchange completes, we expect each person to have received a gift.

There's no opportunity for deadlock here.

To validate that the exchange succeeds, create a model with values like

```
     N = 3
```

The model can also specify the invariants

```
	Termination   
	EverybodyGetsAGift
```

The model checker will run the gift exchange with every possible assignment
of givers to receivers and confirm that they all succeed.


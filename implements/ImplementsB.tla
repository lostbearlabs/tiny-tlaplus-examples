
---- MODULE ImplementsB ----

EXTENDS TLC, Integers

\* see README.md



(*--algorithm ImplementsB
variables
    a = 2,
    b = 3;
       
define
    \* We can initialize our instances from variables, but
    \* as we see below, changing the variable does not then update
    \* the instance
    X == INSTANCE ImplementsA WITH A <- a
    Y == INSTANCE ImplementsA WITH A <- b
    \* We can also have an instance that requires parameters
    \* when it's used.
    Z(A) == INSTANCE ImplementsA
end define;

begin

assert( X!IsEven );
assert( Y!IsOdd );

\* This changes a but not X!A
a := 3;
assert( X!IsEven );

\* This changes Z!A
a := 3;
assert( Z(a)!IsOdd );
a := 4;
assert( Z(a)!IsEven );


end algorithm;*)
\* BEGIN TRANSLATION
VARIABLES a, b, pc

(* define statement *)
X == INSTANCE ImplementsA WITH A <- a
Y == INSTANCE ImplementsA WITH A <- b


Z(A) == INSTANCE ImplementsA


vars == << a, b, pc >>

Init == (* Global variables *)
        /\ a = 2
        /\ b = 3
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ Assert(( X!IsEven ), 
                   "Failure of assertion at line 28, column 1.")
         /\ Assert(( Y!IsOdd ), "Failure of assertion at line 29, column 1.")
         /\ a' = 3
         /\ Assert(( X!IsEven ), 
                   "Failure of assertion at line 33, column 1.")
         /\ pc' = "Lbl_2"
         /\ b' = b

Lbl_2 == /\ pc = "Lbl_2"
         /\ a' = 3
         /\ Assert(( Z(a')!IsOdd ), 
                   "Failure of assertion at line 37, column 1.")
         /\ pc' = "Lbl_3"
         /\ b' = b

Lbl_3 == /\ pc = "Lbl_3"
         /\ a' = 4
         /\ Assert(( Z(a')!IsEven ), 
                   "Failure of assertion at line 39, column 1.")
         /\ pc' = "Done"
         /\ b' = b

Next == Lbl_1 \/ Lbl_2 \/ Lbl_3
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

====

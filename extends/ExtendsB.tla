
---- MODULE ExtendsB ----

EXTENDS ExtendsA, TLC

\* see README.md

(*--algorithm ExtendsB
begin

assert( IsEven(2) );
assert( IsEven(-2) );
assert( IsOdd(3) );
assert( IsOdd(-3) );

end algorithm;*)
\* BEGIN TRANSLATION
VARIABLE pc

vars == << pc >>

Init == /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ Assert(( IsEven(2) ), 
                   "Failure of assertion at line 11, column 1.")
         /\ Assert(( IsEven(-2) ), 
                   "Failure of assertion at line 12, column 1.")
         /\ Assert(( IsOdd(3) ), 
                   "Failure of assertion at line 13, column 1.")
         /\ Assert(( IsOdd(-3) ), 
                   "Failure of assertion at line 14, column 1.")
         /\ pc' = "Done"

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

====

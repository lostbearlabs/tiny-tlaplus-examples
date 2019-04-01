---------------------------- MODULE CountDown ----------------------------

\* See README.md

EXTENDS Naturals, TLC

(* PlusCal options (-termination) *)

(*--algorithm LinearSearch

variables
    N = 10,
    i = N,
    prev = i+1;

define
    \* Invariant for the model checker:  i is less than prev
    \* This is a safety condition we can check in every state
    CountHasDecreased == i<prev
    
    \* Temporal property for the model checker:  i is always less than prev.
    \* This is the same safety condition, but we can specify it this way (globally)
    \* as an alternative to specifying it as above.
    CountDecreases == [](i<prev)
    
    \* Temporal property for the model checker: i eventually reaches zero.
    CountReachesZero == <>(i=0)
end define;

begin

    while i > 0 do
        prev := i;
        i := i - 1;
    end while;
    
        
end algorithm;*)
\* BEGIN TRANSLATION
VARIABLES N, i, prev, pc

(* define statement *)
CountHasDecreased == i<prev




CountDecreases == [](i<prev)


CountReachesZero == <>(i=0)


vars == << N, i, prev, pc >>

Init == (* Global variables *)
        /\ N = 10
        /\ i = N
        /\ prev = i+1
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF i > 0
               THEN /\ prev' = i
                    /\ i' = i - 1
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ UNCHANGED << i, prev >>
         /\ N' = N

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION
=============================================================================

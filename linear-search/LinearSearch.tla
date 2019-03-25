---------------------------- MODULE LinearSearch ----------------------------

\* See README.md

EXTENDS Naturals, TLC

CONSTANT N      (* Size of arrays *)
CONSTANT MAXINT (* Max integer value *)

(* PlusCal options (-termination) *)

(*--algorithm LinearSearch

variables 
    ar \in [ 1..N -> 0..MAXINT ],  (* Array of N integers in 0..MAXINT *)
    x \in 0..MAXINT,              (* Value to find *)
    found = FALSE,
    i = 1;

begin

    Loop:
    while i <= N /\ ~found do
        found := ar[i]=x;
        i := i + 1;
    end while;
        
    FinalCheck:
    assert( found <=> (\E j \in 1..N : ar[j] = x) )      

end algorithm;*)
\* BEGIN TRANSLATION
VARIABLES ar, x, found, i, pc

vars == << ar, x, found, i, pc >>

Init == (* Global variables *)
        /\ ar \in [ 1..N -> 0..MAXINT ]
        /\ x \in 0..MAXINT
        /\ found = FALSE
        /\ i = 1
        /\ pc = "Loop"

Loop == /\ pc = "Loop"
        /\ IF i <= N /\ ~found
              THEN /\ found' = (ar[i]=x)
                   /\ i' = i + 1
                   /\ pc' = "Loop"
              ELSE /\ pc' = "FinalCheck"
                   /\ UNCHANGED << found, i >>
        /\ UNCHANGED << ar, x >>

FinalCheck == /\ pc = "FinalCheck"
              /\ Assert(( found <=> (\E j \in 1..N : ar[j] = x) ), 
                        "Failure of assertion at line 29, column 5.")
              /\ pc' = "Done"
              /\ UNCHANGED << ar, x, found, i >>

Next == Loop \/ FinalCheck
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================

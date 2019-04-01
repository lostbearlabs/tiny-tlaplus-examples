---------------------------- MODULE SimpleLogic ----------------------------

(***************************************************************************)
(* Some simple experiments in logic                                        *)
(***************************************************************************)

VARIABLES X, Y

vars == << X, Y >>


(***************************************************************************)
(* Discover all entries in a 2-value truth table.                          *)
(*                                                                         *)
(* This Init/Next spec will visit all 4 entries.  Since state transitions  *)
(* are arbitrary, it will never deadlock.                                  *)
(***************************************************************************)

Init == 
    /\ X \in {TRUE, FALSE}
    /\ Y \in {TRUE, FALSE}

Next == 
    /\ X' \in {TRUE, FALSE}
    /\ Y' \in {TRUE, FALSE}

(***************************************************************************)
(* Check the definition of implication.                                    *)
(* -> Specify Implication as an invariant of the model.                    *)
(***************************************************************************)

Foo == 
    /\ X => Y

Bar == 
    /\ ~X \/ Y

Implication == 
    /\ (Foo = Bar)





(***************************************************************************)
(* Check the same thing using an ASSUME.                                   *)
(* No model steps necessary, you can run the model with no behavioral spec.*)
(***************************************************************************)

ASSUME
  \A F, G \in {TRUE, FALSE} : (F => G) <=> ~F \/ G



=============================================================================
\* Modification History
\* Last modified Mon Apr 01 16:45:57 CDT 2019 by eric.johnson
\* Created Thu Oct 11 15:43:40 CDT 2018 by eric.johnson


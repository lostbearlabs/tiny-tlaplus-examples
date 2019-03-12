---------------------------- MODULE StateMachine ----------------------------

(*--fair algorithm stateMachine
variables
    state = "start";

define
    \* INVARIANT:  we should always be in a valid state 
    StateValid == state \in {"start", "reading", "end"}
    
    \* TEMPORAL FORMULA:  since the process is fair, we will always
    \* eventually get a Y and terminate, and once we terminate we will
    \* stay terminated
    MachineTerminates == <>[](state = "end")
end define;
    
begin


Loop:    
while state /= "end" do
    either
        \* we got an X, keep going
        state := "reading"
    or
        \* we got a Y, terminate
        state := "end"
    end either;
end while;


end algorithm;*)
\* BEGIN TRANSLATION
VARIABLES state, pc

(* define statement *)
StateValid == state \in {"start", "reading", "end"}




MachineTerminates == <>[](state = "end")


vars == << state, pc >>

Init == (* Global variables *)
        /\ state = "start"
        /\ pc = "Loop"

Loop == /\ pc = "Loop"
        /\ IF state /= "end"
              THEN /\ \/ /\ state' = "reading"
                      \/ /\ state' = "end"
                   /\ pc' = "Loop"
              ELSE /\ pc' = "Done"
                   /\ state' = state

Next == Loop
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION


=============================================================================

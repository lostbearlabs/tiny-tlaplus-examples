---------------------------- MODULE Deadlock ----------------------------

\* See README.md

EXTENDS Integers, TLC

(*--algorithm Deadlock

variables 
    NOBODY = "",
    COMPETITORS = {"A", "B"},    
    LOCKS = {1, 2},
    lock_holder = [ i \in LOCKS |-> NOBODY ];

define
   NotHeldByOther(lock, me) == lock_holder[lock]=me \/ lock_holder[lock]=NOBODY
end define;

process competitor \in COMPETITORS
begin
    Loop:
    while TRUE do 
        either
            Lock1:
            await NotHeldByOther(1, self);
            lock_holder[1] := self;
        or
            Lock2:
            await NotHeldByOther(2, self);
            lock_holder[2] := self;
        or
            Unlock1:
            if lock_holder[1] = self then
                lock_holder[1] := NOBODY;
            end if;
        or
            Unlock2:
            if lock_holder[2] = self then
            lock_holder[2] := NOBODY;
            end if;
        end either;
    end while;
end process;



end algorithm;*)
\* BEGIN TRANSLATION
VARIABLES NOBODY, COMPETITORS, LOCKS, lock_holder, pc

(* define statement *)
NotHeldByOther(lock, me) == lock_holder[lock]=me \/ lock_holder[lock]=NOBODY


vars == << NOBODY, COMPETITORS, LOCKS, lock_holder, pc >>

ProcSet == (COMPETITORS)

Init == (* Global variables *)
        /\ NOBODY = ""
        /\ COMPETITORS = {"A", "B"}
        /\ LOCKS = {1, 2}
        /\ lock_holder = [ i \in LOCKS |-> NOBODY ]
        /\ pc = [self \in ProcSet |-> "Loop"]

Loop(self) == /\ pc[self] = "Loop"
              /\ \/ /\ pc' = [pc EXCEPT ![self] = "Lock1"]
                 \/ /\ pc' = [pc EXCEPT ![self] = "Lock2"]
                 \/ /\ pc' = [pc EXCEPT ![self] = "Unlock1"]
                 \/ /\ pc' = [pc EXCEPT ![self] = "Unlock2"]
              /\ UNCHANGED << NOBODY, COMPETITORS, LOCKS, lock_holder >>

Lock1(self) == /\ pc[self] = "Lock1"
               /\ NotHeldByOther(1, self)
               /\ lock_holder' = [lock_holder EXCEPT ![1] = self]
               /\ pc' = [pc EXCEPT ![self] = "Loop"]
               /\ UNCHANGED << NOBODY, COMPETITORS, LOCKS >>

Lock2(self) == /\ pc[self] = "Lock2"
               /\ NotHeldByOther(2, self)
               /\ lock_holder' = [lock_holder EXCEPT ![2] = self]
               /\ pc' = [pc EXCEPT ![self] = "Loop"]
               /\ UNCHANGED << NOBODY, COMPETITORS, LOCKS >>

Unlock1(self) == /\ pc[self] = "Unlock1"
                 /\ IF lock_holder[1] = self
                       THEN /\ lock_holder' = [lock_holder EXCEPT ![1] = NOBODY]
                       ELSE /\ TRUE
                            /\ UNCHANGED lock_holder
                 /\ pc' = [pc EXCEPT ![self] = "Loop"]
                 /\ UNCHANGED << NOBODY, COMPETITORS, LOCKS >>

Unlock2(self) == /\ pc[self] = "Unlock2"
                 /\ IF lock_holder[2] = self
                       THEN /\ lock_holder' = [lock_holder EXCEPT ![2] = NOBODY]
                       ELSE /\ TRUE
                            /\ UNCHANGED lock_holder
                 /\ pc' = [pc EXCEPT ![self] = "Loop"]
                 /\ UNCHANGED << NOBODY, COMPETITORS, LOCKS >>

competitor(self) == Loop(self) \/ Lock1(self) \/ Lock2(self)
                       \/ Unlock1(self) \/ Unlock2(self)

Next == (\E self \in COMPETITORS: competitor(self))

Spec == Init /\ [][Next]_vars

\* END TRANSLATION

=============================================================================

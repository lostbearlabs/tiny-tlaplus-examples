--------------------------- MODULE ListOperations ---------------------------

\* See README.md

EXTENDS Naturals, Sequences, TLC

CONSTANT N      (* Number of elements *)

(* PlusCal options (-termination) *)

(*--algorithm ListOperations

variables 
    list = << >>,
    rlist = << >>,
    i = 1;

define
    \* List reversal operator in declarative style
    Reverse(seq) == [ j \in 1..Len(seq) |-> seq[ Len(seq) - j + 1 ] ]
    
    \* List reversal operator in functional style
    RECURSIVE RecursiveReverse2(_, _) 
    RecursiveReverse2(seq, accum) == IF seq = <<>> THEN accum ELSE RecursiveReverse2( Tail(seq), << Head(seq) >> \o accum )
    RecursiveReverse(seq) == RecursiveReverse2(seq, << >>)
end define;

begin

    Loop:
    while i <= N do
    
        AppendToList:
        list := Append(list, i);
        rlist := << i >> \o rlist;
        
        CheckList:
        assert( Head(list) = 1 );
        assert( Head(rlist) = i );
        
        assert( list[i] = i );
        assert( rlist[i] = 1 );
        
        assert( Len(list) = i );
        assert( Len(rlist) = i );

        assert( Reverse(list) = rlist );
        assert( Reverse(rlist) = list );

        assert( RecursiveReverse(list) = rlist );
        assert( RecursiveReverse(rlist) = list );

        IncrementCounter:
        i := i + 1;
        
    end while;
        

end algorithm;*)
\* BEGIN TRANSLATION
VARIABLES list, rlist, i, pc

(* define statement *)
Reverse(seq) == [ j \in 1..Len(seq) |-> seq[ Len(seq) - j + 1 ] ]


RECURSIVE RecursiveReverse2(_, _)
RecursiveReverse2(seq, accum) == IF seq = <<>> THEN accum ELSE RecursiveReverse2( Tail(seq), << Head(seq) >> \o accum )
RecursiveReverse(seq) == RecursiveReverse2(seq, << >>)


vars == << list, rlist, i, pc >>

Init == (* Global variables *)
        /\ list = << >>
        /\ rlist = << >>
        /\ i = 1
        /\ pc = "Loop"

Loop == /\ pc = "Loop"
        /\ IF i <= N
              THEN /\ pc' = "AppendToList"
              ELSE /\ pc' = "Done"
        /\ UNCHANGED << list, rlist, i >>

AppendToList == /\ pc = "AppendToList"
                /\ list' = Append(list, i)
                /\ rlist' = << i >> \o rlist
                /\ pc' = "CheckList"
                /\ i' = i

CheckList == /\ pc = "CheckList"
             /\ Assert(( Head(list) = 1 ), 
                       "Failure of assertion at line 38, column 9.")
             /\ Assert(( Head(rlist) = i ), 
                       "Failure of assertion at line 39, column 9.")
             /\ Assert(( list[i] = i ), 
                       "Failure of assertion at line 41, column 9.")
             /\ Assert(( rlist[i] = 1 ), 
                       "Failure of assertion at line 42, column 9.")
             /\ Assert(( Len(list) = i ), 
                       "Failure of assertion at line 44, column 9.")
             /\ Assert(( Len(rlist) = i ), 
                       "Failure of assertion at line 45, column 9.")
             /\ Assert(( Reverse(list) = rlist ), 
                       "Failure of assertion at line 47, column 9.")
             /\ Assert(( Reverse(rlist) = list ), 
                       "Failure of assertion at line 48, column 9.")
             /\ Assert(( RecursiveReverse(list) = rlist ), 
                       "Failure of assertion at line 50, column 9.")
             /\ Assert(( RecursiveReverse(rlist) = list ), 
                       "Failure of assertion at line 51, column 9.")
             /\ pc' = "IncrementCounter"
             /\ UNCHANGED << list, rlist, i >>

IncrementCounter == /\ pc = "IncrementCounter"
                    /\ i' = i + 1
                    /\ pc' = "Loop"
                    /\ UNCHANGED << list, rlist >>

Next == Loop \/ AppendToList \/ CheckList \/ IncrementCounter
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================

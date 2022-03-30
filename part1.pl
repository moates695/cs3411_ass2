% Marcus Oates
% COMP3411 Term 1 2022
% Assignment 2 Part 1

% Question 1.1

% sumsq_even(Numbers, Sum) - sum the square of even integers in Numbers list

sumsq_even([], 0).

sumsq_even([Head|Tail], Sum) :-
    1 is Head mod 2,
    sumsq_even(Tail, Sum1),
    Sum is Sum1.

sumsq_even([Head|Tail], Sum) :-
    0 is Head mod 2,
    sumsq_even(Tail, Sum1),
    Sum is Sum1 + Head * Head.


% Question 1.2

% action(Action, State, NewState)
% state(RLoc, RHC, SWC, MW, RHM)

action(mc,                                  % Move c from cs to off
       state(cs, RHC, SWC, MW, RHM), 
       state(off, RHC, SWC, MW, RHM)).      

action(mc,                                  % Move c from off to lab
       state(off, RHC, SWC, MW, RHM), 
       state(lab, RHC, SWC, MW, RHM)).     

action(mc,                                  % Move c from lab to mr
       state(lab, RHC, SWC, MW, RHM), 
       state(mr, RHC, SWC, MW, RHM)).      

action(mc,                                  % Move c from mr to cs
       state(mr, RHC, SWC, MW, RHM), 
       state(cs, RHC, SWC, MW, RHM)).       

action(mcc,                                 % Move cc from cs to mr
       state(cs, RHC, SWC, MW, RHM), 
       state(mr, RHC, SWC, MW, RHM)).      

action(mcc,                                 % Move cc from mr to lab
       state(mr, RHC, SWC, MW, RHM), 
       state(lab, RHC, SWC, MW, RHM)).     

action(mcc,                                 % Move cc from lab to off
       state(lab, RHC, SWC, MW, RHM), 
       state(off, RHC, SWC, MW, RHM)).    

action(mcc,                                 % Move cc from off to cs
       state(off, RHC, SWC, MW, RHM), 
       state(cs, RHC, SWC, MW, RHM)).     

action(puc,                                 
       state(cs, false, true, MW, RHM),
       state(cs, true, true, MW, RHM)).

action(dc,
       state(off, true, true, MW, RHM),
       state(off, false, false, MW, RHM)).

action(pum,
       state(mr, RHC, SWC, true, false),
       state(mr, RHC, SWC, false, true)).

action(dm,
       state(off, RHC, SWC, MW, true),
       state(off, RHC, SWC, MW, false)).

% plan(StartState, FinalState, Plan)

plan(State, State, []).

plan(State1, GoalState, [Action1 | RestofPlan]) :-
	action(Action1, State1, State2),	
	plan(State2, GoalState, RestofPlan).

id_plan(Start, Goal, Plan) :-
    append(Plan, _, _),
    plan(Start, Goal, Plan).
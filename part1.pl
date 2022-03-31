% Marcus Oates
% z5257541
% COMP3411 Term 1 2022
% Assignment 2 - Part 1
 
%-------------------------------------------------------------------------------
% Question 1.1
%-------------------------------------------------------------------------------

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

%-------------------------------------------------------------------------------
% Question 1.2
%-------------------------------------------------------------------------------

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

action(puc,                                 % Pick up coffee                           
       state(cs, false, true, MW, RHM),     % Before action, robot at Coffee Shop 
                                            % without coffee and Sam wants coffee
       state(cs, true, true, MW, RHM)).     % After action, robot at Coffee Shop 
                                            % with coffee and Sam wants coffee

action(dc,                                  % Deliver coffee
       state(off, true, true, MW, RHM),     % Before action, robot at Sams Office
                                            % with coffee and Sam wants coffee
       state(off, false, false, MW, RHM)).  % After action, robot at Sams Office
                                            % without coffee and Sam does not want coffee

action(pum,                                 % Pick up mail
       state(mr, RHC, SWC, true, false),    % Before action, robot at Mail Room
                                            % without mail and mail is waiting
       state(mr, RHC, SWC, false, true)).   % After action, robot at Mail Room
                                            % with mail and mail is not waiting

action(dm,                                  % Deliver mail
       state(off, RHC, SWC, MW, true),      % Before action, robot at Sams Office
                                            % with mail
       state(off, RHC, SWC, MW, false)).    % After action, robot at Sams Office
                                            % without mail

% plan(StartState, FinalState, Plan)

plan(State, State, []).

plan(State1, GoalState, [Action1 | RestofPlan]) :-
	action(Action1, State1, State2),	
	plan(State2, GoalState, RestofPlan).

id_plan(Start, Goal, Plan) :-
    append(Plan, _, _),
    plan(Start, Goal, Plan).

%-------------------------------------------------------------------------------
% Question 1.3a
%-------------------------------------------------------------------------------

:- op(300, xfx, <-).

intra_construction(C1 <- B1, C2 <- B2, C1 <- ZB, C <- D1, C <- D2) :-
    C1 = C2,
    intersection(B1, B2, B),
    gensym(z, C),
    subtract(B1, B, D1),
    subtract(B2, B, D2),
    append(B, [C], ZB).

%-------------------------------------------------------------------------------
% Question 1.3b
%-------------------------------------------------------------------------------

:- op(300, xfx, <-).

absorption(C1 <- B1, C2 <- B2, C1 <- B1C2, C2 <- B2) :-
    C1 \= C2,
    subset(B2, B1),
    subtract(B1, B2, B),
    append([C2], B, B1C2).

absorption(C1 <- B1, C2 <- B2, C1 <- B1, C2 <- B2C1) :-
    C1 \= C2,
    subset(B1, B2),
    subtract(B2, B1, B),
    append([C1], B, B2C1).

%-------------------------------------------------------------------------------
% Question 1.3c
%-------------------------------------------------------------------------------
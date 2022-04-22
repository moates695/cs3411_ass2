% Marcus Oates
% z5257541
% COMP3411 Term 1 2022
% Assignment 2 - Part 1
 
%-------------------------------------------------------------------------------
% Question 1.1
%-------------------------------------------------------------------------------

% sumsq_even(Numbers, Sum) - sum the square of even integers in Numbers list

sumsq_even([], 0).                          % Empty list has zero sum

sumsq_even([Head|Tail], Sum) :-             % Rule where Head is odd
    1 is Head mod 2,                        % Head must be odd
    sumsq_even(Tail, Sum1),                 % Sum1 is the sum of the Tail
    Sum is Sum1.                            % Add Sum1 to Sum

sumsq_even([Head|Tail], Sum) :-             % Rule where Head is even
    0 is Head mod 2,                        % Head must be even
    sumsq_even(Tail, Sum1),                 % Sum1 is the sum of the Tail
    Sum is Sum1 + Head * Head.              % Add Sum1 and the square of Head to Sum

%-------------------------------------------------------------------------------
% Question 1.2
%-------------------------------------------------------------------------------

% action(Action, State, NewState) - taking Action moves robot from State to Newstate
% state(RLoc, RHC, SWC, MW, RHM) - current state of robot where RLoc = robot location
%                                  RHC = robot has coffee, SWC = Sam wants coffee,
%                                  MW = mail waiting, RHM = robot has mail

action(mc,                                  % Move clockwise from cs to off
       state(cs, RHC, SWC, MW, RHM), 
       state(off, RHC, SWC, MW, RHM)).      

action(mc,                                  % Move clockwise from off to lab
       state(off, RHC, SWC, MW, RHM), 
       state(lab, RHC, SWC, MW, RHM)).     

action(mc,                                  % Move clockwise from lab to mr
       state(lab, RHC, SWC, MW, RHM), 
       state(mr, RHC, SWC, MW, RHM)).      

action(mc,                                  % Move clockwise from mr to cs
       state(mr, RHC, SWC, MW, RHM), 
       state(cs, RHC, SWC, MW, RHM)).       

action(mcc,                                 % Move counterclockwise from cs to mr
       state(cs, RHC, SWC, MW, RHM), 
       state(mr, RHC, SWC, MW, RHM)).      

action(mcc,                                 % Move counterclockwise from mr to lab
       state(mr, RHC, SWC, MW, RHM), 
       state(lab, RHC, SWC, MW, RHM)).     

action(mcc,                                 % Move counterclockwise from lab to off
       state(lab, RHC, SWC, MW, RHM), 
       state(off, RHC, SWC, MW, RHM)).    

action(mcc,                                 % Move counterclockwise from off to cs
       state(off, RHC, SWC, MW, RHM), 
       state(cs, RHC, SWC, MW, RHM)).     

action(puc,                                 % Pick up coffee                           
       state(cs, false, true, MW, RHM),      % Before action, robot at Coffee Shop 
                                            % without coffee and Sam wants coffee
       state(cs, true, true, MW, RHM)).      % After action, robot at Coffee Shop 
                                            % with coffee and Sam wants coffee

action(dc,                                  % Deliver coffee
       state(off, true, _, MW, RHM),        % Before action, robot at Sams Office
                                            % with coffee
       state(off, false, false, MW, RHM)).  % After action, robot at Sams Office
                                            % without coffee and Sam doesnt want coffee

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


% Below is given code for plan and id_plan rules

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

% intra_construction(A, B, C, D, E) - input is two rules A & B with idential heads, 
%                                     returns the intersection of A & B in C with 
%                                     the differences D & E cast to created predicate z

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

% absorption(A, B, C, D) - input is two rules A & B with different heads, returns
%                          the smaller input (B = D if |A| > |B|) unmodified with 
%                          the difference to the larger input alongside the 
%                          smaller inputs head (in C if |A| > |B|).
%                          inputs must be a subset of one another

absorption(C1 <- B1, C2 <- B2, C1 <- B1C2, C2 <- B2) :-
    C1 \= C2,
    subset(B2, B1),
    subtract(B1, B2, B),
    append([C2], B, B1C2).

%-------------------------------------------------------------------------------
% Question 1.3c
%-------------------------------------------------------------------------------

% truncation(A, B, C) - input is two rules with identical heads, returns the 
%                       intersection of the A & B into C

truncation(C1 <- B1, C2 <- B2, C1 <- B) :-
    C1 = C2,
    intersection(B1, B2, B).


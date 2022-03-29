% Marcus Oates
% COMP3411 Term 1 2022
% Assignment 2 Part 1

% sumsq_even(Numbers, Sum) - sum odd integers and the square of even integers
% in the Numbers list

sumsq_even([], 0).
sumsq_even([Head|Tail], Sum) :-
    1 is Head mod 2,
    sumsq_even(Tail, Sum1),
    Sum is Sum1 + Head.
sumsq_even([Head|Tail], Sum) :-
    0 is Head mod 2,
    sumsq_even(Tail, Sum1),
    Sum is Sum1 + Head * Head.
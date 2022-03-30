:- consult(part1).

:- begin_tests(part1_1).
    test(sumsq_even1, [nondet]) :-
        sumsq_even([], 0).

    test(sumsq_even2, [nondet]) :-
        sumsq_even([0], 0).

    test(sumsq_even3, [nondet]) :-
        sumsq_even([1], 0).

    test(sumsq_even4, [nondet]) :-
        sumsq_even([2], 4).

    test(sumsq_even5, [nondet]) :-
        sumsq_even([-2], 4).

    test(sumsq_even6, [nondet]) :-
        sumsq_even([1, 0, -1], 0).

    test(sumsq_even7, [nondet]) :-
        sumsq_even([3, -4, 3, 2, -9, -6], 56).
:- end_tests(part1_1).

:- run_tests.
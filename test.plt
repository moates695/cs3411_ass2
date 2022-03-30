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

:- begin_tests(part1_2).
    test(id_plan1, [nondet]) :-
        id_plan(state(lab, false, true, false, false),
                state(_, _, false, _, _),
                [mc, mc, puc, mc, dc]).

    test(id_plan2, [nondet]) :-
        id_plan(state(lab, false, true, true, false),
                state(_, _, false, _, false),
                [mc, mc, puc, mc, dc]).

    test(id_plan3, [nondet]) :-
        id_plan(state(lab, false, true, true, false),
                state(_, _, false, false, false),
                [mc, pum, mc, puc, mc, dc, dm]).

    test(id_plan4, [nondet]) :-
        id_plan(state(off, true, true, false, false),
                state(_, _, false, _, _),
                [dc]).

    test(id_plan5, [nondet]) :-
        id_plan(state(off, true, true, false, true),
                state(_, _, false, _, _),
                [dc]).

    test(id_plan6, [nondet]) :-
        id_plan(state(mr, true, true, true, true),
                state(_, _, false, false, false),
                [mc, mc, dm, dc, mc, mc, pum, mcc, mcc, dm]).

    test(id_plan7, [nondet]) :-
        id_plan(state(lab, true, false, true, true),
                state(_, _, _, false, false),
                [mcc, dm, mc, mc, pum, mcc, mcc, dm]).

    test(id_plan8, [nondet]) :-
        id_plan(state(cs, true, false, true, true),
                state(_, _, _, false, _),
                [mc, dm, mc, mc, pum]).
:- end_tests(part1_2).

:- run_tests.
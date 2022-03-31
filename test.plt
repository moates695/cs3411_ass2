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

:- begin_tests(part1_3a).
    test(intra_construction1, [nondet]) :-
        reset_gensym,
        intra_construction(x <- [b, c, d, e], 
                           x <- [a, b, d, f],
                           x <- [b, d, z1],
                           z1 <- [c, e],
                           z1 <- [a, f]).

    test(intra_construction2, [nondet]) :-
        reset_gensym,
        intra_construction(x <- [b], 
                           x <- [a],
                           x <- [z1],
                           z1 <- [b],
                           z1 <- [a]).

    test(intra_construction3, [nondet]) :-
        reset_gensym,
        intra_construction(x <- [b], 
                           x <- [b],
                           x <- [b, z1],
                           z1 <- [],
                           z1 <- []).

    test(intra_construction4, [nondet]) :-
        reset_gensym,
        intra_construction(x <- [b, c], 
                           x <- [a, d],
                           x <- [z1],
                           z1 <- [b, c],
                           z1 <- [a, d]).
    
    test(intra_construction5, [nondet]) :-
        reset_gensym,
        intra_construction(x <- [b, c], 
                           x <- [b, c],
                           x <- [b, c, z1],
                           z1 <- [],
                           z1 <- []).

    test(intra_construction3, [nondet]) :-
        reset_gensym,
        intra_construction(x <- [b, c, d, x, t, y], 
                           x <- [c, o, i, x, d, t, h, q],
                           x <- [c, d, x, t, z1],
                           z1 <- [b, y],
                           z1 <- [o, i, h, q]).
:- end_tests(part1_3a).

:- begin_tests(part1_3b).
    test(absorption1, [nondet]) :-
        absorption(x <- [a, b, c, d, e],
                   y <- [a, b, c],
                   x <- [y, d, e],
                   y <- [a, b, c]).

    test(absorption2, [nondet]) :-
        absorption(x <- [a, b, c],
                   y <- [a, b, c, d, e],
                   x <- [a, b, c],
                   y <- [x, d, e]).

    test(absorption3, [nondet]) :-
        absorption(x <- [a, b, c],
                   y <- [a, b, c],
                   x <- [y],
                   y <- [a, b, c]).

    test(absorption4, [nondet]) :-
        absorption(x <- [a, b, c],
                   y <- [a, b, c],
                   x <- [y],
                   y <- [a, b, c]).

    test(absorption5, [nondet]) :-
        absorption(x <- [a, b, c, d, e],
                   y <- [b, d],
                   x <- [y, a, c, e],
                   y <- [b, d]).

    test(absorption6, [nondet]) :-
        absorption(x <- [b, d],
                   y <- [a, b, c, d, e],
                   x <- [b, d],
                   y <- [x, a, c, e]).
:- end_tests(part1_3b).

:- run_tests.
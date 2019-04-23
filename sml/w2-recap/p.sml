fun swap(pr: int*bool) =
    (#2 pr, #1 pr);

fun sum_two_pairs2 (pr1: int*int, pr2: int*int) =
    ((#1 pr1) + (#1 pr2), (#1 pr2) + (#2 pr2));

fun sum_two_pairs (pr1: int*int, pr2: int*int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2);

fun div_mod (x: int, y: int) =
    (x div y, x mod y);

fun sort_pair (pr: int*int) =
    if (#1 pr) < (#2 pr)
    then pr
    else (#2 pr, #1 pr);

val l = [1, 2, 3];
val l2 = 5::l;

fun sum_list (xs: int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs);

sum_list [1, 2, 3];

fun countdown (x: int) =
    if x=0
    then []
    else x::countdown(x-1);

countdown 7;

fun append (xs: int list, ys: int list) =
    if null xs
    then ys
    else hd xs :: append(tl xs, ys);

append([1, 2, 3], [4, 5]);

fun sum_pair_list (xs: (int*int) list) =
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs);

sum_pair_list [(1, 2), (2, 4)]; 

fun firsts (xs: (int*int) list) =
    if null xs
    then []
    else (#1 (hd xs))::firsts(tl xs);

firsts [(1, 2), (2, 4)]; 

fun seconds (xs: (int*int) list) =
    if null xs
    then []
    else (#2 (hd xs))::seconds(tl xs);

seconds [(1, 2), (2, 4)]; 

fun countup_from1 (x: int) =
    let
        fun count (from: int) =
            if from=x
            then x::[]
            else from::count(from+1);
    in
        count(1)
    end;

countup_from1(4);

fun bad_max (xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs);

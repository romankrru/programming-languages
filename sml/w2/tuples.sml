fun swap (pr: int * bool) =
    (#2 pr, #1 pr);

val x = swap((44, false));

(* (int * int) * (int * int) -> int *)
fun sum_two_pairs (pr1: int * int, pr2: int * int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2);

val y = sum_two_pairs((1, 5), (23, 4));

fun div_mod (x: int, y: int) =
    (x div y, x mod y);

val z = div_mod(34, 6);

fun sort_pair(pr: int * int) =
    if (#1 pr) < (#2 pr)
    then pr
    else (#2 pr, #1 pr);

val a = sort_pair((6, 1));

(* same as calling swap((2, false)) *)
val x = swap(2, false);

fun countup (from: int, to: int) =
    if to=from
    then [to]
    else from::countup(from + 1, to);

fun countdown (from: int, to: int) =
    if to=from
    then [to]
    else from::countdown(from - 1, to);

countup(1, 5);
countdown(9, 1);

fun bad_max (xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs);

fun good_max (xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
        let val tl_ans = good_max(tl xs)
        in
            if hd xs > tl_ans
            then hd xs
            else tl_ans
        end;

val a = bad_max(countdown(10, 1));
val b = good_max(countdown(10, 1));

(* val a2 = bad_max(countup(1, 26)); *)

(*
[1, 2, 3]

*)


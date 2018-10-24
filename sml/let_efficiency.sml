fun countup (from: int, to: int) =
    if from=to
    then to::[]
    else from :: countup(from + 1, to);

countup(2, 12);

fun countdown (from: int, to: int) =
    if from=to
    then to::[]
    else from :: countdown(from - 1, to);

countdown(20, 11);

fun bad_max (xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs);

bad_max [1, 3, 2, 7];

bad_max(countdown(300, 1));

bad_max(countup(1, 20));
(* bad_max(countup(1, 28));        (* has a noticable delay *) *)

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

good_max(countup(1, 3000));

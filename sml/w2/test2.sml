fun countup (from: int, to: int) =
    if from=to
    then from::[]
    else from :: countup(from + 1, to);

countup(1, 5);

fun countdown (from: int, to: int) =
    if from=to
    then from::[]
    else from :: countdown(from - 1, to);

countdown(30, 1);

fun bad_max (xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs);

bad_max(countup(1, 20));

fun good_max (xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
        let
            val tl_ans = good_max(tl xs)
        in
            if hd xs > tl_ans
            then hd xs
            else tl_ans
        end;

good_max(countdown(30, 1));

(* OPTIONS *)

(* fn: int list -> int option *)
fun max1 (xs : int list) =
    if null xs
    then NONE
    else
        let
            val tl_ans = max1(tl xs)
        in
            if isSome tl_ans andalso valOf tl_ans > hd xs
            then tl_ans
            else SOME (hd xs)
        end;

max1(countup(1, 30));

fun max2 (xs : int list) =
    if null xs
    then NONE
    else
        let
            fun max_nonempty (xs : int list) =
                if null (tl xs)
                then hd xs
                else
                    let
                        val tl_ans = max_nonempty(tl xs)
                    in
                        if hd xs > tl_ans
                        then hd xs
                        else tl_ans
                    end
        in
            SOME (max_nonempty xs)
        end;

max2(countup(1, 90))

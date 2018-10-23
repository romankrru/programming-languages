fun count (from : int, to: int) =
    if from=to
    then to :: []
    else from :: count(from + 1, to);

count(4, 9);

fun countup_from1 (x:int) =
    count(1, x);

countup_from1 12;

fun countup_from1_with_let (x: int) =
    let
        fun count (from : int) =
            if from=x
            then x::[]
            else from :: count(from + 1);
    in
        count(1)
    end;

countup_from1_with_let 10;

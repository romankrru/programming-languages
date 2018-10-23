(* Sum list *)
fun sum_list (xs: int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs);

sum_list [1, 2, 3, 5];

(* Mul list *)
fun product_list (xs: int list) =
    if null xs
    then 1
    else hd xs * product_list(tl xs);

product_list [2, 3, 3];

(* Countdown *)
fun countdown (x: int) =
    if x=0
    then []
    else x :: countdown(x - 1);

countdown 8;

(* Append *)
fun append (xs1: int list, xs2: int list) =
    if null xs1
    then xs2
    else hd xs1 :: append((tl xs1), xs2);

append([1, 2, 3], [3, 4]);

val l = [];
val l = [3, 4, 5];
val l = [(3+ 5), 2, 2 - 3];
val l = [true, false];

(* can't mix types [false, 23, 44] *)

(* conj *)
val x = [1, 2, 3];
val t = 4::x;
val a = 23::24::x;

(* does not typecheck [5]::x *)

val a = [4]::[[1, 2, 3], [1]];


(* CHECK FOR EMPTY *)

null x;                         (* false *)
null [];                        (* true *)

(* ACCESSING LISTS *)

hd [1, 2, 3];                   (* returns first element *)
tl [1, 3, 4, 5];                (* returns other elements (tail) *)
tl (tl (tl [1, 2, 3, 4, 5, 6]));

(* LIST FUNCTIONS *)

fun sum_list (xs: int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs);

sum_list [1, 2, 3, 4, 3, 43, 1];

fun list_product (xs: int list) =
    if null xs
    then 1
    else hd xs * list_product(tl xs);

list_product [2, 3, 3];

fun countdown (x: int) =
    if x=0
    then []
    else x::countdown(x-1);

countdown(13);

fun append (xs: int list, ys: int list) =
    if null xs
    then ys
    else (hd xs) :: (append((tl xs), ys));

append([1, 2, 3], [4, 5]);

(* FUNCTIONS OVER PAIRS OF LISTS *)

fun sum_pair_list (xs: (int * int) list) =
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs);

sum_pair_list [(1, 2), (3, 4), (5, 6)];

fun firsts (xs: (int * int) list) =
    if null xs
    then []
    else #1 (hd xs) :: firsts(tl xs);

firsts [(1, 2), (4, 6), (6, 2)]; (* [1, 4, 6] *)

fun seconds (xs: (int * int) list) =
    if null xs
    then []
    else #2 (hd xs) :: seconds(tl xs);

seconds [(1, 2), (4, 6), (6, 2)]; (* [2, 6, 2] *)

fun sum_pair_list2 (xs: (int * int) list) =
    sum_list(firsts xs) + sum_list(seconds xs);

sum_pair_list2 [(1, 2), (3, 4), (5, 6)];

fun factorial (n: int) =
    if n=0
    then 1
    else n * factorial(n - 1);

factorial 5;

fun factorial2 (n: int) =
    product_list(countdown n);

factorial2 5;

fun increment_n_times_lame (n, x) =
    if n=0
    then x
    else 1 + increment_n_times_lame(n-1, x);

fun double_n_times_lame (n, x) =
    if n=0
    then x
    else 2 * double_n_times_lame(n-1,x);

fun nth_tail_lame (n, xs) =
    if n = 0
    then xs
    else tl (nth_tail_lame(n-1, xs));

nth_tail_lame(2, [1, 2, 3]);

fun n_times (f, n, x) =
    if n=0
    then x
    else f(n_times(f, n-1, x));

fun inc x = x + 1;
fun double x = x + x;

fun triple_n_times (n, x) =
    n_times(fn x => x * 3, n, x);

fun map (f, xs) =
    case xs of
        [] => []
      | x::xs' => (f x) :: map(f, xs');

fun filter (f, xs) =
    case xs of
        [] => []
      | x::xs' => if f(x)
                  then x::filter(f, xs')
                  else filter(f, xs');

filter(fn x => x < 3, [1, 2, 3, 1, 2, 1, 34, 32, 33, 324]);

(* fun fold (f, acc, xs) = *)
(*     case xs of *)
(*         [] => acc *)
(*       | x::xs' => fold(f, f(acc, x), xs'); *)

fun sorted3_tupled (x,y,z) = z >= y andalso y>= x;
val t1 = sorted3_tupled(7, 9, 11);

val sorted3 = fn x => fn y => fn z => z >= y andalso y> x;
fun sorted3_nicer x y z = z >= y andalso y >= x;
val t2 = sorted3 7 9 11;
val t3 = sorted3_nicer 7 9 11;

fun fold f acc xs =
    case xs of
        [] => acc
      | x::xs' => fold f (f(acc, x)) xs';

val is_nonnegative = sorted3_nicer 0 0;
val sum = fold (fn (x, y) => x + y) 0;

fun range i j =
    if i > j
    then []
    else i::range (i+1) j;

(* Abstract Data type *)
datatype set = S of {insert: int -> set,
                     member: int -> bool,
                     size: unit -> int};

val empty_set =
    let
        fun make_set xs =
            let
                fun contains i = List.exists (fn j => j=i) xs
            in
                S {insert = fn i => if contains i
                                    then make_set xs
                                    else make_set (i::xs),
                   member = contains,
                   size = fn () => length xs}
            end
    in
        make_set []
    end;

(* example client *)
fun use_sets () =
    let val S s1 = empty_set
        val S s2 = (#insert s1) 34
        val S s3 = (#insert s2) 34
        val S s4 = #insert s3 19
    in
        if (#member s4) 42
        then 99
        else if (#member s4) 19
        then 17 + (#size s3) ()
        else 0
    end;

use_sets();

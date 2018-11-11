datatype my_int_list = Empty
                     | Cons of int * my_int_list;

val x = Cons(4, Cons(23, Cons(2008, Empty)));

fun append_my_list (xs, ys) =
    case xs of
        Empty => ys
      | Cons (x, xs') => Cons(x, append_my_list(xs', ys));

val y = Cons(4, Cons(23, Cons(2008, Empty)));

append_my_list(x, y);

fun inc_or_zero intoption =
    case intoption of
        NONE => 0
      | SOME i => i + 1;

inc_or_zero(NONE);
inc_or_zero(SOME 23);

fun sum_list xs =
    case xs of
        [] => 0
      | x::xs' => x + sum_list xs';

sum_list([1, 2, 3, 4]);

fun append_list (xs, ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append_list(xs', ys);

append_list([1, 3], [5, 6]);

fun my_null xs = case xs of
                     [] => true
                   | x::xs' => false;

my_null [];
my_null [1, 3];

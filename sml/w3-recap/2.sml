datatype my_int_list = Empty
                     | Cons of int * my_int_list;

val x = Cons(4, Cons(23, Cons(2008, Empty)));

fun append_my_list (xs, ys) =
    case xs of
        Empty => ys
      | Cons(x, xs') => Cons(x, append_my_list(xs', ys));

val y = Cons(1, Cons(2, Empty));

fun inc_or_zero intoption =
    case intoption of
        NONE => 0
      | SOME i => i + 1;

fun sum_list xs =
    case xs of
        [] => 0
      | x::xs' => x + sum_list(xs');

fun append (xs, ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append(xs', ys);

datatype ('a, 'b) tree = Node of 'a * ('a, 'b) tree * ('a, 'b) tree
                       | Leaf of 'b;

fun sum_tree tr =
    case tr of
        Leaf i => i
      | Node (i, lft, rgt) => i + sum_tree lft + sum_tree rgt;

fun sum_leaves tr =
    case tr of
        Leaf i => i
      | Node(i, lft, rgt) => sum_leaves lft + sum_leaves rgt;

fun num_leaves tr =
    case tr of
        Leaf i => 1
      | Node(i, lft, rgt) => num_leaves lft + num_leaves rgt;

exception ListLenghtMismatch;

fun zip3 triple =
    case triple of
        ([], [], []) => []
      | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3)::zip3(tl1, tl2, tl3)
      |  _ => raise ListLenghtMismatch;

fun unzip3 xs =
    case xs of
        [] => ([], [], [])
      | (a,b,c)::tl => let val (l1, l2, l3) = unzip3 tl
                       in
                           (a::l1, b::l2, c::l3)
                       end;

zip3([1, 2, 3], [4, 5, 6], [7, 8, 9]);
(* [(1, 4, 7), (2, 5, 8), (3, 6, 9)] *)
unzip3 [(1, 4, 7), (2, 5, 8), (3, 6, 9)];
(* [1, 2, 3], [4, 5, 6], [7, 8, 9] *)

fun nondecreasing xs =
    case xs of
        [] => true
      | _::[] => true
      | head::(neck::rest) => head <= neck andalso nondecreasing (neck::rest);

nondecreasing([1, 9, 3]);

datatype sgn = P
             | N
       | Z;

fun multsign (x1, x2) =
    let fun sign x = if x=0 then Z else if x > 0 then P else N
    in
        case (sign x1, sign x2) of
            (Z, _) => Z
          | (_, Z) => Z
          | (P, P) => P
          | (N, N) => P
          | (N, _) => N
          | (_, N) => N
    end;

fun len xs =
    case xs of
        [] => 0
      | _::xs' => 1 + len xs';

len ([1, 2, 3, 4]);

fun fact n =
    if n=0
    then 1
    else n*fact(n-1);

fact 5;

fun fact2 n =
    let
        fun aux(n, acc) =
            if n=0
            then acc
            else aux(n-1, acc*n)
    in
        aux(n, 1)
    end;

fact2 5;

fun sum_list xs =
    let
        fun aux (xs, acc) =
            case xs of
                [] => acc
              | x::xs' => aux(xs', acc + x)
    in
        aux(xs, 0)
    end;

sum_list([1, 2, 3, 4]);

fun rev xs =
    let
        fun aux(xs, acc) =
            case xs of
                [] => acc
              | x::xs' => aux(xs', x::acc)
    in
        aux(xs, [])
    end;

rev [1, 2, 3];

fun fib n =
    if n <= 0
    then 0
    else if n = 1
    then 1
    else fib(n - 1) + fib(n - 2);

fun fib2 n =
    let
        fun aux (n, prev, current) =
            if n <= 0
            then current
            else aux(n-1, current, current + prev)
    in
        aux(n, 1, 0)
    end;

fib2 44;

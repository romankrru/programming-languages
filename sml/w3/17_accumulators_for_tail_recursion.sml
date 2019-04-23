fun fact n =
    let fun aux (n, acc) =
            if n = 0
            then acc
            else aux(n-1,acc*n)
    in
        aux(n,1)
    end;

fact 12;

fun sum xs =
    case xs of
        [] => 0
      | x::xs' => x + sum xs';

sum [1, 2, 3];

fun sum_rev xs =
    let fun aux (xs, acc) =
            case xs of
                [] => acc
              | x::xs' => aux(xs', x + acc)
    in
        aux(xs, 0)
    end;

sum_rev [2, 3, 9];


[1, 3] @ [5, 2];

fun reverse xs =
    case xs of
        [] => []
      | x::xs' => (rev xs') @ [x];

reverse [1,2,3,4];

fun reverse_rev xs =
    let fun aux(xs, acc) =
            case xs of
                [] => acc
              | x::xs' => aux(xs',x::acc)
    in
        aux(xs,[])
    end;

reverse_rev [1,2,3,4];


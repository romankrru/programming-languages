fun append (xs, ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append(xs', ys);

val ok1 = append(["hi"], ["there"]);
val ok2 = append([1,2],[1,3]);

(* val not_ok = append([1,2], ["hi"]);  *)

(* Equality types *)
(* ''a * ''a -> string *)

fun same_thing(x, y) =
    if x = y then "yes" else "no";

fun pow (x: int, y: int) =
    if y = 0
    then 1
    else x * pow(x, y - 1);

(* fun cube(x: int) = x * x * x  *)

fun cube(x: int) = pow(x, 3);

val s = cube(4);
val f = pow(4, 2 + 2) + cube(5);

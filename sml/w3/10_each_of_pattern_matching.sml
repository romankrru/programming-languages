(* bad style *)
fun sum_triple triple =
    case triple of
        (x, y, z) => x + y + z;

sum_triple((1, 2, 3));

fun full_name r =
    case r of
        {first=x, middle=y, last=z} =>
        x ^ " " ^ y ^ " " ^ z;

full_name({first="First", middle="Middle", last="Last"});

(* better style *)
fun sum_triple1 triple =
    let val (x, y, z) = triple
    in x + y + z end;

sum_triple1 ((1, 2, 3));

fun full_name1 r =
    let val {first=x, middle=y, last=z} = r
    in x ^ " " ^ y ^ " " ^ z end;

full_name1({first="First", middle="Middle", last="Last"});

(* great style *)
fun sum_triple2 (x, y, z) =
    x + y + z;

sum_triple2((1, 2, 3));
sum_triple (1, 2, 3);

fun full_name2 {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z;

full_name1({first="First", middle="Middle", last="Last"});

fun rotate_left (x, y, z) = (y, z, x);

rotate_left(1,2,3);
rotate_left(rotate_left(1,2,3));

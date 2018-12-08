(* Write a function all_except_option, which takes a string and a string list. Return NONE if the
string is not in the list, else return SOME lst where lst is identical to the argument list except the string
is not in it. You may assume the string is in the list at most once. Use same_string, provided to you,
to compare strings. Sample solution is around 8 lines. *)

fun same_string(s1 : string, s2 : string) =
    s1 = s2;

fun all_except_option (x, xs) =
    let
        fun aux ys =
            case ys of
                [] => []
              | y::ys' => if same_string(x, y)
                          then aux(ys')
                          else y::aux(ys')
        val res = aux(xs)
    in
        if xs = res then NONE else SOME res
    end;

val test1 = all_except_option("string", ["string"]) = SOME [];
val tes1a = all_except_option("string", ["string2", "string3"]) = NONE;
val test1b = all_except_option("string", ["string2", "string", "string3"]) = SOME ["string2", "string3"];

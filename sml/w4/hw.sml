(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer;

datatype pattern = Wildcard
		             | Variable of string
		             | UnitP
		             | ConstP of int
		             | TupleP of pattern list
		             | ConstructorP of string * pattern;

datatype valu = Const of int
	            | Unit
	            | Tuple of valu list
	            | Constructor of string * valu;

fun g f1 f2 p =
    let
	      val r = g f1 f2
    in
	      case p of
	          Wildcard          => f1 ()
	        | Variable x        => f2 x
	        | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	        | ConstructorP(_,p) => r p
	        | _                 => 0
    end;

(**** for the challenge problem only ****)

datatype typ = Anything
	           | UnitT
	           | IntT
	           | TupleT of typ list
	           | Datatype of string;

(**** you can put all your code here ****)

(* 1 *)

fun sub_cur i s = String.sub(s, i);
val only_capitals = List.filter (Char.isUpper o sub_cur 0);

val test1 = only_capitals ["A","b","C"] = ["A","C"];
val test1a = only_capitals ["Aaaa", "aa", "Bb", "fF"];

(* 2 *)

val longest_string1 = List.foldl (fn (x, acc) => if String.size x > String.size acc
                                                 then x
                                                 else acc) "";

val test2 = longest_string1 ["A","bc","cc","C"];

(* 3 *)

val longest_string2 = List.foldl (fn (x, acc) => if String.size x >= String.size acc
                                                 then x
                                                 else acc) "";

val test3 = longest_string2 ["A","bc","cc","C"];

(* 4 *)

fun longest_string_helper f =
    List.foldl (fn (x, acc) => if f(String.size x, String.size acc)
                               then x
                               else acc) "";

val longest_string3 = longest_string_helper (fn (size_x, size_acc) => size_x > size_acc);
val longest_string4 = longest_string_helper (fn (size_x, size_acc) => size_x >= size_acc);

val test4a= longest_string3 ["aa","A","bc","C"] = "aa";
val test4b= longest_string4 ["A","B","C"] = "C";

(* 5 *)

val longest_capitalized = longest_string3 o only_capitals;
val test5 = longest_capitalized ["A","bc","C"] = "A";

(* 6 *)

val rev_string = String.implode o List.rev o String.explode;
val test6 = rev_string "abc" = "cba";
val test6a = rev_string "Hello world!";

(* 7 *)

fun first_answer f xs =
    case xs of
        [] => raise NoAnswer
      | x::xs' => case f(x) of
                      NONE => first_answer f xs'
                    | SOME i => i;

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4;

(* 8 *)

fun all_answers f xs =
    let
        fun aux xs acc =
                case xs of
                    [] => SOME acc
                  | x::xs' => case f(x) of
                                  NONE => NONE
                                | SOME i => aux xs' (acc @ i)
    in
        aux xs []
    end;

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7];
val test8a = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7];

(* 9 *)

fun count_wildcards () = 1

val test9a = count_wildcards Wildcard = 1;

(* val test9b = count_wild_and_variable_lengths (Variable("a")) = 1 *)
(* val test9c = count_some_var ("x", Variable("x")) = 1; *)

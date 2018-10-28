true andalso false;

true andalso true;

(*
 `andalso`, `orelse` - keywords
 `not` - function
 *)

not;

val e1 = true;
val e2 = false;

(* e1 andalso e2 *)
if e1
then e2
else false;

(* e1 orelse e2 *)
if e1
then true
else e2;

(* not e1 *)
if e1
then false
else true;

(* dont do this: *)
if e1
then true
else false;

3 > 2;
3.1 > 3.2;
(* 3.1 > 1; type error *)
3.1 > Real.fromInt 1;

(* = cant be used for Real types *)

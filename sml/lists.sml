val l = [];
val l = [3, 4, 5];
val l = [(3+ 5), 2, 2 - 3];
val l = [true, false];

(* can't mix types [false, 23, 44] *)

(* conj *)
val x = [1, 2, 3];
val t = 4::x;
val a = 23::24::x;

(* does not typecheck [5]::x *)

val a = [4]::[[1, 2, 3], [1]];


(* CHECK FOR EMPTY *)

null x;                         (* false *)
null [];                        (* true *)

(* ACCESSING LISTS *)

hd [1, 2, 3];                   (* returns first element *)
tl [1, 3, 4, 5];                (* returns other elements (tail) *)
tl (tl (tl [1, 2, 3, 4, 5, 6]));


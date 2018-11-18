fun hd xs =
    case xs of
        [] => raise List.Empty
      | x::_ => x;

hd [1, 2];

fun tl xs =
    case xs of
        [] => raise List.Empty
      | _::xs' => xs';

tl [1,2,3];

exception MyUndesirableCondition;
exception MyOtherException of int * int;

fun mydiv (x,y) =
    if y=0
    then raise MyUndesirableCondition
    else x div y;

mydiv(2, 4);
(* mydiv(2, 0); *)

fun maxlist (xs,ex) =
    case xs of
        [] => raise ex
      | x::[] => x
      | x::xs' => Int.max(x, maxlist(xs',ex));

val w = maxlist([3,4,5], MyUndesirableCondition);

val x = maxlist([3,4,5], MyUndesirableCondition)
        handle MyUndesariableCondition => 42;

val y = maxlist([], MyUndesirableCondition)
        handle MyUndesariableCondition => 42;


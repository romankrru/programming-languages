fun nondecreasing_1 xs =
    case xs of
        [] => true
      | x::xs' => case xs' of
                      [] => true
                    | y::ys' => x <= y andalso nondecreasing_1 xs';

nondecreasing_1 [1, 2, 3];
nondecreasing_1 [1, 7, 2, 3];

fun nondecreasing xs =
    case xs of
        [] => true
      | _::[] => true
      | head::(neck::rest) => head <= neck andalso nondecreasing rest;

nondecreasing [1, 2, 3];
nondecreasing [1, 7, 2, 3];

datatype sgn = P                (* positive *)
       | N                      (* negative *)
       | Z;                     (* zero *)

fun multsign (x1, x2) =
    let fun sign x = if x=0 then Z else if x>0 then P else N
    in
        case (sign x1, sign x2) of
            (Z,_) => Z
          | (_,Z) => Z
          | (P,P) => P
          | (N,N) => P
          | _ => N
    end;

multsign (1, 2);
multsign (1, ~2);
multsign (0, ~23);

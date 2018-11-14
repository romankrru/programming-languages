exception ListLengthMismatch;

(* bad exmaple *)
fun old_zip3 (l1,l2,l3) =
    if null l1 andalso null l2 andalso null l3
    then []
    else if null l1 orelse null l2 orelse null l3
    then raise ListLengthMismatch
    else (hd l1, hd l2, hd l3) :: old_zip3(tl l1, tl l2, tl l3);

(* bad example *)
fun shallow_zip3 (l1,l2,l3) =
    case l1 of
        [] =>
        (case l2 of
             [] => (case l3 of
                        [] => []
                      | _ => raise ListLengthMismatch )
           | _ => raise ListLengthMismatch)
      | hd1::tl1 =>
        (case l2 of
             [] => raise ListLengthMismatch
           | hd2::tl2 => (case l3 of
                              [] => raise ListLengthMismatch
                            | hd3::tl3 => (hd1, hd2, hd3) :: shallow_zip3(tl1,tl2,tl3)));

(* do this *)
fun zip3 list_trile =
    case list_trile of
        ([],[],[]) => []
      | (hd1::tl1,hd2::tl2,hd3::tl3) => (hd1,hd2,hd3) :: zip3(tl1,tl2,tl3)
      | _ => raise ListLengthMismatch;

fun unzip3 lst =
    case lst of
        [] => ([],[],[])
      | (a,b,c)::tl => let val (l1,l2,l3) = unzip3 tl
                       in
                           (a::l1,b::l2,c::l3)
                       end;

shallow_zip3 ([1,2,3],[4,5,6],[7,8,9]);
old_zip3 ([1,2,3],[4,5,6],[7,8,9]);

zip3 ([1,2,3],[4,5,6],[7,8,9]);
unzip3 [(1,2,3),(4,5,6),(7,8,9)];
unzip3 (zip3 ([1,2,3],[4,5,6],[7,8,9]));

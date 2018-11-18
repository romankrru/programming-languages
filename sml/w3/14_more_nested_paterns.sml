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
      | xs::[] => true
      | head::(neck::rest) => head <= neck andalso nondecreasing rest;

nondecreasing [1, 2, 3];
nondecreasing [1, 7, 2, 3];

fun nondecreasing_1 xs =
    case xs of
        [] => true
      | x::xs' => case xs' of
                      [] => true
                    | y::ys' => x <= y andalso nondecreasing_1 xs';

nondecreasing_1 [1, 2, 3];
nondecreasing_1 [1, 7, 2, 3];

(* In all problems, a “date” is an SML value of type int*int*int,
where the first part is the year, the second part is the month, and
the third part is the day *)

(* year*month*day *)

(* Write a function `is_older` that takes two dates and evaluates
to true or false. It evaluates to true if
the first argument is a date that comes before the second argument.
(If the two dates are the same, the result is false.) *)

fun is_older (d1 : int*int*int, d2 : int*int*int) =
    #1 d1 < #1 d2
    andalso #2 d1 < #2 d2
    andalso #3 d1 < #3 d2;

val test1 = is_older((1,2,3),(2,3,4)) = true;
val test1 = is_older((4,2,3),(2,3,4)) = false;
val test1 = is_older((1,2,3),(1,2,3)) = false;

(* Write a function `number_in_month` that takes a list of dates and
a month (i.e., an int) and returns
how many dates in the list are in the given month *)

fun number_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month);

val test = number_in_month([(2012,2,28),(2013,12,1)],2) = 1;
val test = number_in_month([(2012,2,28),(2013,2,1)],2) = 2;
val test = number_in_month([(2012,2,28),(2013,12,1)],3) = 0;

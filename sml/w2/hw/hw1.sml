(* In all problems, a “date” is an SML value of type int*int*int,
where the first part is the year, the second part is the month, and
the third part is the day *)

(* year*month*day *)

(* 1 *)

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

(* 2 *)

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

(* 3 *)

(* Write a function number_in_months that takes a list of dates
and a list of months (i.e., an int list) and returns the number
of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated.
Hint: Use your answer to the previous problem. *)

fun number_in_months (dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months);

val test = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;
val test = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,1,4]) = 2;
val test = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,12]) = 4;

(* 4 *)


(* Write a function dates_in_month that takes a list of dates and a month
i.e., an int and returns a list holding the dates from the argument
list of dates that are in the month. The returned list should
contain dates in the order they were originally given. *)

fun dates_in_month (dates: (int*int*int) list, month: int) =
    if null dates
    then []
    else if #2 (hd dates) = month
    then (hd dates) :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month);


val test4 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)];
val test4 = dates_in_month([(2012,2,28),(2013,12,1),(1, 2, 3)],2) = [(2012,2,28), (1,2,3)];
val test4 = dates_in_month([(2012,2,28),(2013,12,1)],1) = [];
val test4 = dates_in_month([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)];

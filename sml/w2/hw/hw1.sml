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

(* 5 *)

(* Write a function dates_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns a list holding the dates from the argument list of dates that are in any of the months in
the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the
previous problem and SML’s list-append operator (@). *)

fun dates_in_months (dates: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);

val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];

(* 6 *)

(* Write a function get_nth that takes a list of strings and an int n and returns the n th
element of the list where the head of the list is 1 st . Do not worry about the case
where the list has too few elements: your function may apply hd or tl to the empty list
in this case, which is okay. *)

fun get_nth (xs: string list, n: int) =
    let
        fun helper (xs: string list, c: int) =
            if c=n
            then hd xs
            else helper(tl xs, c+1);
    in
        helper(xs, 1)
    end;

fun get_nth (xs: string list, n: int) =
    if n=1
    then hd xs
    else get_nth(tl xs, n-1);

val test6 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there";
val test6 = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi";
val test6 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you";

(* 7 *)

(* Write a function date_to_string that takes a date and returns a string of the form January 20, 2013
for example. Use the operator ^ for concatenating strings and the library function Int.toString
for converting an int to a string. For producing the month part, do not use a bunch of conditionals.
Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a
comma following the day and use capitalized English month names: January, February, March, April,
May, June, July, August, September, October, November, December. *)

fun date_to_string (date: (int*int*int) list) =
    "2";

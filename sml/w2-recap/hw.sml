val DAY_COUNTS_PER_MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
val DAY_COUNTS_PER_MONTHS_LEAP = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
val MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

fun is_older (d1: int*int*int, d2: int*int*int) =
    let
        val y1 = #1 d1
        val y2 = #1 d2
        val m1 = #2 d1
        val m2 = #2 d2
        val day1 = #3 d1
        val day2 = #3 d2
    in
        if y1 <> y2
        then y1 < y2
        else if m1 <> m2
        then m1 < m2
        else if day1 <> day2
        then day1 < day2
        else false
    end;

val t1 = is_older((1,2,3),(2,3,4));
val t2 = is_older((1, 1, 3), (1, 2, 3));
val t3 = is_older((1, 4, 3), (1, 2, 3));
val t41 = is_older((2011, 4, 28), (2011, 3, 31));
val t42 = is_older((2011, 3, 31), (2012, 2, 28));

fun number_in_month (ds: (int*int*int) list, month: int) =
    if null ds
    then 0
    else
        if #2 (hd ds) = month
        then 1 + number_in_month(tl ds, month)
        else number_in_month(tl ds, month);

val t4 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1;
val t5 = number_in_month([(2012,2,28),(2013,2,1)],2);

fun number_in_months (ds: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(ds, hd months) + number_in_months(ds, tl months);

val t6 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;

fun contains (xs: int list, x) =
    if null xs
    then false
    else if hd xs = x
    then true
    else contains(tl xs, x);

fun remove_duplicates (xs: int list) =
    if null xs
    then []
    else if contains(tl xs, hd xs)
    then remove_duplicates(tl xs)
    else hd xs::remove_duplicates(tl xs);

remove_duplicates [1, 2, 3, 4, 1, 5, 2, 5, 1, 2, 6];

fun number_in_months_challenge (ds: (int*int*int) list, months: int list) =
    number_in_months(ds, remove_duplicates months);

fun dates_in_month(ds: (int*int*int) list, month: int) =
    if null ds
    then []
    else if #2 (hd ds) = month
    then (hd ds)::dates_in_month(tl ds, month)
    else dates_in_month(tl ds, month);

val t7 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)];
val t8 = dates_in_month([(2012,2,28),(2013,2,1)],2);

fun dates_in_months (ds: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(ds, hd months) @ dates_in_months(ds, tl months);

val t9 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];

fun dates_in_months_challenge (ds: (int*int*int) list, months: int list) =
    dates_in_months(ds, remove_duplicates months);

fun get_nth(xs: string list, n: int) =
    if n = 1
    then hd xs
    else get_nth(tl xs, n - 1);

fun get_nth_int(xs: int list, n: int) =
    if n = 1
    then hd xs
    else get_nth_int(tl xs, n - 1);

val t10 = get_nth(["hi", "there", "how", "are", "you"], 2);

fun date_to_string (date: int*int*int) =
    get_nth(MONTHS, #2 date)
    ^ " "
    ^ Int.toString(#3 date)
    ^ ", "
    ^ Int.toString(#1 date);

val t11 = date_to_string((2013, 6, 1)) = "June 1, 2013";

fun number_before_reaching_sum (sum: int, xs: int list) =
    if sum - hd xs <= 0
    then 1
    else 1 + number_before_reaching_sum(sum - hd xs, tl xs);

val t12 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3;

fun what_month (day: int) =
    get_nth(MONTHS, number_before_reaching_sum(day, DAY_COUNTS_PER_MONTHS));

val t13 = what_month(1);

fun month_range (start_day: int, end_day: int) =
    if start_day > end_day
    then []
    else number_before_reaching_sum(start_day, DAY_COUNTS_PER_MONTHS) :: month_range(start_day + 1, end_day);

val t14 = month_range(31, 34);

fun oldest (ds: (int*int*int) list) =
    if null ds
    then NONE
    else
        let
            val tl_ans = oldest(tl ds)
        in
            if isSome tl_ans andalso is_older(valOf tl_ans, hd ds)
            then tl_ans
            else SOME(hd ds)
        end;

val t15 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31);
val t16 = oldest([(2010,2,28),(2011,3,31),(2011,4,28)]);
val t17 = oldest([]);
val t18 = oldest([(2018,2,28),(2011,9,31),(2011,4,28)]);

fun reasonable_date (date: int*int*int) =
    let
        val year = #1 date
        val month = #2 date
        val day = #3 date

        fun is_leap_year () =
            (year mod 400) = 0 orelse
            (((year mod 4) = 0) andalso ((year mod 100) <> 0))

        fun get_max_day_in_month () =
            if is_leap_year()
            then get_nth_int(DAY_COUNTS_PER_MONTHS_LEAP, month)
            else get_nth_int(DAY_COUNTS_PER_MONTHS, month)
    in
        year > 0 andalso
        month > 0 andalso month < 13 andalso
        day > 0 andalso day <= get_max_day_in_month()
    end;

val t19 = reasonable_date(1, 2, 3);
val t20 = reasonable_date(1, 14, 3);
val t21 = reasonable_date(2019, 5, 31);

fun is_same_string (s1: string, s2: string) =
    s1 = s2;

fun all_except_option (s, xs) =
    let
        fun aux ys =
            case ys of
                [] => []
              | y::ys' => if is_same_string(s, y)
                          then aux(ys')
                          else y::aux(ys')

        val result = aux(xs)
    in
        if result=xs
        then NONE
        else SOME result
    end;

val test1 = all_except_option("string", ["string"]) = SOME [];
val tes1a = all_except_option("string", ["string2", "string3"]) = NONE;
val test1b = all_except_option("string", ["string2", "string", "string3"]) = SOME ["string2", "string3"];

fun get_substitutions1 (substitutions, s) =
    case substitutions of
        [] => []
      | x::xs' => case all_except_option(s, x) of
                      NONE => get_substitutions1(xs', s)
                    | SOME i => i@get_substitutions1(xs', s);

val test2 = get_substitutions1([["foo"],["there"]], "foo") = [];
val test2a = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"];
val test2b = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"];

fun get_substitutions2 (xs, s) =
    let
        fun aux (xs, acc) =
            case xs of
                [] => acc
              | x::xs' => case all_except_option(s, x) of
                              NONE => aux(xs', acc)
                            | SOME i => aux(xs', acc @ i)
    in
        aux(xs, [])
    end;

val test3 = get_substitutions2([["foo"],["there"]], "foo") = [];
val test3a = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"];
val test3b = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") = ["Jeffrey","Geoff","Jeffrey"];

fun similar_names (xs, name) =
    let
        val {first, middle, last} = name

        fun aux firsts =
            case firsts of
                [] => []
              | new_first::firsts' => {
                  first=new_first,
                  last=last,
                  middle=middle
              } :: aux(firsts')
    in
        name::aux(get_substitutions2(xs, first))
    end;

val test4 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	          [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	           {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}];

datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype rank = Jack | Queen | King | Ace | Num of int;
type card = suit * rank;

datatype color = Red | Black;
datatype move = Discard of card | Draw;

exception IllegalMove;

fun card_color (c: card) =
    case c of
        (Diamonds, _) => Red
      | (Hearts, _) => Red
      | _ => Black;

val test5 = card_color((Clubs, Num 2)) = Black;
val test5a = card_color((Hearts, Queen)) = Red;

fun card_value (c: card) =
    case c of
        (_, Ace) => 11
      | (_, Num i) => i
      | _ => 10;

val test6 = card_value((Clubs, Num 2));
val test6a = card_value((Hearts, Queen));
val test6b = card_value((Hearts, Ace));
val test6c = card_value((Hearts, Num 9));

fun remove_card (cs: card list, c: card, e: exn) =
    case cs of
        [] => raise IllegalMove
      | x::xs' => if x = c then xs' else x::remove_card(xs', c, e);

val test7 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [];
val test7a = remove_card([(Hearts, Ace)], (Hearts, Queen), IllegalMove)
            handle IllegalMove => [(Spades, Queen)];

fun all_same_color (cs: card list) =
    case cs of
        [] => true
      | _::[] => true
      | head::(neck::rest) =>
        card_color(head) = card_color(neck)
        andalso all_same_color(rest);

val test8 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true;

fun sum_cards (cs: card list) =
    let
        fun aux (cs: card list, acc: int) =
            case cs of
                [] => acc
              | c::cs' => aux(cs', card_value (c) + acc)
    in
        aux(cs, 0)
    end;

val test9 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4;
val test9a = sum_cards([(Hearts, Num 2),(Clubs, Num 4)]) = 6;

fun score (cs: card list, goal: int) =
    let
        val sum = sum_cards(cs)
        val preliminary_score = if sum > goal
                                then 3 * (sum - goal)
                                else goal - sum
    in
        if all_same_color(cs)
        then preliminary_score div 2
        else preliminary_score
    end;

val test10 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4;
val test10b = score([(Hearts, Num 2), (Diamonds, Num 4)], 10) = 2;

fun officiate (card_list: card list, move_list: move list, goal: int) =
    let
        fun move (card_list, move_list, held_cards) =
            case (card_list, move_list) of
                (_, []) => score(held_cards, goal)
              | ([], Draw::_) => score(held_cards, goal)

              | (card::card_list', Draw::move_list') =>
                let val new_held_cards = card :: held_cards
                in
                    if sum_cards(new_held_cards) > goal
                    then score(new_held_cards, goal)
                    else move(card_list,
                              move_list',
                              new_held_cards)
                end

              | (_, (Discard card)::move_list') =>
                move(card_list,
                     move_list',
                     remove_card(held_cards, card, IllegalMove))
    in
        move(card_list, move_list, [])
    end;

val test11 = officiate [(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6;

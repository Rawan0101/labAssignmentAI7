% 9FS2 Rawan Alqattan

:- dynamic basket/1.

basket([coffee, milk, chocolate, apple, juice]).

start :-
    menu.

menu :-
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(Choice),
    action(Choice).

action(d) :-
    basket(L),
    display_items(L),
    menu.
action(a) :-
    write('enter the item you want to add it'), nl,
    read(Item),
    retract(basket(L)),
    append(L, [Item], NewL),
    assert(basket(NewL)),
    write('The item has been added'), nl,
    menu.
action(e).

display_items([]).
display_items([H|T]) :-
    write(H), nl,
    display_items(T).

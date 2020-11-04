% Consulting Files / Modules
:- use_module(library(random)).
:- [display, board_examples].


write_player(0) :- write('Player 1 (White)').
write_player(1) :- write('Player 2 (Black)').

% Determining at random what player gets to have the first turn
random_player_number(Player) :-
    random(0, 2, Player).

% Board Visualization Predicate
display_game(GameState, Player) :-
    write_board(GameState), nl,
    write_player(Player), write(' has the first move!'), nl, nl.

% Main Predicate
play :-
    random_player_number(Player),
    initial(GameState),
    display_game(GameState, Player).

% HOW TO "TEST"
% - Consult myTaiji.pl
% - play.





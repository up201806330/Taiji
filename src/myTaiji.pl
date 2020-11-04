% Consulting Files / Modules
:- use_module(library(random)).
:- [display, board_examples, menus].

write_white(0) :- write('The Player (White)').
write_white(1) :- write('The Computer (White)').
write_black(0) :- write('The Player (Black)').
write_black(1) :- write('The Computer (Black)').

% Determining at random whether the player or the computer get to be white (0 is player, 1 is computer)
random_white_number(White) :-
    random(0, 2, White).

% Board Visualization Predicate
display_game(GameState, White) :-
    write_board(GameState), nl,
    write_white(White), write(' has the first move!'), nl, nl.

% Main Predicate
play :-
    taiji_ascii, nl, nl,
    board_size_menu, nl.
    % random_white_number(White),
    % initial(GameState),
    % display_game(GameState, White).

% HOW TO "TEST"
% - Consult myTaiji.pl
% - play.


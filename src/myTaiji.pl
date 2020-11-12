% Consulting Files / Modules
:- use_module(library(random)).
:- [logic, menus, display, board_examples, utils].

write_white(0) :- write('The Player (White)').
write_white(1) :- write('The Computer (White)').
write_black(0) :- write('The Player (Black)').
write_black(1) :- write('The Computer (Black)').

% Determining at random whether the player or the computer get to be white (0 is player, 1 is computer)
random_white_number(White) :-
    random(0, 2, White).

% Board Visualization Predicate
display_game(GameState, Player, ColorPlayer) :-
    write_board(GameState), nl,

    ( ColorPlayer = 0
    -> write_white(Player), nl
    ; write_black(Player), nl
    ).
    % write_white(Player), write(' has the first move!'), nl, nl.

% Main Predicate
play :-
    taiji_ascii, nl, nl,
    board_size_menu(GameState), nl,
    mode_pvp_ai_menu(GameState).
    % , nl, 
    % random_white_number(White),
    % turn(GameState, White).
    

% HOW TO "TEST"
% - Consult myTaiji.pl
% - play.


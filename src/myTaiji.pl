% Consulting Files / Modules
:- use_module(library(random)).
:- use_module(library(lists)).
:- [logic, menus, display, board_examples, utils].

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


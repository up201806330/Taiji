% consults files
:- use_module(library(random)).
:- [display, board_examples].


% display_game(GameState, Player):

% play :-
%     initial(GameState),
%     write_board(GameState),
%     start(GameState).

% main predicate
play :-
    initial(GameState),
    write_board(GameState).

% HOW TO "TEST"
% - Consult myTaiji.pl
% - play.



random_player(Number) :-
    random(0, 2, Number),
    write(Number).




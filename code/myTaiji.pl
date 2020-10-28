% translation(clear, CHAR) :- CHAR = '.'.
% translation(white, CHAR) :- CHAR = 'w'.
% translation(black, CHAR) :- CHAR = 'b'.
% ------------------ File On Progress ------------------

% consults files
:- [display, board_examples].

% display_game(GameState, Player):

% play :-
%     initial(GameState),
%     write_board(GameState),
%     start(GameState).

% main predicate
play :-
    % initial_board(InitialBoard),
    % write_board(InitialBoard).
    initial(GameState),
    write_board(GameState).

% HOW TO "TEST"
% - Consult myTaiji.pl
% - play.
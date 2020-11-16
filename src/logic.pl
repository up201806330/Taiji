
% Checks if board is full and game is over.
% check_ full_ board(Board):-().



% Checks if both positions to be occupied by a piece fit on the board. If either position fails, informs the user and asks for new input.
% check_move(Board, X1, Y1, X2, Y2):-().



% Counts up score of both colors, called when game is over
% count_score(Board, WhiteScore, BlackScore):-().




turn(GameState, Player, Color) :-
    nl,
    % valid_moves(GameState, Player, ListOfMoves).
    game_over(GameState, Winner),
    nl, nl, write(' TURN '), nl, nl,
    display_game(GameState, Player, Color),
    play_piece(GameState),
    enter_to_continue,
    alternate_value(Player, NewPlayer),
    alternate_value(Color, NewColor),
    nl, horizontal_line,
    turn(GameState, NewPlayer, NewColor).


alternate_value(Value, NewValue) :-
    NewValue is (Value + 1) mod 2.

play_piece(GameState) :-
    write('Played Piece'), nl.

game_over(GameState, Winner) :-
    write('Not Full'), nl.

% Player vs Player Mode
player_vs_player(GameState) :-
    random_white_number(White),
    turn(GameState, White, 0).


valid_moves(GameState, Player, ListOfMoves) :-
    iterate_matrix(GameState).

iterate_matrix([]).

iterate_matrix([H|T]) :-
    iterate_row(H), nl,
    iterate_matrix(T).

iterate_row([]).
iterate_row([H|T]) :-
    write('Element of row: '), write(H), nl,
    iterate_row(T).
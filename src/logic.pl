
% Checks if board is full and game is over.
% check_ full_ board(Board):-().



% Checks if both positions to be occupied by a piece fit on the board. If either position fails, informs the user and asks for new input.
% check_move(Board, X1, Y1, X2, Y2):-().



% Counts up score of both colors, called when game is over
% count_score(Board, WhiteScore, BlackScore):-().


% Player vs Player Mode
player_vs_player(GameState) :-
    random_white_number(White),
    turn(GameState, White, 0).


alternate_value(Value, NewValue) :-
    NewValue is (Value + 1) mod 2.

game_over(GameState, Winner) :-
    write('Not Full'), nl.


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


play_piece(GameState) :-
    get_input_piece(Row, Col),
    % validate_row(GameState, Row),
    validate_col(GameState, Col),
    write('Played Piece'), nl.

validate_col(GameState, Col) :-
    write('Validate Row'), nl,
    % atom_number(Col, Col_N),
    % write("Number ~d", Col_N).

    % length(GameState, NumCols),
    Col @> 0,
    % write('hi'), nl,
    % Col_ > (NumCols-1),
    format("Col: ~p\n", Col).


get_input_piece(InputRow, InputCol) :-
    write('White Piece Row: '), get_char(InputRow), get_char(_), nl,
    write('White Piece Col: '), get_char(InputCol), get_char(_), nl,
    nl,
    format("User Row: ~p | User Col: ~p", [InputRow, InputCol]), nl.
    %write(InputRow), write(' '), write(InputCol), nl.





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
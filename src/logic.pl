
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
    play_piece(GameState, NewGameState),
    % play_piece(NewGameState, NewGameState1, black),
    enter_to_continue,
    alternate_value(Player, NewPlayer),
    alternate_value(Color, NewColor),
    nl, horizontal_line,
    turn(NewGameState, NewPlayer, NewColor).


play_piece(GameState, NewGameState1) :-
    get_input_piece(InputRow, InputCol),
    convert_input_row(InputRow, Row),
    % convert_input_col(InputCol, Col),
    Row @> 0, Row @< 12,
    InputCol @> 0, InputCol @< 12,
    write('\npassed\n'),

    get_black_piece(Row, InputCol, BlackRow, BlackCol),
    format("Black Row: ~p | Black Col: ~p", [BlackRow, BlackCol]), nl,

    replace_(GameState, Row, InputCol, white, NewGameState),
    replace_(NewGameState, BlackRow, BlackCol, black, NewGameState1),

    % get_black_piece(Row, InputCol, NewRow, NewCol),
    % access(GameState, Row, InputCol, white, NewGameState),
    % replace_(GameState, Row, InputCol, white, NewGameState), <------------

    % write('hi\n'),
    % get_second_piece(Row, Col),
    % write('\npre black'),
    % replace_(NewGameState, 3, 4, black, NewGameState1),
    write('Played Piece'), nl.


get_black_piece(Row, Col, NewRow, NewCol) :-
    show_options, nl,
    read(Option),
    new_move(Row, Col, NewRow, NewCol, Option).

show_options :-
    write('    (1)                    (2)      '), nl,
    % write('     |                      |       '), nl,
    % write('     v                      v       '), nl,
    write('  [white, black]  [black, white]    '), nl, nl,
    write('    (3)                    (4)      '), nl,
    % write('     |                      |       '), nl,
    % write('     v                      v       '), nl,
    write('  [white,                [black,    '), nl,
    write('   black]                 white]    '), nl.

% black on the right
new_move(Row, Col, Row, NewCol, 1) :-
    write('\nBlack on Right\n'),
    NewCol is Col + 1.

% black on the left
new_move(Row, Col, Row, NewCol, 2) :-
    write('\nBlack on Left\n'),
    NewCol is Col - 1.

% black on the bottom
new_move(Row, Col, NewRow, Col, 3) :-
    write('\nBlack on Bottom\n'),
    NewRow is Row + 1.

% black on the top
new_move(Row, Col, NewRow, Col, 4) :-
    write('\nBlack on Top\n'),
    NewRow is Row - 1.


% get_black_piece(Row, Col, NewRow, NewCol) :-
%     ask_options,
%     read(),
%     check_option

% get_second_piece(Row, Col) :-
%     RowU is Row - 1.


% ----------------------------------------------------------------
replace_( [L|Ls] , 0 , Y , Z , [R|Ls] ) :- % once we find the desired row,
  replace_column(L,Y,Z,R)                 % - we replace specified column, and we're done.
  .                                       %
replace_( [L|Ls] , X , Y , Z , [L|Rs] ) :- % if we haven't found the desired row yet
  X > 0 ,                                 % - and the row offset is positive,
  X1 is X-1 ,                             % - we decrement the row offset
  replace_( Ls , X1 , Y , Z , Rs )         % - and recurse down
  .                                       %

replace_column( [COld|Cs] , 0 , Z , [Z|Cs] ) :-
    compare(=, COld, 'clear')               % <--- checks if clear
    .                                       % once we find the specified offset, just make the substitution and finish up.
replace_column( [C|Cs] , Y , Z , [C|Rs] ) :- % otherwise,
  Y > 0 ,                                    % - assuming that the column offset is positive,
  Y1 is Y-1 ,                                % - we decrement it
  replace_column( Cs , Y1 , Z , Rs )         % - and recurse down.
  .
% ----------------------------------------------------------------


access( [L|Ls] , 0 , Y , Z , [R|Ls] ) :- % once we find the desired row,
  access_column(L,Y,Z,R)                 % - we replace specified column, and we're done.
  .                                       %
access( [L|Ls] , X , Y , Z , [L|Rs] ) :- % if we haven't found the desired row yet
  X > 0 ,                                 % - and the row offset is positive,
  X1 is X-1 ,                             % - we decrement the row offset
  access( Ls , X1 , Y , Z , Rs )         % - and recurse down
  .                                       %

access_column( [COld|Cs] , 0 , Z , [COld|Cs] ) :-
    write('\nPiece: '),
    write(COld), nl               % <--- checks if clear
    .                                       % once we find the specified offset, just make the substitution and finish up.
access_column( [C|Cs] , Y , Z , [C|Rs] ) :- % otherwise,
  Y > 0 ,                                    % - assuming that the column offset is positive,
  Y1 is Y-1 ,                                % - we decrement it
  access_column( Cs , Y1 , Z , Rs )         % - and recurse down.
  .




get_input_piece(InputRow, InputCol) :-
    write('White Piece Row: '), get_char(InputRow), get_char(_), nl,
    % write('White Piece Col: '), get_char(InputCol), get_char(_), nl,
    write('White Piece Col: '), read(InputCol), get_char(_), nl,
    write(InputCol),
    nl,
    format("User Row: ~p | User Col: ~p", [InputRow, InputCol]), nl.



% ----------------------------------------------------------------
convert_input_row('A', 1).
convert_input_row('B', 2).
convert_input_row('C', 3).
convert_input_row('D', 4).
convert_input_row('E', 5).
convert_input_row('F', 6).
convert_input_row('G', 7).
convert_input_row('H', 8).
convert_input_row('I', 9).
convert_input_row('J', 10).
convert_input_row('K', 11).

convert_input_col('1', 1).
convert_input_col('2', 2).
convert_input_col('3', 3).
convert_input_col('4', 4).
convert_input_col('5', 5).
convert_input_col('6', 6).
convert_input_col('7', 7).
convert_input_col('8', 8).
convert_input_col('9', 9).
convert_input_col('10', 10).
convert_input_col('11', 11).
% ----------------------------------------------------------------
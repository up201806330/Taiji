/*
% Custom write for each of the possibilities:

% Game Symbols
write_char(clear) :- write('  ').
write_char(white) :- write('w ').
write_char(black) :- write('b ').

% Top Number Row (Numbers correspond to the correspondent ASCII decimal value)
write_char(48) :- write('0 ').
write_char(49) :- write('1 ').
write_char(50) :- write('2 ').
write_char(51) :- write('3 ').
write_char(52) :- write('4 ').
write_char(53) :- write('5 ').
write_char(54) :- write('6 ').
write_char(55) :- write('7 ').
write_char(56) :- write('8 ').
write_char(57) :- write('9 ').
write_char(58) :- write('10').

% Left Side Letter Column (Numbers correspond to the correspondent ASCII decimal value)
write_char(65) :- write('A ').
write_char(66) :- write('B ').
write_char(67) :- write('C ').
write_char(68) :- write('D ').
write_char(69) :- write('E ').
write_char(70) :- write('F ').
write_char(71) :- write('G ').
write_char(72) :- write('H ').
write_char(73) :- write('I ').
write_char(74) :- write('J ').
write_char(75) :- write('K ').

initial_board([
[clear,   48,   49,   50],
[   65,clear,clear,clear],
[   66,clear,clear,clear],
[   67,clear,clear,clear]
]).


% base case of a line of the board
write_line([]).

% writes each character of the list (line)
write_line([Head|Tail]) :-
    write_char(Head),
    write('| '),
    write_line(Tail).

% base case of the board
write_board([]).

% writes each line of the board by calling the write_line function multiple times
write_board([Head|Tail]) :-
    write('| '),
    write_line(Head), nl,
    write_board(Tail).



% replaceInList([_H|T], 1, Value, [Value|T]).
% replaceInList([H|T], Index, Value, [H|TNew]) :-
%     Index > 1,
%     Index1 is Index - 1,
%     replaceInList(T, Index1, Value, TNew).

% replaceInMatrix([H|T], 1, Column,Value, [HNew|T]) :-
%     replaceInList(H, Column, Value, HNew).

% replaceInMatrix([H|T], Row, Column, Value, [H|TNew]) :-
%     Row > 1,
%     Row1 is Row - 1,
%     replaceInMatrix(T, Row1, Column, Value, TNew).




% replace( [L|Ls] , 0 , Y , Z , [R|Ls] ) :- % once we find the desired row,
%   replace_column(L,Y,Z,R)                 % - we replace specified column, and we're done.
%   .                                       %
% replace( [L|Ls] , X , Y , Z , [L|Rs] ) :- % if we haven't found the desired row yet
%   X > 0 ,                                 % - and the row offset is positive,
%   X1 is X-1 ,                             % - we decrement the row offset
%   replace( Ls , X1 , Y , Z , Rs )         % - and recurse down
%   .                                       %

% replace_column( [_|Cs] , 0 , Z , [Z|Cs] ) .  % once we find the specified offset, just make the substitution and finish up.
% replace_column( [C|Cs] , Y , Z , [C|Rs] ) :- % otherwise,
%   Y > 0 ,                                    % - assuming that the column offset is positive,
%   Y1 is Y-1 ,                                % - we decrement it
%   replace_column( Cs , Y1 , Z , Rs )         % - and recurse down.
%   .                                          %


get_input_piece(InputRow, InputCol) :-
    write('White Piece Row: '), get_char(InputRow), get_char(_), nl,
    write('White Piece Col: '), get_char(InputCol), get_char(_), nl,
    nl,
    format("User Row: ~p | User Col: ~p", [InputRow, InputCol]), nl.



convert_input_row('A', 1).
convert_input_row('B', 2).
convert_input_row('C', 3).
convert_input_col('0', 1).
convert_input_col('1', 2).
convert_input_col('2', 3).


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


% black on the right
black_move_part(Row, Col, Row, NewCol, 1) :-
    write('\nBlack on Right\n'),
    NewCol is Col + 1.

% black on the left
black_move_part(Row, Col, Row, NewCol, 2) :-
    write('\nBlack on Left\n'),
    NewCol is Col - 1.

% black on the bottom
black_move_part(Row, Col, NewRow, Col, 3) :-
    write('\nBlack on Bottom\n'),
    NewRow is Row + 1.

% black on the top
black_move_part(Row, Col, NewRow, Col, 4) :-
    write('\nBlack on Top\n'),
    NewRow is Row - 1.


play_piece(GameState, Row, InputCol, Option, NewGameState1) :-
    write(GameState), nl,
    % get_input_piece(InputRow, InputCol),
    % convert_input_row(InputRow, Row),

    % Row @> 0, Row @< 12,
    % InputCol @> 0, InputCol @< 12,

    % get_black_piece(Row, InputCol, Option, BlackRow, BlackCol),
    black_move_part(Row, InputCol, Row, NewCol, 1),

    replace_(GameState, Row, InputCol, white, NewGameState),
    replace_(NewGameState, BlackRow, BlackCol, black, NewGameState1).

play :-
  initial_board(GameState),
  findall([Row, Col], play_piece(GameState, Row, Col, 1, NewGameState1), Solucoes).

% play :- 
%   initial_board(GameState),
%   maplist(change_array, GameState, NewGameState).
%   % write(NewGameState).

% change_array(Array, New_Array) :-
%   maplist(change_list,List,New_list).

% change_list(List, New_List) :-
%   maplist(change_item, List, New_List).




    % % initial_board(GameState),

    % replaceInMatrix(GameState, 3, 2, B, NewGameState),

    % replace([[1,2,3],[4,5,6],[7,8,9]], 2, 1, 0, NewGameState),  <-- this works

    % % replace(GameState, 2, 1, black, NewGameState),

    % % write_board(NewGameState).
    
    % initial_board(GameState),
    % get_input_piece(InputRow, InputCol),
    % convert_input_row(InputRow, NewRow),
    % convert_input_col(InputCol, NewCol),
    % replace(GameState, NewRow, NewCol, white, NewGameState),
    % write_board(NewGameState).


% increment_item(Item,New_item) :-
    
%     (
%       compare(=, Item, 'clear') -> write(' '), write(New_item), nl, New_item = Item
%       ;
%       New_item is Item + 1, nl
%     ), write('End of stuff').

% increment_list(List,New_list) :-
%     maplist(increment_item,List,New_list).

% increment_array(Array,New_array) :-
%     maplist(increment_list,Array,New_array).


% m :-
%   initial_board(GameState),
%   increment_array(GameState, NewGameState), nl,
%   write_board(NewGameState).

*/

:- use_module(library(lists)).

% Game Symbols
write_char(clear) :- write('  ').
write_char(white) :- write('w ').
write_char(black) :- write('b ').

% Top Number Row (Numbers correspond to the correspondent ASCII decimal value)
write_char(48) :- write('0 ').
write_char(49) :- write('1 ').
write_char(50) :- write('2 ').
write_char(51) :- write('3 ').
write_char(52) :- write('4 ').
write_char(53) :- write('5 ').
write_char(54) :- write('6 ').
write_char(55) :- write('7 ').
write_char(56) :- write('8 ').
write_char(57) :- write('9 ').
write_char(58) :- write('10').

% Left Side Letter Column (Numbers correspond to the correspondent ASCII decimal value)
write_char(65) :- write('A ').
write_char(66) :- write('B ').
write_char(67) :- write('C ').
write_char(68) :- write('D ').
write_char(69) :- write('E ').
write_char(70) :- write('F ').
write_char(71) :- write('G ').
write_char(72) :- write('H ').
write_char(73) :- write('I ').
write_char(74) :- write('J ').
write_char(75) :- write('K ').

% base case of a line of the board
write_line([]).

% writes each character of the list (line)
write_line([Head|Tail]) :-
    write_char(Head),
    write('| '),
    write_line(Tail).

% base case of the board
write_board([]).

% writes each line of the board by calling the write_line function multiple times
write_board([Head|Tail]) :-
    write('| '),
    write_line(Head), nl,
    write_board(Tail).

board([
[clear,b,clear],
[clear,clear,a],
[c,clear,clear]
]).

initial_board([
[clear,   48,   49,   50],
[   65,clear,clear,clear],
[   66,clear,clear,clear],
[   67,clear,clear,clear]
]).


s :-
  initial_board(GameState),
  valid_moves(GameState, Player, ListOfMoves).

% ANTONIO ----------------
valid_moves(GameState, Player, ListOfMoves) :-
    write_board(GameState), nl, nl,
    nth0(0, GameState, Row),
    length(Row, NumCols),
    length(GameState,NumRows),
    iterateMatrix(GameState, NumRows, NumCols, Player, ListOfMoves), nl, nl, nl, nl,
    write(ListOfMoves).

% Function that iterates over a Matrix and returns the list of Moves
iterateMatrix(GameState, NumRows, NumCols, Player, PieceAndMoves):-
  iterateMatrix(GameState,GameState, 0, NumRows, 0, NumCols, Player,[],PieceAndMoves).

iterateMatrix(_, [], NumRows, NumRows, 0, _, _,PieceAndMoves,PieceAndMoves).
iterateMatrix(GameState, [R|Rs], NumRow, NumRows, 0, NumCols,Player,IntermedPiece,PieceAndMoves) :-
  findPiece(GameState, R, NumRow, 0, NumRows, NumCols, Player,FoundMovesPieces),
  write(FoundMovesPieces), nl,
  append(IntermedPiece, FoundMovesPieces, NewPieceList),
  X is NumRow+1,
  iterateMatrix(GameState, Rs, X, NumRows, 0, NumCols, Player,NewPieceList,PieceAndMoves).

% Finds a Piece of a Player
findPiece(GameState, List, NumRow, NumCol, NumRows, NumCols, Player,FoundMovesPieces):-
  findPiece(GameState, List, NumRow, NumCol, NumRows, NumCols, Player,[],FoundMovesPieces).

findPiece(_, [], _, NumCols, NumRows, NumCols,_,FoundMovesPieces,FoundMovesPieces).
findPiece(GameState, [Head|Tail], NumRow, NumCol, NumRows, NumCols,Player,ValidPieceAndMove,FoundMovesPieces):-
  nl,
  (
    compare(=, Head, 'clear'),
    format("Row: ~p | Col: ~p | Head: ~p ", [NumRow, NumCol, Head]),
    checkNeighbours(GameState, NumRow, NumCol, NumRows, NumCols, CellPiecesAndMoves),
    nl, write('HI: '), write(CellPiecesAndMoves), nl, % <--- check for length 2
    append(ValidPieceAndMove, [CellPiecesAndMoves], NewPieceList),
    X is NumCol+1,
    findPiece(GameState, Tail, NumRow, X, NumRows, NumCols,Player,NewPieceList,FoundMovesPieces)
  ) ;
  (
    format("Row: ~p | Col: ~p | Head: ~p ", [NumRow, NumCol, Head]),
    write(' not clear'),
    X is NumCol+1,
    findPiece(GameState, Tail, NumRow, X, NumRows, NumCols,Player,ValidPieceAndMove,FoundMovesPieces)
  ).

% Checks for a non empty Cell nearby of a Piece
checkNeighbours(GameState,NumRow,NumCol, NumRows, NumCols,CellPiecesAndMoves) :-
  checkDown(GameState,NumRow,NumCol, NumRows, MoveDown,NumRow,NumCol), % Down
  % checkUp(GameState,NumRow,NumCol, MoveUp,NumRow,NumCol), % Up
  % checkRight(GameState,NumRow,NumCol, NumCols, MoveRight,NumRow,NumCol), % Right
  % checkLeft(GameState,NumRow,NumCol, MoveLeft,NumRow,NumCol), % Left

  append([], MoveDown, CellMoves),
  % append([], MoveDown, L),
  % append(L, MoveUp, L1),
  % append(L1, MoveRight, L2),
  % append(L2, MoveLeft, CellMoves),
  append([[NumCol,NumRow]], CellMoves, CellPiecesAndMoves).


% Checks Cells under the selected piece
% Doesn't check if the selected Piece is at the bottom Row
checkDown(GameState,NumRow,NumCol, NumRows, MoveDown, InitialRow, InitialCol):-
  NumRow \= NumRows - 1,
  NR is NumRow+1,
  nth0(NR, GameState, BoardRow),
  nth0(NumCol, BoardRow, Content),
  % Content=[Head|_],
  % format("NR: ~p | BoardRow: ~p | Content: ~p", [NR, BoardRow, Content]), nl

  (
    (
      % Content \= clear,
      compare(=, Content, 'clear'), write(' was clear? '),
      (
        write(' move '), 
        Move = [[NumCol, NR]],
        append([], Move, MoveDown)
      )
    );
    checkDown(GameState,NR,NumCol, NumRows, MoveDown, InitialRow, InitialCol)
  )
  .

checkDown(_,_,_,_, [], _, _).


testing :-
  initial_board(GameState),
  % write_board(GameState),
  move(GameState, [[2, 1], [3, 1]], NewGameState),
  write('before\n'),
  write_board(NewGameState).


move(GameState, [White|[Black|_]], NewGameState) :- 
  white_piece_move(GameState, White, NewGameState1), 
  black_piece_move(NewGameState1, Black, NewGameState).

white_piece_move(GameState, [Row | [Col|_]], NewGameState1) :-
  replace_(GameState, Row, Col, white, NewGameState1).

black_piece_move(NewGameState1, [Row | [Col|_]], NewGameState) :-
  replace_(NewGameState1, Row, Col, black, NewGameState).


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

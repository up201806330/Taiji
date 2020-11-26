
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
    
    get_input_piece(InputRow, InputCol),
    convert_input_row(InputRow, Row),

    Row @> 0, Row @< 12,
    InputCol @> 0, InputCol @< 12,

    show_options, nl,
    read(Option),
    
    % play_piece(GameState, NewGameState),
    (
        play_piece(GameState, Row, InputCol, Option, NewGameState) -> success_play(Player, NewPlayer, Color, NewColor, NewGameState)
            % enter_to_continue,
            % alternate_value(Player, NewPlayer),
            % alternate_value(Color, NewColor),
            % nl, horizontal_line,
            % turn(NewGameState, NewPlayer, NewColor)
            ;
            nl, write('Invalid Option'), nl,                % "Else statement"
            enter_to_continue, nl,
            clear_terminal, turn(GameState, Player, Color)
    )
    .

    % enter_to_continue,
    % alternate_value(Player, NewPlayer),
    % alternate_value(Color, NewColor),
    % nl, horizontal_line,
    % turn(NewGameState, NewPlayer, NewColor).

success_play(Player, NewPlayer, Color, NewColor, NewGameState) :-
    enter_to_continue,
    alternate_value(Player, NewPlayer),
    alternate_value(Color, NewColor),
    nl, horizontal_line,
    turn(NewGameState, NewPlayer, NewColor).

play_piece(GameState, Row, InputCol, Option, NewGameState1) :-
    % get_input_piece(InputRow, InputCol),
    % convert_input_row(InputRow, Row),

    % Row @> 0, Row @< 12,
    % InputCol @> 0, InputCol @< 12,

    get_black_piece(Row, InputCol, Option, BlackRow, BlackCol),

    replace_(GameState, Row, InputCol, white, NewGameState),
    replace_(NewGameState, BlackRow, BlackCol, black, NewGameState1),

    % replace_(GameState, Row, InputCol, white, NewGameState), <-------

    write('Played Piece'), nl.


valid_moves(GameState, _Player, Solucoes) :-
    findall(NewGameState1, play_piece(), Solucoes)


get_black_piece(Row, Col, Option, NewRow, NewCol) :-
    % show_options, nl,
    % read(Option),
    black_move_part(Row, Col, NewRow, NewCol, Option).

show_options :-
    write('    (1)                    (2)      '), nl,
    write('  [white, black]  [black, white]    '), nl, nl,
    write('    (3)                    (4)      '), nl,
    write('  [white,                [black,    '), nl,
    write('   black]                 white]    '), nl.

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

get_input_piece(InputRow, InputCol) :-
    write('White Piece Row: '), get_char(InputRow), get_char(_), nl,

    % write('White Piece Col: '), get_char(InputCol), get_char(_), nl,
    write('White Piece Col: '), read(InputCol), get_char(_),
    nl, nl,
    % format("User Row: ~p | User Col: ~p", [InputRow, InputCol]), 
    nl.

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



% ----------------------------------------------------------------
% Score

% Gets element at (I, J) coordinates of a matrix
% color(+Matrix, +(I, J), -Color)
color(Matrix, (I, J), Color) :-
    nth0(I, Matrix, Row),
    nth0(J, Row, Color).

% Returns all combinations of adjacent coordinates ; Checks bounds with L
% adjacent(+(X,Y), -(X, Yy), +L)
adjacent((X,Y), (X, Yy), L) :-
   (
    Yy is min(Y + 1, L - 1) 
   ; 
    Yy is max(Y - 1, 0)
    ),
    dif((X, Y), (X, Yy)).
adjacent((X,Y), (Xx, Y), L) :-
   (
    Xx is min(X + 1, L - 1)
   ;
    Xx is max(X - 1, 0)
    ),
    dif((X, Y), (Xx, Y)).

remove_list([], _, []).
remove_list([X|Tail], L2, Result):- member(X, L2), !, remove_list(Tail, L2, Result). 
remove_list([X|Tail], L2, [X|Result]):- remove_list(Tail, L2, Result).

atl(_, [], []).
atl(List, [H|T], R) :-
    (  member(H, List)
    -> R = Res
    ;  R = [H|Res]
    ),
    atl(List, T, Res).

% Removes elements in B from A and returns in L
% addToList(+A, +B, -L)
addToList(A, B, L) :-
    atl(A, B, R),
    append(A, R, L).

% dfs(+GameState, +Color, +ToVisit,+ VisitedIn, +DepthIn, -VisitedOut, -DepthOut)
%% Done, all visited 
dfs(_, _, [], VisitedIn, DepthIn, VisitedOut, DepthOut):-
    (DepthIn \= 1 -> DepthOut is DepthIn ; DepthOut is 0), 
    append([], VisitedIn, VisitedOut),
    !.
%% If has already been visited, skips
dfs(GameState, Color, [H|T], VisitedIn, DepthIn, VisitedOut, DepthOut) :-
    member(H,VisitedIn),
    dfs(GameState, Color, T, VisitedIn, DepthIn, VisitedOut, DepthOut).
%% If isn't correct color, skips and adds to visited
dfs(GameState, Color, [H|T], VisitedIn, DepthIn, VisitedOut, DepthOut) :-
    color(GameState, H, C), 
    C \= Color,
    dfs(GameState, Color, T, [H|VisitedIn], DepthIn, VisitedOut, DepthOut).
%% Add all neigbors of the head to the toVisit
dfs(GameState, Color, [H|T], VisitedIn, DepthIn, VisitedOut, DepthOut) :-
    length(GameState, L),
    findall((X, Y), adjacent((H), (X,Y), L), Nbs),
    addToList(Nbs,T, ToVisit),
    NewDepthIn is DepthIn + 1,
    dfs(GameState, Color, ToVisit, [H|VisitedIn], NewDepthIn, VisitedOut, DepthOut).

% algorithm(+GameState, +Color, +ToVisit, +Accumulator, +VisitedIn, -Value)
algorithm(_, _, [], Accumulator, _, Value):-
    Value is Accumulator.
algorithm(GameState, Color, [H|T], Accumulator, VisitedIn, Value):-
    dfs(GameState, Color, [H], VisitedIn, 0, VisitedOut, X),
    NewAccumulator is Accumulator + X,
    algorithm(GameState, Color, T, NewAccumulator, VisitedOut, Value).

% Returns lists with all indexes of square arrays of length L
% indexes_from_length(+L -Output)
indexes_from_length(L,Output):-
    (L =:= 7 -> append([], [(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(1,0),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,0),(2, 1),(2,2),(2,3),(2,4),(2,5),(2,6),(3,0),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(4,0),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(5,0),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(6,0),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6)], Output);
    L =:= 9 -> append([], [(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(1,0),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(2,0),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(3,0),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(4,0),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(5,0),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(6,0),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(7,0),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8)], Output);
    L =:= 11 -> append([], [(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10),(1,0),(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,0),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,0),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(4,0),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(5,0),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(6,0),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(7,0),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(9,0),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(10,0),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10)], Output);
    fail).

value(GameState, Color, Value):-
    L is length(GameState),
    indexes_from_length(L, ToVisit),
    algorithm(GameState, Color, ToVisit, 0, [], Value).


% ----------------------------------------------------------------

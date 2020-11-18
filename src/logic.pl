
% Checks if board is full and game is over.
% check_ full_ board(Board):-().



% Checks if both positions to be occupied by a piece fit on the board. If either position fails, informs the user and asks for new input.
% check_move(Board, X1, Y1, X2, Y2):-().



% Counts up score of both colors, called when game is over
% count_score(Board, WhiteScore, BlackScore):-().




turn(GameState, Player, Color) :-
    nl,
    valid_moves(GameState, Player, ListOfMoves).
    % game_over(GameState, Winner),
    % nl, nl, write(' TURN '), nl, nl,
    % display_game(GameState, Player, Color),
    % play_piece(GameState),
    % enter_to_continue,
    % alternate_value(Player, NewPlayer),
    % alternate_value(Color, NewColor),
    % nl, horizontal_line,
    % turn(GameState, NewPlayer, NewColor).


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
    % get_all_occurences(H, 0).
    % iterate_row(H), nl,
    % iterate_matrix(T).
    indices(H, clear, []).

get_all_occurences([], _, _).
get_all_occurences(List, IndexAcumulation) :-
    nth1(Found, List, clear, Rest), write('Clear: '), write(Found),
    IndexAcumulation1 is IndexAcumulation + 1,
    % write('\nIndex Acumulation: '), write(IndexAcumulation1),
    nl, nl,
    write('Rest: '), write(Rest),
    get_all_occurences(Rest, IndexAcumulation1).


indices(List, E, Is) :-
    indices_1(List, E, Is, 1).

indices_1([], _, [], _).

indices_1([E|Xs], E, [I|Is], I) :-
    write(List), write(' '), write(E), write(' '), write(Is), nl,
    I1 is I + 1,
    indices_1(Xs, E, Is, I1).

indices_1([X|Xs], E, Is, I) :- dif(X, E),
    I1 is I + 1,
    indices_1(Xs, E, Is, I1).

iterate_row([]).
iterate_row([H|T]) :-
    % write(H),
    % nth1(Found, H, clear), write('Clear: '), write(Found), nl,

    % write('Element of row: '), write(H), nl,
    iterate_row(T), nl.
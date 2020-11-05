
% Checks if board is full and game is over.
% check_ full_ board(Board):-().



% Checks if both positions to be occupied by a piece fit on the board. If either position fails, informs the user and asks for new input.
% check_move(Board, X1, Y1, X2, Y2):-().



% Counts up score of both colors, called when game is over
% count_score(Board, WhiteScore, BlackScore):-().




turn(GameState, White) :-
    nl, nl, write(' TURN '), nl, nl,
    display_game(GameState, White).


% 
player_vs_player(GameState) :-
    random_white_number(White),
    turn(GameState, White).



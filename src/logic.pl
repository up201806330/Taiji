
% Checks if board is full and game is over.
% check_ full_ board(Board):-().



% Checks if both positions to be occupied by a piece fit on the board. If either position fails, informs the user and asks for new input.
% check_move(Board, X1, Y1, X2, Y2):-().



% Counts up score of both colors, called when game is over
% count_score(Board, WhiteScore, BlackScore):-().




turn(GameState, Player, Color) :-
    check_full_board(GameState),
    nl, nl, write(' TURN '), nl, nl,
    display_game(GameState, Player, Color),
    play_piece(GameState),
    enter_to_continue,
    change_player(Player, NewPlayer),
    change_player(Color, NewColor),
    turn(GameState, NewPlayer, NewColor).


change_player(Player, NewPlayer) :-
    ( Player = 0
    ->  NewPlayer = 1   % if the player is 0 change it to 1
    ;   NewPlayer = 0   % else the player is 1 and changes it to 0
    ).
    % write('Changed Player'), nl.

play_piece(GameState) :-
    write('Played Piece'), nl.

check_full_board(GameState) :-
    write('Not Full'), nl.

% Player vs Player Mode
player_vs_player(GameState) :-
    random_white_number(White),
    turn(GameState, White, 0).



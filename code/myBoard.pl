% translation(clear, CHAR) :- CHAR = '.'.
% translation(white, CHAR) :- CHAR = 'w'.
% translation(black, CHAR) :- CHAR = 'b'.

% start state board
initial_board([
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear]
]).

% intermediate state board
intermediate_board([
[black,white,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,black,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,white,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,white,clear,clear,clear,clear],
[clear,clear,black,white,white,black,black,clear,clear,clear,clear],
[clear,black,black,white,white,black,black,white,clear,clear,clear],
[clear,white,clear,clear,black,clear,white,black,clear,clear,clear],
[clear,clear,clear,clear,white,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear]
]).

% end state board
end_board([
[black,white,white,white,black,white,clear,white,black,white,black],
[clear,black,black,black,black,white,white,black,clear,white,black],
[black,white,black,black,white,white,white,black,black,white,white],
[white,white,white,white,black,black,white,black,white,clear,black],
[white,black,black,white,white,black,black,black,white,black,white],
[black,black,black,white,white,black,black,white,clear,white,black],
[clear,white,white,black,black,clear,white,black,black,black,white],
[black,white,black,white,white,black,black,clear,white,black,white],
[black,white,clear,white,black,white,white,black,black,white,clear],
[black,white,white,black,black,black,white,white,black,black,white],
[clear,white,black,clear,white,clear,black,white,white,black,white]
]).

% custom write for each of the possibilities
write_char(clear) :- write('.').
write_char(white) :- write('w').
write_char(black) :- write('b').

% base case of a line of the board
write_line([]).

write_line([Head|Tail]) :-
    % translation(Head, CHAR),
    write_char(Head),
    write('|'),
    write_line(Tail).

% base case of the board
write_board([]).

write_board([Head|Tail]) :-
    write('|'),
    write_line(Head), nl,
    write_board(Tail).
   
% predicate that returns the inital board state
initial(GameState) :-
    initial_board(GameState).


% ------------------------- up to here is "done" / "final" -------------------------

% display_game(GameState, Player):

% play :-
%     initial(GameState),
%     write_board(GameState),
%     start(GameState).

play :-
    % initial_board(InitialBoard),
    % write_board(InitialBoard).
    initial(GameState),
    write_board(GameState).

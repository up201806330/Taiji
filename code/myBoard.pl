% translation(clear, CHAR) :- CHAR = '.'.
% translation(white, CHAR) :- CHAR = 'w'.
% translation(black, CHAR) :- CHAR = 'b'.

% board at the start
initialBoard([
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


% custom write for each of the possible 
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
   

start(_) :-
    initialBoard(InitialBoard),
    write_board(InitialBoard).

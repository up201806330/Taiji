% custom write for each of the possibilities
write_char(clear) :- write(' ').
write_char(white) :- write('w').
write_char(black) :- write('B').

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
    nl, write('Initial State Board'), nl,
    initial_board(GameState).

% predicate that returns the intermediate board state
intermediate(GameState) :-
    nl, write('Intermediate State Board'), nl,
    intermediate_board(GameState).

% predicate that returns the end board state
end(GameState) :-
    nl, write('End State Board'), nl,
    end_board(GameState).
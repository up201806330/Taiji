horizontal_line :-
    write(  '-------------------------------------------'), nl.

write_user_insert_input :-
    write('     :- '). 

enter_to_continue:-
	write('Press Enter to continue.'), nl,
	write_user_insert_input, get_char(_), !.

% Source: https://swi-prolog.discourse.group/t/useful-command-to-clear-the-console/976
clear_terminal :-
    write('\e[H\e[2J').

% Trim List L to length N
trim(L,N,S) :-
    length(L,X),
    PL is X - N,
    length(P,PL), 
    append(S,P,L).
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

replace_( [L|Ls] , 0 , Y , Z , [R|Ls] ) :-      % once we find the desired row,
  replace_column(L,Y,Z,R)                       % - we replace specified column, and we're done.
  .                                             %
replace_( [L|Ls] , X , Y , Z , [L|Rs] ) :-      % if we haven't found the desired row yet
  X > 0 ,                                       % - and the row offset is positive,
  X1 is X-1 ,                                   % - we decrement the row offset
  replace_( Ls , X1 , Y , Z , Rs )              % - and recurse down
  .                                             %

replace_column( [COld|Cs] , 0 , Z , [Z|Cs] ) :-
    compare(=, COld, 'clear')                   % <--- checks if clear
    .                                           % once we find the specified offset, just make the substitution and finish up.
replace_column( [C|Cs] , Y , Z , [C|Rs] ) :-    % otherwise,
  Y > 0 ,                                       % - assuming that the column offset is positive,
  Y1 is Y-1 ,                                   % - we decrement it
  replace_column( Cs , Y1 , Z , Rs )            % - and recurse down.
  .
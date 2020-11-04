horizontal_line :-
    write(  '-------------------------------------------'), nl.

write_user_insert_input :-
    write('     :- '). 

enter_to_continue:-
	write('Press Enter to continue.'), nl,
	write_user_insert_input, get_char(_), !.

% https://swi-prolog.discourse.group/t/useful-command-to-clear-the-console/976
clear_terminal :-
    write('\e[H\e[2J').

taiji_ascii :-
    nl, nl,
    horizontal_line,
    write(  '           _____       _   _  _    '), nl,
    write(  '          |_   _|__ _ (_) (_)(_)   '), nl,
    write(  '            | | / _` || | | || |   '), nl,
    write(  '            | || (_| || | | || |   '), nl,
    write(  '            |_| \\__,_||_|_/ ||_|  '), nl,
    write(  '                        |__/       '), nl,
    horizontal_line.

board_size_menu :-
    write_board_size_menu,
    write_user_insert_input,
    get_char(Input), get_char(_),
    (   Input = '1' -> write('User wrote 1'), nl;
        Input = '2' -> write('User wrote 2'), nl;
        Input = '3' -> write('User wrote 3'), nl;
    
    nl, write('Invalid Option'), nl,
    enter_to_continue, nl, write('Past'),
    clear_terminal, board_size_menu
    ).


write_board_size_menu :-
    horizontal_line, nl,
    write(  '       Choose your desired board size      '), nl, nl,
    write(  '               1.  7  x  7                 '), nl,
    write(  '               2.  9  x  9                 '), nl,
    write(  '               3.  11 x 11                 '), nl,
    horizontal_line, nl.







    
    
    
   

                                                  
                                                  
                                                  

                                               

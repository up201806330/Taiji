%:- [display].

% Displays the name of the game
% From: http://patorjk.com/software/taag/#p=testall&h=1&v=0&f=Dancing%20Font&t=Taiji
% Font Name: Ivrit
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


% Board size Menu
board_size_menu(GameState) :-
    write_board_size_menu,                          % Displays the menu
    write_user_insert_input,                        % Displays line where the user will write input
    get_char(Input), get_char(_),                   % Input Handling ("Switch")
    (   % Input = '1' -> /* write('User wrote 1'), */ nl, nl;
        % Input = '2' -> /* write('User wrote 2'), */ nl, nl;
        Input = '3' -> /* write('User wrote 3'), */ initial(GameState), nl;
    
    nl, write('Invalid Option'), nl,                % "Else statement"
    enter_to_continue, nl,
    clear_terminal, board_size_menu(GameState)
    ).




% Player vs Player / Player vs AI menu
mode_pvp_ai_menu(GameState) :-
    write_mode_pvp_ai_menu,                         % Displays the menu
    write_user_insert_input,                        % Displays line where the user will write input
    get_char(Input), get_char(_),                   % Input Handling ("Switch")
    (   Input = '1' -> /* write('User wrote 1'), */ player_vs_player(GameState), nl, nl;
        % Input = '2' -> /* write('User wrote 2'), */ nl, nl;
        % Input = '3' -> /* write('User wrote 3'), */ nl;
    
    nl, write('Invalid Option'), nl,                % "Else statement"
    enter_to_continue, nl,
    clear_terminal, mode_pvp_ai_menu(GameState)
    ).






    
    
    
   

                                                  
                                                  
                                                  

                                               

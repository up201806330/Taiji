Taiji_1 — Final Delivery (PLOG 2020/21)

Class 5
up201806613@fe.up.pt João António Cardoso Vieira e Basto de Sousa
up201806330@fe.up.pt Rafael Soares Ribeiro

30th of November, 2020

-----------------------------------------------------------------------------------
Installation and Execution

In order to run the game, first open SICStus and click on "File", then on "Consult" and select the file "myTaiji.pl". As an alternative, use just the following command in the SICStus terminal: consult('[path to myTaiji.pl]'). If using Windows, remember to double the char '\' to '\\' to prevent SICStus from recognizing the backslash as the Escape Character.
After this loading process, just type 'play.' to get into the game.

-----------------------------------------------------------------------------------
Game Description

Taiji is a game for 2 players where the goal is to get the highest score. 
The score is determined by the (sum of the) size of the largest group or groups of horizontally or vertically adjacent (diagonal alignment not included) squares of the players' respective colour (light or dark).
The game is constituted concretely by pieces and a 11 by 11 board, whose pre-defined occupation rate determines the number of groups to include for the end score: 3 groups for 11x11, 2 for 9x9 and only 1 group for a 7x7 game.
The 60 pieces of the game are called TAJITUs: 2-square wide rectangular pieces (2x1) with both of the colours, one in one of the halves, the other on the other half.

The game starts by determining randomly the colour of the 2 players, having the first turn the player with the light colour. One at a time, players alternate to place one TAJITU on the board until the game reached a state where there is no space for another TAJITU to be placed, meaning that a player might be helping the other one to win the game because each piece has both colours.
At the end, if a tie in the number of points occurs, the dark colour player wins.

-----------------------------------------------------------------------------------
Game Logic

    Game State Representation

    The game state is stored as a list of lists (matrix). On the screen, the row and column identifiers are also displayed.

    As previously stated, each piece is made up of two different color squares.
    Due to the fact that both players play the same pieces, the "unit of representation" on the board is not the rectangle, but instead the square (therefore each player fills two squares per turn), and the number of total pieces (60 which correspond to 120 squares) is not stored or taken into account because it does not exceed the capacity of the board (121 squares which converts to 60.5 pieces). Each player is associated to an identifying number (and corresponding color).
    The values of the board cells refer to their occupation: clear represents a free square (not occupied) and white and black indicate the color of an occupied square (see following board representations and description).

    Initial, intermediate and final board examples

    Initial State board
    |   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | X | 
    | A |   |   |   |   |   |   |   |   |   |   |   | 
    | B |   |   |   |   |   |   |   |   |   |   |   | 
    | C |   |   |   |   |   |   |   |   |   |   |   | 
    | D |   |   |   |   |   |   |   |   |   |   |   | 
    | E |   |   |   |   |   |   |   |   |   |   |   | 
    | F |   |   |   |   |   |   |   |   |   |   |   | 
    | G |   |   |   |   |   |   |   |   |   |   |   | 
    | H |   |   |   |   |   |   |   |   |   |   |   | 
    | I |   |   |   |   |   |   |   |   |   |   |   | 
    | J |   |   |   |   |   |   |   |   |   |   |   | 
    | K |   |   |   |   |   |   |   |   |   |   |   | 

    [
        [clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
        [clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
        (...)
        [clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear]
    ]

    Intermediate State board
    |   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | X | 
    | A | b | w |   |   |   |   |   |   |   |   |   | 
    | B |   | b |   |   |   |   |   |   |   |   |   | 
    | C |   | w |   |   |   |   |   |   |   |   |   | 
    | D |   |   |   |   |   |   | w |   |   |   |   | 
    | E |   |   | b | w | w | b | b |   |   |   |   | 
    | F |   | b | b | w | w | b | b | w |   |   |   | 
    | G |   | w |   |   | b |   | w | b |   |   |   | 
    | H |   |   |   |   | w |   |   |   |   |   |   | 
    | I |   |   |   |   |   |   |   |   |   |   |   | 
    | J |   |   |   |   |   |   |   |   |   |   |   | 
    | K |   |   |   |   |   |   |   |   |   |   |   | 

    [
        [black,white,clear,clear,clear,clear,clear,clear,clear,clear,clear],
        [clear,black,clear,clear,clear,clear,clear,clear,clear,clear,clear],
        (...)
        [clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear]
    ]

    End State board
    |   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | X | 
    | A | b | w | w | w | b | w |   | w | b | w | b | 
    | B |   | b | b | b | b | w | w | b |   | w | b | 
    | C | b | w | b | b | w | w | w | b | b | w | w | 
    | D | w | w | w | w | b | b | w | b | w |   | b | 
    | E | w | b | b | w | w | b | b | b | w | b | w | 
    | F | b | b | b | w | w | b | b | w |   | w | b | 
    | G |   | w | w | b | b |   | w | b | b | b | w | 
    | H | b | w | b | w | w | b | b |   | w | b | w | 
    | I | b | w |   | w | b | w | w | b | b | w |   | 
    | J | b | w | w | b | b | b | w | w | b | b | w | 
    | K |   | w | b |   | w |   | b | w | w | b | w | 

    [
        [black,white,white,white,black,white,clear,white,black,white,black],
        [clear,black,black,black,black,white,white,black,clear,white,black],
        (...)
        [clear,white,black,clear,white,clear,black,white,white,black,white]
    ]

    black, white -> occupied square colors (b, w)
    clear -> unoccupied square

    -----------------------------------------------------------------------------------
    Game State Preview // TODO MENU E INPUTS

    The game visualization predicate, display_game(GameState,Player), takes the current state of the game - a matrix (list of lists) - and passes it to write_board.
    This predicate operates in a recursive manner, calling write_line on the Head of the matrix (1st row) before calling itself with the Tail of the matrix, repeating this process until it reaches its base case: the argument passed to it is an empty list. The first time write_board is called, it draws the column number line and at the start of each write_line invocation it draws the respective row letter.
    The predicate write_line translates each value of a list to its respective symbol and draws it in the SICStus terminal.

    When it comes to the Player argument (number 0, 1 or 2 if computer, player 1 or player 2, respectively) of the visualization predicate, its role is to store the player of the current turn which dictates how the move is chosen: either by asking the user for input or by running choose_move (computer turn).

        Menus

        When the game is run, a menu presents itself prompting the user to choose a board size:

        -------------------------------------------

                  _____       _   _  _    
                 |_   _|__ _ (_) (_)(_)   
                   | | / _` || | | || |   
                   | || (_| || | | || |   
                   |_| \__,_||_|_/ ||_|  
                               |__/    
                           
        -------------------------------------------

        -------------------------------------------

            Choose your desired board size      

                    1.  7  x  7                 
                    2.  9  x  9                 
                    3.  11 x 11
                    4.  Exit
        -------------------------------------------

        Next, the user selects the desired mode:

        -------------------------------------------

            Choose your desired mode      

                1.  Player vs Player        
                2.  Player vs Computer            
                3.  Computer vs Computer          
        -------------------------------------------

        And finally, if the chosen mode involves the Computer, the user picks it's difficulty level:

        -------------------------------------------

            Choose the AI's difficulty    

                1.  Easy                    
                2.  Medium                  
                3.  Hard                    
        -------------------------------------------
        
        When the game is over, the user can press Enter to go back to the main menu.
        User inputs are subject to validation, i.e. an unexpected input warns the user and asks for another try.

    -----------------------------------------------------------------------------------
    List of Valid Moves

    Obtaining the list of possible plays is the responsibility of the predicate valid_moves(+GameState, +Player, -ListOfMoves).

    This predicate starts by getting the board dimensions and passes them to iterateBoard(+GameState, +NumRows, +NumCols, +Player, -ValidMoves) which iterates over the rows of the matrix that represents the current board.
    In its turn, iterateBoard calls searchMove(+GameState, +List, +NumRow, +NumCol, +NumRows, +NumCols, +Player, -CurrFound) which iterates over each element of the specified row of the board, putting in CurrFound the different possible move options discovered regarding each element of the row as the white part of a piece.

    This discovery process takes place as follows: first, check if the Head of the list that represents a row is free, that is, its value is 'clear'.
    In case that spot is already occupied, in other words, it has as value either 'white' or 'black', the element is skipped and searchMove is called with almost the same arguments (NumCol + 1). Otherwise (free spot situation), the predicate checkAdjacents(+GameState, +NumRow, +NumCol, +NumRows, +NumCols, -AdjacentMoves) is called, checking the four possible positions for the black part of the piece (predicates checkDown, checkUp, checkLeft and checkRight that each return either an empty list if that direction corresponds to an occupied spot or a list with 2 elements: row and column number of that free position).

    -----------------------------------------------------------------------------------
    Move Execution

    Move execution is taken care of by the predicate move(+GameState, +Move, -NewGameState).
    The argument Move is structured as a list of the positions of the two elements that make a piece, i.e. [[0,1],[0,2]] represents a move where the white part of the piece is in the 1st row, 2nd column and the black part in the 1st row, 3rd column.
    The predicate move itself starts by getting the Head of the argument Move (that is, the white position) and afterwards the Head of the Tail of Move (black position), calling the predicate replace_ on each one, which performs a substitution of an element of the matrix given the matrix, row, column and new value of the element to change, returning the updated matrix.
                
    -----------------------------------------------------------------------------------
    End of the Game

    As previously stated, the game ends when no other move is possible, in other words, there aren't two adjacent spots in the board marked as 'clear'.
    The main predicate that handles this situation is named game_over(+GameState, -Winner) and it is called at the start of every turn.
    game_over starts by getting the score for each of the colors by calling the predicate value (in detail in the next subsection) and afterwards valid_moves. If valid_moves returns an empty list of possible moves then the winner is determined based on the scores previously retrieved.

    When game_over succeeds it returns the color that won, which is then used to determine whose player is the winner. Otherwise, fails and lets the turn happen as normal.

    -----------------------------------------------------------------------------------
    Board Value

    The predicate value(+GameState, +Player, -Value) is responsible for returning the score of the color (player) passed as argument, given the GameState.
    First gets the length of the board, then retrieves all the possible positions (indexes) of the board to a "non visited" list.
    At last, calls the predicate algorithm which traverses the board using a Depth-First Search, adding the zones of the selected color that have at least a size of two.
    In more detail, starts by getting the position that it is checking. Then behaves differently, depending on that spot's color and if it has already been visited or not. If it was already visited, skips it. If it wasn't, but the color is not the desired one, adds it to the visited list and continues. Finally, if that cell wasn't yet visited and its color matches, calls the predicate findall to get all the valid adjacent cells and adds these at the top of the ToVisit list.

    -----------------------------------------------------------------------------------
    Computer Play

    The Computer Play is handled by choose_move(+GameState, +Color, +Level, -Move).
    This predicate determines the Move to be executed by the computer, taking into account the GameState and the difficulty level (argument Level). The Color argument replaces the Player argument, being used to calculate the scores.
    There are three levels of difficulty, both making use of the predicate valid_moves to get the possible move options:
    - level 1 -> selects a valid move at random
    - level 2 -> choose the move that maximizes the computer score
    - level 3 -> same as level 2 but in the event of a tie, chooses the move that minimizes the oponent's score.


-----------------------------------------------------------------------------------
Conclusions

This project was concluded successfully, resulting in the implementation of a board game for two players using the programming language Prolog.
In the beginning, due to the fact that the syntax and thought process of Prolog was brand new to us, the pace of development was slow, but, over time, we started to understand better the language and the obstacles we encountered got gradually easier to overcome.
When it comes to known issues, such as bugs or limitations, we didn't find any.
As for possible improvements, the main point that comes to mind is better AI with the ability to make the best move in the present state of the board that translates to a better result in the long run.

-----------------------------------------------------------------------------------
Bibliography

- SICStus Prolog Documentation
- SWI Prolog Documentation / Forums (for example, https://swi-prolog.discourse.group/t/useful-command-to-clear-the-console/976, to clear the terminal)
- Game Related Websites: https://nestorgames.com/rulebooks/TAIJI_EN4.pdf, http://www.iggamecenter.com/
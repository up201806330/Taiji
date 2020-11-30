Taiji_1 — Delivery I (PLOG 2020/21)

Class 5
up201806613@fe.up.pt João António Cardoso Vieira e Basto de Sousa
up201806330@fe.up.pt Rafael Soares Ribeiro

1st of November, 2020

-----------------------------------------------------------------------------------
Installation and Execution

In order to run the game, first open SICStus and click on "File", then on "Consult" and select the file "myTaiji.pl". As an alternative, use just the following command in the SICStus terminal: consult('[path to myTaiji.pl]'). If using Windows, remember to double the char '\' to '\\' to prevent SICStus from recognizing the backslash as the Escape Character.
After this loading process, just type 'play.' to get into the game.

-----------------------------------------------------------------------------------
Game Description

Taiji is a game for 2 players where the goal is to get the highest score. 
The score is determined by the (sum of the) size of the largest group or groups of horizontally or vertically adjacent (diagonal alignment not included) squares of the players' respective colour (light or dark). 

The game is constituted concretely by pieces and a 11 by 11 board, whose pre-defined occupation rate determines the number of groups to include for the end score: 3 groups for 11x11 (whole board), 2 for 9x9 (outer ring unoccupied) and only 1 group for a 7x7 (last 2 outer rings unoccupied) game.
The 60 pieces of the game are called TAJITUs: 2-square wide rectangular pieces (2x1) with both of the colours, one in one of the halves, the other on the other half.

The game starts by determining randomly the colour of the 2 players, having the first turn the player with the light colour. One at a time, players alternate to place one TAJITU on the board until the game reached a state where there is no space for another TAJITU to be placed, meaning that a player might be helping the other one to win the game because each piece has both colours.
At the end, if a tie in the number of points occurs, the dark colour player wins.

-----------------------------------------------------------------------------------
Game Logic

    Game State Representation

    The game board is represented as a list of lists (matrix). The first row (excluding the first element) of the matrix corresponds to the ASCII code of the numbers that uniquely identify each of the columns and the same applies to the first element of each row (excluding the first one) by using letters instead of numbers, similarly to the chess position system.

    As previously stated, each piece is made up of two different color squares.
    Due to the fact that both players play the same pieces, the "unit of representation" on the board is not the rectangle, but instead the square (therefore each player fills two squares per turn), and the number of total pieces (60 which correspond to 120 squares) is not stored or taken into account because it does not exceed the capacity of the board (121 squares which converts to 60.5 pieces). Each player is associated to an identifying number (and corresponding color), which is only being utilized (excluding the beggining and end of the game) to let the players know whose turn it is.
    The elements that are numbers in a game board matrix are the ASCII correspondents of their "visual" representation. The other refer to the occupation of the board itself: clear represents a free square (not occupied) and white and black indicate the color of an occupied square (see following board representations and description) - to note that the matrices are 12 by 12 and not 11 by 11 to store the positioning information.

    Initial, intermediate and final board examples

    Initial State board
    |   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10| 
    | A |   |   |   |   |   |   |   |   |   |   |   | 
    | b |   |   |   |   |   |   |   |   |   |   |   | 
    | C |   |   |   |   |   |   |   |   |   |   |   | 
    | D |   |   |   |   |   |   |   |   |   |   |   | 
    | E |   |   |   |   |   |   |   |   |   |   |   | 
    | F |   |   |   |   |   |   |   |   |   |   |   | 
    | G |   |   |   |   |   |   |   |   |   |   |   | 
    | H |   |   |   |   |   |   |   |   |   |   |   | 
    | I |   |   |   |   |   |   |   |   |   |   |   | 
    | J |   |   |   |   |   |   |   |   |   |   |   | 
    | K |   |   |   |   |   |   |   |   |   |   |   | 

    Intermediate State board
    |   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10| 
    | A | b | w |   |   |   |   |   |   |   |   |   | 
    | b |   | b |   |   |   |   |   |   |   |   |   | 
    | C |   | w |   |   |   |   |   |   |   |   |   | 
    | D |   |   |   |   |   |   | w |   |   |   |   | 
    | E |   |   | b | w | w | b | b |   |   |   |   | 
    | F |   | b | b | w | w | b | b | w |   |   |   | 
    | G |   | w |   |   | b |   | w | b |   |   |   | 
    | H |   |   |   |   | w |   |   |   |   |   |   | 
    | I |   |   |   |   |   |   |   |   |   |   |   | 
    | J |   |   |   |   |   |   |   |   |   |   |   | 
    | K |   |   |   |   |   |   |   |   |   |   |   | 

    End State board
    |   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10| 
    | A | b | w | w | w | b | w |   | w | b | w | b | 
    | b |   | b | b | b | b | w | w | b |   | w | b | 
    | C | b | w | b | b | w | w | w | b | b | w | w | 
    | D | w | w | w | w | b | b | w | b | w |   | b | 
    | E | w | b | b | w | w | b | b | b | w | b | w | 
    | F | b | b | b | w | w | b | b | w |   | w | b | 
    | G |   | w | w | b | b |   | w | b | b | b | w | 
    | H | b | w | b | w | w | b | b |   | w | b | w | 
    | I | b | w |   | w | b | w | w | b | b | w |   | 
    | J | b | w | w | b | b | b | w | w | b | b | w | 
    | K |   | w | b |   | w |   | b | w | w | b | w | 

    TODO CHANGE VALUES DESCRIPTIONS
    Values' description:  
    48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58 -> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75 -> A, B, C, D, E, F, G, H, I, J, K
    black, white -> occupied square colors
    clear -> unoccupied square

    -----------------------------------------------------------------------------------
    Game State Preview

    The game visualization predicate, display_game(GameState,Player), takes the current state of the game - a matrix (list of lists) - and passes it to write_board.
    This predicate operates in a recursive manner, calling write_line on the Head of the matrix (1st row) before calling itself with the Tail of the matrix, repeating this process until it reaches its base case: the argument passed to it is an empty list.
    The predicate write_line translates each value of a list to its respective symbol and draws it in the SICStus terminal.

    In this intermediate delivery, the temporary functions initial(GameState), intermediate(GameState) and end(GameState) return examples of the game board at different stages of play (seen above).

    When it comes to the Player argument (a number) of the visualization predicate, its role is only to let the user know what is the player that is having the next turn (via the write\textunderscore player predicate), because unlike other games, in Taiji both players play the same pieces and don't have any data associated to themselves other than their number (and color).

    -----------------------------------------------------------------------------------
    List of Valid Moves // TODO CHANGE PREDICATE NAMES

    Obtaining the list of possible plays is the responsibility of the predicate valid_moves(+GameState, +Player, -ListOfMoves).

    This predicate starts by getting the board dimensions and passes them to iterateMatrix(GameState, NumRows, NumCols, Player, ListOfMoves) which iterates over the rows of the matrix that represents the current board.
    In its turn, iterateMatrix calls findPiece(GameState, List, NumRow, NumCol, NumRows, NumCols, Player, FoundMovesPieces) which iterates over each element of the specified row of the board, putting in FoundMovesPieces the different possible move options discovered regarding each element of the row as the white part of a piece.

    This discovery process takes place as follows: first, check if the Head of the list that represents a row is free, that is, its value is 'clear' or not.
    In case that spot is already occupied, in other words, it has as value either 'white' or 'black', the element is skipped and findPiece is called with almost the same arguments, only changing the NumCol to which 1 unit is added. Otherwise (free spot situation), the predicate checkNeighbours(GameState,NumRow,NumCol, NumRows, NumCols,CellPiecesAndMoves) is called, checking the four possible positions for the black part of the piece (predicates checkDown, checkUp, checkLeft and checkRight that each return either an empty list if that direction corresponds to an occupied spot or a list with 2 elements: row and column number of that free position).

    -----------------------------------------------------------------------------------
    Move Execution // TODO CHANGE PREDICATE NAMES

    Move execution is taken care of by the predicate move(+GameState, +Move, -NewGameState).
    The argument Move is structured as a list of the positions of the two elements that make a piece, i.e. [[0,1],[0,2]] represents a move where the white part of the piece is in the 1st row, 2nd column and the black part in the 1st row, 3rd column.
    The predicate move itself starts by getting the Head of the argument Move (that is, the white position) and afterwards the Head of the Tail of Move (black position), calling for each one the predicate replace_ which performs a substitution of an element of the matrix given the matrix, row, column and new value of the element to change, returning the updated matrix.

    -----------------------------------------------------------------------------------
    End of the Game // TODO CHANGE PREDICATE NAMES ?

    As previously stated, the game ends when no other move is possible, in other words, there aren't two adjacent spots in the board marked as 'clear'.
    The main predicate that handles this situation is named game_over(+GameState, -Winner) and it is called at the start of every turn (call of the predicate turn).
    game_over starts by getting the score for each of the colors by calling the predicate value (in detail in the next subsection) and afterwards valid_moves. If valid_moves returns an empty list of possible moves then the winner is determined based on the scores previously retrieved.

    When game_over succeeds it returns the color that won, which is then used to determine whose player is the winner. Otherwise, fails and lets the turn happen as normal.

    -----------------------------------------------------------------------------------
    Board Value // TODO WHAT TO WRITE HERE

    The board value is obtained via the predicate value(+GameState, +Player, -Value) that
    (...) The player argument corresponds to the color to be checked (either white or black) 


    -----------------------------------------------------------------------------------
    Computer Play // TODO WHAT TO WRITE HERE



-----------------------------------------------------------------------------------
Conclusions

This project was concluded successfully, resulting in the implementation of a board game for two players using the programming language Prolog.
In the beginning, due to the fact that the syntax and thought process of Prolog was brand new to us, the pace of development was low, but, over time, we started to understand better the language and the obstacles we encountered got gradually easier to overcome. 
When it comes to known issues, such as bugs or limitations, we didn't find any.
As for possible improvements, the main point that comes to mind is better AI with the ability to make the best move in the present state of the board that translates to a better result in the long run.

-----------------------------------------------------------------------------------
Bibliography

- SICStus Prolog Documentation
- SWI Prolog Documentation / Forums (for example, https://swi-prolog.discourse.group/t/useful-command-to-clear-the-console/976, to clear the terminal)
- Game Website: https://nestorgames.com/rulebooks/TAIJI_EN4.pdf
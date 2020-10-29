Taiji_1 — Delivery I (PLOG 2020/21)

Class 5
up201806613@fe.up.pt João António Cardoso Vieira e Basto de Sousa
up201806330@fe.up.pt Rafael Soares Ribeiro

1st of November, 2020

-----------------------------------------------------------------------------------
Game Description

Taiji is a game for 2 players where the goal is to get the highest score. 
The score is determined by the (sum of the) size of the largest group or groups of horizontally or vertically adjacent (diagonal alignment not included) squares of the players' respective colour (light or dark). 

The game is constituted concretely by pieces and a 11 by 11 board, whose pre-defined occupation rate determines the number of groups to include for the end score: 3 groups for 11x11 (whole board), 2 for 9x9 (outer ring unoccupied) and only 1 group for a 7x7 (last 2 outer rings unoccupied) game.
The 60 pieces of the game are called TAJITUs: 2-square wide rectangular pieces (2x1) with both of the colours, one in one of the halves, the other on the other half.

The game starts by determining randomly the colour of the 2 players, having the first turn the player with the light colour. One at a time, players alternate to place one TAJITU on the board until the game reached a state where there is no space for another TAJITU to be placed, meaning that a player might be helping the other one to win the game because each piece has both colours.
At the end, if a tie in the number of points occurs, the dark colour player wins.

(Source: https://nestorgames.com/rulebooks/TAIJI_EN4.pdf)

-----------------------------------------------------------------------------------
Game State Representation

The game board is represented as a list of lists (matrix). The first row (excluding the first element) of the matrix corresponds to the ASCII code of the numbers that uniquely identify each of the columns and the same applies to the first element of each row (excluding the first one) by using letters instead of numbers, similarly to the chess position system.

As previously stated, each piece is made up of two different color squares.
Due to the fact that both players play the same pieces, the "unit of representation" on the board is not the rectangle, but instead the square (therefore each player fills two squares per turn), and the number of total pieces (60 which correspond to 120 squares) is not stored or taken into account because it does not exceed the capacity of the board (121 squares which converts to 60.5 pieces). Each player is associated to an identifying number (and corresponding color), which is only being utilized (excluding the beggining and end of the game) to let the players know whose turn it is.
The elements that are numbers in a game board matrix are the ASCII correspondents of their "visual" representation. The other refer to the occupation of the board itself: clear represents a free square (not occupied) and white and black indicate the color of an occupied square (see following board representations and description) - to note that the matrices are 12 by 12 and not 11 by 11 to store the positioning information.


Initial, intermediate and final board examples

initial_board([
[clear,   48,   49,   50,   51,   52,   53,   54,   55,   56,   57,   58],
[   65,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   66,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   67,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   68,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   69,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   70,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   71,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   72,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   73,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   74,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   75,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear]
]).

intermediate_board([
[clear,   48,   49,   50,   51,   52,   53,   54,   55,   56,   57,   58],
[   65,black,white,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   66,clear,black,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   67,clear,white,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   68,clear,clear,clear,clear,clear,clear,white,clear,clear,clear,clear],
[   69,clear,clear,black,white,white,black,black,clear,clear,clear,clear],
[   70,clear,black,black,white,white,black,black,white,clear,clear,clear],
[   71,clear,white,clear,clear,black,clear,white,black,clear,clear,clear],
[   72,clear,clear,clear,clear,white,clear,clear,clear,clear,clear,clear],
[   73,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   74,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[   75,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear]
]).

end_board([
[clear,   48,   49,   50,   51,   52,   53,   54,   55,   56,   57,   58],
[   65,black,white,white,white,black,white,clear,white,black,white,black],
[   66,clear,black,black,black,black,white,white,black,clear,white,black],
[   67,black,white,black,black,white,white,white,black,black,white,white],
[   68,white,white,white,white,black,black,white,black,white,clear,black],
[   69,white,black,black,white,white,black,black,black,white,black,white],
[   70,black,black,black,white,white,black,black,white,clear,white,black],
[   71,clear,white,white,black,black,clear,white,black,black,black,white],
[   72,black,white,black,white,white,black,black,clear,white,black,white],
[   73,black,white,clear,white,black,white,white,black,black,white,clear],
[   74,black,white,white,black,black,black,white,white,black,black,white],
[   75,clear,white,black,clear,white,clear,black,white,white,black,white]
]).

Values' description:
48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58 -> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75 -> A, B, C, D, E, F, G, H, I, J, K
black, white -> occupied square colors
clear -> unoccupied square

-----------------------------------------------------------------------------------
Game State Preview

The game visualization predicate, display\textunderscore game(GameState,Player), takes the current state of the game - a matrix (list of lists) - and passes it to write\textunderscore board.
This predicate operates in a recursive manner, calling write\textunderscore line on the Head of the matrix (1st row) before calling itself with the Tail of the matrix, repeating this process until it reaches its base case: the argument passed to it is an empty list.
The predicate write\textunderscore line translates each value of a list to its respective symbol and draws it in the SICStus terminal.

When it comes to the Player argument (a number) of the visualization predicate, its role is only to let the user know what is the player that is having the next turn (via the write\textunderscore player predicate), because unlike other games, in Taiji both players play the same pieces and don't have any data associated to themselves other than their number (and color).
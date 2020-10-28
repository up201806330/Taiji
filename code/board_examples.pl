
% Start State Board
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

% Intermediate State Board
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

% End State Board
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
% start state board
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

% intermediate state board
intermediate_board([
[black,white,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,black,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,white,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,white,clear,clear,clear,clear],
[clear,clear,black,white,white,black,black,clear,clear,clear,clear],
[clear,black,black,white,white,black,black,white,clear,clear,clear],
[clear,white,clear,clear,black,clear,white,black,clear,clear,clear],
[clear,clear,clear,clear,white,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear],
[clear,clear,clear,clear,clear,clear,clear,clear,clear,clear,clear]
]).

% end state board
end_board([
[black,white,white,white,black,white,clear,white,black,white,black],
[clear,black,black,black,black,white,white,black,clear,white,black],
[black,white,black,black,white,white,white,black,black,white,white],
[white,white,white,white,black,black,white,black,white,clear,black],
[white,black,black,white,white,black,black,black,white,black,white],
[black,black,black,white,white,black,black,white,clear,white,black],
[clear,white,white,black,black,clear,white,black,black,black,white],
[black,white,black,white,white,black,black,clear,white,black,white],
[black,white,clear,white,black,white,white,black,black,white,clear],
[black,white,white,black,black,black,white,white,black,black,white],
[clear,white,black,clear,white,clear,black,white,white,black,white]
]).
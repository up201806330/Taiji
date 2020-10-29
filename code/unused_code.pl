% ------ IN PROGRESS ------
    % repeat,
    %     write('Hi: '),
    %     read_line(String),
    %     (String = 'stop', !
    %     ; write('oh'),
    %     fail
    % ).
    %!,
    %write('Done').



% ------ UNUSED CODE ------ 

% translation(clear, CHAR) :- CHAR = '.'.
% translation(white, CHAR) :- CHAR = 'w'.
% translation(black, CHAR) :- CHAR = 'b'.


% display_game(GameState, Player):

% play :-
%     initial(GameState),
%     write_board(GameState),
%     start(GameState).


say_hi :-
    format("~p:", '[How r u]'),
    read_line(X),
    % leResto(ch, String),
    % write('hi '),
    % name(Nome, String),
    nl, format("~p:", X).
    % write(X).


% ---------------- AULA -----------------
% leNome(Prompt, Nome) :-
%     format("~p:", [Prompt]),
%     get0(ch), -> vai buscar tudo até ao enter
%     leResto(ch, String),
%     name(Nome, String).

% leResto(10, []).
% leResto(13, []).
% leResto(ch, [ch|Mais]) :-
%     get0(ch2),
%     leResto(ch2, Mais).


% play :-
%     tabuleiroInicial(Tab0),
%     assert(estado(1, Tab0)),
%     repeat,
%         retract(estado(Jogador, TabAtual)),
%         once (fazJogada(Jogador, TabAtual, ProximoJogador, ProximoTabuleiro)) ), once é para não ser usado em backtracking
%         assert(estado(ProximoJogador, ProximoTabuleiro)),
%         fimDeJogo,
%     mostraResultado.


% repeat.
% repeat :-
%     repeat.
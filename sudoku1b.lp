% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
% Domains
row(1..4).
col(1..4).
num(1..4).

% One number per cell
1 { sudoku(R,C,N) : num(N) } 1 :- row(R), col(C).

% Row constraints
:- row(R), num(N), 2 { sudoku(R,C,N) : col(C) }.

% Column constraints
:- col(C), num(N), 2 { sudoku(R,C,N) : row(R) }.

%subgrid constraints
subgrid(X,Y,G) :-
    row(X), col(Y),
    G = 1, X<=2, Y<=2.
subgrid(X,Y,G) :-
    row(X), col(Y),
    G = 2, X<=2, Y>2.
subgrid(X,Y,G) :-
    row(X), col(Y),
    G = 3, X>2, Y<=2.
subgrid(X,Y,G) :-
    row(X), col(Y),
    G = 4, X>2, Y>2.

% Given clues
sudoku(R,C,N) :- initial(R,C,N).

% Show answers
#show subgrid/3.

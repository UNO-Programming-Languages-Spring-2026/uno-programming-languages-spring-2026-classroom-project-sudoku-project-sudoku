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
grid(1..4).

% One number per cell
1 { sudoku(R,C,N) : num(N) } 1 :- row(R), col(C).

% Row constraints
:- row(R), num(N), 2 { sudoku(R,C,N) : col(C) }.

% Column constraints
:- col(C), num(N), 2 { sudoku(R,C,N) : row(R) }.

% Subgrid qualifiers
grid_of(R,C,G) :-
    row(R), col(C),
    G = 1, R<=2, C<=2.
grid_of(R,C,G) :-
    row(R), col(C),
    G = 2, R<=2, C>2.
grid_of(R,C,G) :-
    row(R), col(C),
    G = 3, R>2, C<=2.
grid_of(R,C,G) :-
    row(R), col(C),
    G = 4, R>2, C>2.

% Subgrid fills with sudoku values
subgridN(R,C,G,N) :-
    sudoku(R,C,N),
    grid_of(R,C,G).

% Subgrid single value constraint
:- grid(G), num(N),
    2 { subgridN(R,C,G,N) }.

% Subgrid final
subgrid(R,C,G) :-
    subgridN(R,C,G,N).

% Given clues
sudoku(R,C,N) :- initial(R,C,N).

% Show answers
#show sudoku/3.

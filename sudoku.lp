% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
% Domains
row(1..l).
col(1..l).
num(1..l).

%determine block size
blockSize(B) :- B*B=l.
:- not blockSize(_).

% One number per cell
1 { cell(R,C,N) : num(N) } 1 :- row(R), col(C).

% Row constraints
:- row(R), num(N), 2 { cell(R,C,N) : col(C) }.

% Column constraints
:- col(C), num(N), 2 { cell(R,C,N) : row(R) }.

% 3x3 block constraints
block(RB,CB) :- RB=1..3, CB=1..3.

:- block(RB,CB), num(N),
   2 { cell(R,C,N) :
        R = B*(RB-1)+1..B*RB,
        C = B*(CB-1)+1..B*CB }.

% Given clues
cell(R,C,N) :- initial(R,C,N).

% Show answers
#show sudoku/3.

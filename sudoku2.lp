% Domains
row(1..9).
col(1..9).
num(1..9).

% One number per sudoku
1 { sudoku(R,C,N) : num(N) } 1 :- row(R), col(C).

% Row constraints
:- row(R), num(N), 2 { sudoku(R,C,N) : col(C) }.

% Column constraints
:- col(C), num(N), 2 { sudoku(R,C,N) : row(R) }.

% 3x3 block constraints
block(RB,CB) :- RB=1..3, CB=1..3.

:- block(RB,CB), num(N),
   2 { sudoku(R,C,N) :
        R = 3*(RB-1)+1..3*RB,
        C = 3*(CB-1)+1..3*CB }.

% Given clues
sudoku(R,C,N) :- initial(R,C,N).

% Show answers
#show sudoku/3.

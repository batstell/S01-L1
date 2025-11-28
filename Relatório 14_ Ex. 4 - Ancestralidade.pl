% Mais fatos de genealogia
filho(cronos, urano).
filho(cronos, gaia).
filho(reia, urano).
filho(reia, gaia).

filho(afrodite, urano).
% (nascida da espuma, mas consideramos Urano como progenitor)

% Caso Base: A é ancestral de D se A é progenitor direto de D
ancestral(A, D) :-
    filho(D, A).

% Passo Recursivo: A é ancestral de D se A é progenitor de um
% intermediário Z E esse intermediário Z é ancestral de D
ancestral(A, D) :-
    filho(Z, A),
    ancestral(Z, D).

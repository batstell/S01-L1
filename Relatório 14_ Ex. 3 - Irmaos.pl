% Mais fatos sobre parentesco
filho(ares, zeus).
filho(ares, hera).
filho(hefesto, zeus).
filho(hefesto, hera).
filho(hebe, zeus).
filho(hebe, hera).

filho(apolo, zeus).
filho(apolo, leto).
filho(artemis, zeus).
filho(artemis, leto).

filho(hermes, zeus).
filho(hermes, maia).

filho(atena, zeus).
% Atena nasceu da cabeça de Zeus (sem mãe tradicional)

filho(afrodite, urano).
% Afrodite nasceu da espuma do mar

filho(persefone, zeus).
filho(persefone, demeter).

% Regra: irmaos_germanos
% A e B são irmãos germanos SE têm o mesmo pai E a mesma mãe
irmaos_germanos(A, B) :-
    filho(A, Pai),
    filho(A, Mae),
    filho(B, Pai),
    filho(B, Mae),
    Pai \= Mae,  % Pai e Mãe são diferentes
    A \= B.      % A e B são diferentes

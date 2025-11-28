% Base de conhecimento: fatos sobre os deuses
filho(hades, cronos).
filho(hades, reia).
filho(poseidon, cronos).
filho(poseidon, reia).
filho(zeus, cronos).
filho(zeus, reia).
filho(hera, cronos).
filho(hera, reia).
filho(demeter, cronos).
filho(demeter, reia).
filho(hestia, cronos).
filho(hestia, reia).

% Domínios associados aos deuses
dominio(zeus, ceu).
dominio(poseidon, mar).
dominio(hades, submundo).
dominio(hera, ceu).
dominio(demeter, terra).
dominio(hestia, lar).

% Divindades que habitam o Olimpo
habita_olimpo(zeus).
habita_olimpo(hera).
habita_olimpo(poseidon).
habita_olimpo(demeter).
habita_olimpo(hestia).
habita_olimpo(apolo).
habita_olimpo(artemis).
habita_olimpo(atena).
habita_olimpo(afrodite).
habita_olimpo(ares).
habita_olimpo(hefesto).
habita_olimpo(hermes).

% Regra: divindade_olimpica
% Um deus é divindade olímpica SE é filho de Cronos e Reia
% E tem domínio associado ao 'ceu', 'mar' ou 'submundo'
divindade_olimpica(Deus) :-
    filho(Deus, cronos),
    filho(Deus, reia),
    (dominio(Deus, ceu); dominio(Deus, mar); dominio(Deus, submundo)).

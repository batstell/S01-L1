% Domínios dos deuses (já definidos acima, expandindo aqui)
dominio(apolo, sol).
dominio(apolo, musica).
dominio(artemis, lua).
dominio(artemis, caca).
dominio(atena, sabedoria).
dominio(atena, guerra).
dominio(ares, guerra).
dominio(afrodite, amor).
dominio(hefesto, forja).
dominio(hermes, mensagens).

% Contar domínios de um deus
conta_dominios(Deus, Contador) :-
    findall(D, dominio(Deus, D), Lista),
    length(Lista, Contador).

% Regra: deus_maior
% Um deus é maior SE tem pelo menos 2 domínios E habita o Olimpo
deus_maior(Deus) :-
    conta_dominios(Deus, N),
    N >= 2,
    habita_olimpo(Deus).

% Query: Quem é(são) o(s) deus(es) maior(es)?
% ?- deus_maior(Deus).

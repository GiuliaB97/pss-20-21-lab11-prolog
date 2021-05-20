% ex 1.1 drop*(Elem , List, OutList)

%DropAny
%test: dropAny(10, [10,20,30,10], L).
dropAny(E, [E|T], T).
dropAny(E,[H|T], [H|L]):-dropAny(E, T, L).

%test: dropFirst(10, [10,20,30,10], L).
dropFirst(E, [E|T], T):-!.
dropFirst(E,[H|T], [H|L]):- dropFirst(E, T, L).

%test: dropLast(10, [10,20,30,10], L).
dropLast(E,[H|T], [H|L]):- dropLast(E, T, L),!.
dropLast(E,[E|T], L):- dropLast(E, T, L).
dropLast(E, [E|T], T).

%test: dropAll(10, [10,20,30,10], L).
dropAll(E,[E|T], L):- dropAll(E, T, L), !.
dropAll(E,[H|T], [H|L]):- dropAll(E, T, L).
dropAll(E, [E|T], T).
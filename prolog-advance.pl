% ex 1.1 drop*(Elem , List, OutList)

%DropAny
%test: dropAny(10, [10,20,30,10], L).
dropAny(E, [E|T], T).
dropAny(E,[H|T], [H|L]):-dropAny(E, T, L).

%dropFirst
%test: dropFirst(10, [10,20,30,10], L).
dropFirst(E, [E|T], T):-!.
dropFirst(E,[H|T], [H|L]):- dropFirst(E, T, L).

%dropLast
%test: dropLast(10, [10,20,30,10], L).
dropLast(E,[H|T], [H|L]):- dropLast(E, T, L),!.
dropLast(E,[E|T], L):- dropLast(E, T, L).
dropLast(E, [E|T], T).

%dropAll
%test: dropAll(10, [10,20,30,10], L).
dropAll(E,[E|T], L):- dropAll(E, T, L), !.
dropAll(E,[H|T], [H|L]):- dropAll(E, T, L).
dropAll(E, [E|T], T).

%2.1 fromList(+List,-Graph)
%test: fromList([10, 20, 30], [e(10, 20), e(20, 30)]).

fromList([_],[]).
fromList([H1,H2|T],[e(H1,H2)|L]):- fromList([H2|T],L).

%2.2 fromCircList						TO-DO
% fromCircList(+List,-Graph)
%fromCircList([10,20,30],[e(10,20),e(20,30),e(30,10)]).
fromCircList([H1|T],L):- append([H1|T],[H1],L2),fromList(L2,L).

%2.3 dropNode
% dropNode(+Graph, +Node, -OutGraph)
% drop all edges starting and leaving from a Node
% use dropAll defined in 1.1
%test: dropNode([e(1,2),e(1,3),e(2,3)],1,[e(2,3)]).
dropNode(G,N,O):- dropAll(G,e(N,_),G2), dropAll(G2,e(_,N),O).

%2.4 reaching
% reaching(+Graph, +Node, -List)
% all the nodes that can be reached in 1 step from Node
% possibly use findall, looking for e(Node,_) combined
% with member(?Elem,?List)
%test:reaching([e(1,2),e(1,3),e(2,3)],1,L). -> L/[2,3]
%test: reaching([e(1,2),e(1,2),e(2,3)],1,L). -> L/[2,2]).

%Advanced exerices
%2.5 anypath
% anypath(+Graph, +Node1, +Node2, -ListPath)
% a path from Node1 to Node2 if there are many path, they are showed 1-by-1
%test: anypath([e(1,2),e(1,3),e(2,3)],1,3,L).
%output: – L/[e(1,2),e(2,3)] e L/[e(1,3)]

%Implement it; suggestion:
%– a path from N1 to N2 exists if there is a e(N1,N2)
%– a path from N1 to N2 is OK if N3 can be reached from N1, and then there is a path from N2 to N3, recursively

%2.6 allreaching
%% allreaching(+Graph, +Node, -List)
% all the nodes that can be reached from Node
% Suppose the graph is NOT circular!
% Use findall and anyPath!
%test: allreaching([e(1,2),e(2,3),e(3,5)],1,[2,3,5]).

%2.7 grid-like nets
%During last lesson we see how to generate a gridlike network. Adapt that code to create a graph for the predicates implemented so far.
% Try to generate all paths from a node to another,limiting the maximum number of hops

%3 TicTacToes

% ex 1.1 dropAny(Elem,List,OutList)
%test: Yes: dropAny(3,[0,1,2,3,7], [0,1,2,7]).		No: dropAny( 3,[0,1,2,3,7], [0,1,2,3,7]).
dropAny(E, [H|T1], [H|T2]):-dropAny(E, T1, T2).
dropAny(E, [E|T], T).

% dropFirst(Elem,List,OutList)
%test: Yes: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,7,3]).		No: dropFirst( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).
dropFirst(E, [E|T], T):-!.
dropFirst(E, [H|T1], [H|T2]):-dropFirst(E, T1, T2).

% dropLast(Elem,List,OutList)
%test: Yes: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7]).		No: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).
dropLast(E, [H|T1], [H|T2]):-dropLast(E, T1, T2),!.
dropLast(E, [E|T], T).

% dropAll(Elem,List,OutList)
%test: Yes: dropAll( 3,[0,1,2,3,7,3], [0,1,2,7]).		No: dropLast( 3,[0,1,2,3,7,3], [0,1,2,3,7,3]).
dropAll(E, [H|T1], [H|T2]):-dropAll(E, T1, T2),!.
dropAll(E, [E|T], L):-dropAll(E, T, L),!.
dropAll(E, [E|T], T).

%2.1 fromList(+List,-Graph)
%test: fromList([10, 20, 30], [e(10, 20), e(20, 30)]).
fromList([_],[]).
fromList([H1,H2|T],[e(H1,H2)|L]):- fromList([H2|T],L).

%2.2 fromCircList(+List,-Graph)
%test: fromCircList([10,20,30],[e(10,20),e(20,30),e(30,10)]).
fromCircList([H1|T],L):- append([H1|T],[H1],L2),fromList(L2,L).

%2.3 % dropNode(+Graph, +Node, -OutGraph); drop all edges starting and leaving from a Node
%test dropNode([e(1,2),e(1,3),e(2,3)],1,[e(2,3)]).
dropNode(Graph, Node, OutGraph):-
	dropAll(Graph, e(N, _), TmpOutGraph),
	dropAll(TmpOutGraph, e(_, Node),OutGraph).

%2.4 % reaching(+Graph, +Node, -SuccessorList); all the nodes that can be reached in 1 step
%test: reaching([e(1,2),e(1,2),e(2,3)],1,[2,2]).
reaching(Graph,Node,SuccessorList):-
	findall(Successor, search(e(Node,Successor),Graph), SuccessorList).

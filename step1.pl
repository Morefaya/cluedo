man(X) :- X = marc; X = jean; X = jules; X = jacques; X = leon; X = herve; X = paul; X = loic; X = luc; X = gerard.

woman(X) :- X = anne; X = lisa; X = sylvie; X = julie; X = eve; X = betty; X = valerie.

mari_de(marc,anne).
mari_de(jules,lisa).
mari_de(leon,sylvie).
mari_de(paul,julie).
mari_de(loic,eve).

femme_de(X,Y) :- mari_de(Y,X).

enfant_de(X, mari_de(marc,anne)) :- X = jean; X = jules; X = leon.
enfant_de(X, mari_de(luc,betty)) :- X = lisa; X = loic; X = gerard.
enfant_de(X, mari_de(leon,sylvie)) :- X = herve; X = julie.
enfant_de(X, mari_de(loic,eve)) :- X = paul; X = valerie.


enfant_de(jacques,mari_de(jules,lisa)).
enfant_de(gerard,mari_de(luc,betty)).


beaupere_de(X,Y) :- 
	mari_de(Y,Z), enfant_de(Z,mari_de(X,_)).
beaupere_de(X,Y) :- 
	mari_de(Z,Y), enfant_de(Z,mari_de(X,_)).

bellemere_de(X,Y) :-
	mari_de(Y,Z), enfant_de(Z,mari_de(_,X)).
bellemere_de(X,Y) :-
	mari_de(Z,Y), enfant_de(Z,mari_de(_,X)).
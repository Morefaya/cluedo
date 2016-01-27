liste_maison([
		maison(_, _, _, _, _),
		maison(_, _, _, _, _),
		maison(_, _, _, _, _),
		maison(_, _, _, _, _),
		maison(_, _, _, _, _)]).

afficher_maisons([X|L]):- writeln(X), afficher_maisons(L).

appartient_a(X, [X|_]).
appartient_a(X, [_|L]) :- appartient_a(X, L).

est_a_gauche_de(A, B, [A, B | _]).
est_a_gauche_de(A, B, [_| Y]) :- est_a_gauche_de(B, A , Y).

est_voisin_de(A, B, [A, B | _]).
est_voisin_de(A, B, [B, A | _]).
est_voisin_de(A, B, [_| Y]) :- est_voisin_de(A, B, Y).

resoudre :-
		liste_maison(MAISONS),
		appartient_a(maison(rouge, anglais, _, _, _), MAISONS),
		appartient_a(maison(_, suedois, _, _, chien), MAISONS),
		appartient_a(maison(_, danois, the, _, _), MAISONS),
		est_a_gauche_de(maison(verte, _, _, _, _), maison(blanche, _, _, _, _), MAISONS),
		appartient_a(maison(verte, _, cafe, _, _), MAISONS),
		appartient_a(maison(_, _, _, pall_mall, oiseaux), MAISONS),
		appartient_a(maison(jaune, _, _, dunhill, _), MAISONS),
		MAISONS = [_, _, maison(_, _, lait, _, _)| _],
		MAISONS = [maison(_, norvegien, _, _, _)| _],
		est_voisin_de(maison(_, _, _, blend, _), maison(_, _, _, _, chat), MAISONS),
		est_voisin_de(maison(_, _, _, _, cheval), maison(_, _, _, dunhill, _), MAISONS),
		appartient_a(maison(_, _, biere, blue_master, _), MAISONS),
		appartient_a(maison(_, allemande, _, prince, _), MAISONS),
		est_voisin_de(maison(_, norvegien, _, _, _), maison(bleu, _, _, _, _), MAISONS),
		est_voisin_de(maison(_, _, _, blend, _), maison(_, _, eau, _, _), MAISONS),
		appartient_a(maison(_, _, _, _, poisson), MAISONS),
		afficher_maisons(MAISONS).

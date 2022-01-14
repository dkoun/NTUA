find_sim_5(X, Y):-  findall(M1, (extraCommonGenre(X,M1) ; veryCommonPlot(X,M1)), Z1A),list_to_set(Z1A, Z1),!,
                                            findall(M2, (member(M2, Z1), (commonLanguage(X,M2) ; commonCountry(X,M2))), Z2A),list_to_set(Z2A, Z2),!,
                                            findall(M3, (member(M3, Z2), (commonDirector(X,M3) ; veryCommonProduction(X,M3))), Z3A),list_to_set(Z3A, Z3),!,
                                            findall(M4, (member(M4, Z3), (sameStarActors(X,M4) ; sameFame(X,M4))), Z4A),list_to_set(Z4A, Z4),!,
                                            findall(M5, (member(M5, Z4), sameColor(X,M5), sameDuration(X,M5), sameEra(X,M5)), ZA),list_to_set(ZA, Z),!,
                                            member(Y, Z),
                                            X \= Y.

find_sim_4(X, Y):-  findall(M1, (veryCommonGenre(X,M1) ; moreCommonPlot(X,M1)), Z1A),list_to_set(Z1A, Z1),!,
                                            findall(M2, (member(M2, Z1), (commonLanguage(X,M2) ; commonCountry(X,M2))), Z2A),list_to_set(Z2A, Z2),!,
                                            findall(M3, (member(M3, Z2), (commonDirector(X,M3) ; moreCommonProduction(X,M3))), Z3A),list_to_set(Z3A, Z3),!,
                                            findall(M4, (member(M4, Z3), (moreStarActors(X,M4) ; sameFame(X,M4))), Z4A),list_to_set(Z4A, Z4),!,
                                            findall(M5, (member(M5, Z4), sameColor(X,M5), sameDuration(X,M5), sameEra(X,M5)), ZA),list_to_set(ZA, Z),!,
                                            member(Y, Z),
                                            X \= Y.

find_sim_3(X, Y):-  findall(M1, (moreCommonGenre(X,M1) ; moreCommonPlot(X,M1)), Z1A),list_to_set(Z1A, Z1),!,
                                            findall(M2, (member(M2, Z1), (commonLanguage(X,M2) ; commonCountry(X,M2))), Z2A),list_to_set(Z2A, Z2),!,
                                            findall(M3, (member(M3, Z2), (commonDirector(X,M3) ; lessCommonProduction(X,M3))), Z3A),list_to_set(Z3A, Z3),!,
                                            findall(M4, (member(M4, Z3), (lessStarActors(X,M4) ; sameFame(X,M4))), Z4A),list_to_set(Z4A, Z4),!,
                                            findall(M5, (member(M5, Z4), sameColor(X,M5), sameDuration(X,M5)), ZA),list_to_set(ZA, Z),!,
                                            member(Y, Z),
                                            X \= Y.

find_sim_2(X, Y):-  findall(M1, (moreCommonGenre(X,M1) ; lessCommonPlot(X,M1)), Z1A),list_to_set(Z1A, Z1),!,
                                            findall(M2, (member(M2, Z1), (commonLanguage(X,M2) ; commonCountry(X,M2))), Z2A),list_to_set(Z2A, Z2),!,
                                            findall(M3, (member(M3, Z2), lessStarActors(X,M3)), Z3A),list_to_set(Z3A, Z3),!,
                                            findall(M4, (member(M4, Z3), sameColor(X,M4), sameDuration(X,M4)), ZA),list_to_set(ZA, Z),!,
                                            member(Y, Z),
                                            X \= Y.

find_sim_1(X, Y):-  findall(M1, (lessCommonGenre(X,M1) ; lessCommonPlot(X,M1)), Z1A),list_to_set(Z1A, Z1),!,
                                            findall(M2, (member(M2, Z1), lessStarActors(X,M2)), Z2A),list_to_set(Z2A, Z2),!,
                                            findall(M3, (member(M3, Z2), sameDuration(X,M3)), ZA),list_to_set(ZA, Z),!,
                                            member(Y, Z),
                                            X \= Y.


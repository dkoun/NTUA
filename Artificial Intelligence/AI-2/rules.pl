extraCommonGenre(X,Y) :- findall(M1, genre(X,M1),Z1),!,bagof(M2, genre(Y,M2),Z2),
                                             intersection(Z1, Z2, Z),
                                             length(Z, W), W >= 4, X \= Y.

veryCommonGenre(X,Y) :- findall(M1, genre(X,M1),Z1),!,bagof(M2, genre(Y,M2),Z2),
                                            intersection(Z1, Z2, Z),
                                            length(Z, W), W >= 3, X \= Y.

moreCommonGenre(X,Y) :- findall(M1, genre(X,M1),Z1),!,bagof(M2, genre(Y,M2),Z2),
                                            intersection(Z1, Z2, Z),
                                            length(Z, W), W >= 2, X \= Y.

lessCommonGenre(X,Y) :- findall(M1, genre(X,M1),Z1),!,bagof(M2, genre(Y,M2),Z2),
                                            intersection(Z1, Z2, Z),
                                            length(Z, W), W >= 1, X \= Y.

veryCommonPlot(X,Y) :- findall(M1, plotKeyword(X,M1),Z1),!,bagof(M2, plotKeyword(Y,M2),Z2),
                                           intersection(Z1, Z2, Z),
                                           length(Z, W), W >= 7, X \= Y.

moreCommonPlot(X,Y) :- findall(M1, plotKeyword(X,M1),Z1),!,bagof(M2, plotKeyword(Y,M2),Z2),
                                           intersection(Z1, Z2, Z),
                                           length(Z, W), W >= 5, X \= Y.

lessCommonPlot(X,Y) :- findall(M1, plotKeyword(X,M1),Z1),!,bagof(M2, plotKeyword(Y,M2),Z2),
                                           intersection(Z1, Z2, Z),
                                           length(Z, W), W >= 3, X \= Y.

commonLanguage(X,Y) :- language(X,Z), language(Y,Z), X \= Y.

legendaryFame(X) :- popularity(X, M1), M1 >= 90, 
                                        voteAverage(X, M2), M2 >= 8,
                                        usersVoted(X, M3), M3 >= 5000,
                                        grossRevenue(X, M4), M4 >= 50000000.

greatFame(X) :- popularity(X, M1), M1 >= 65,
                                    voteAverage(X, M2), M2 >= 6.8,
                                    usersVoted(X, M3), M3 >= 3500,
                                    grossRevenue(X, M4), M4 >= 15000000, not(legendaryFame(X)).

mediumFame(X) :- popularity(X, M1), M1 >= 40,
                                     voteAverage(X, M2), M2 >= 5.5,
                                     usersVoted(X, M3), M3 >= 1000,
                                     grossRevenue(X, M4), M4 >= 5000000,
                                     not(legendaryFame(X)), not(greatFame(X)).

lowFame(X) :- findall(M1, legendaryFame(M1), Z1),
                                  findall(M2, greatFame(M2), Z2),
                                  findall(M3, mediumFame(M3), Z3),
                                  union(Z1, Z2, Z4),union(Z4, Z3, Z5),
                                  findall(M, director(M,_), Z6),
                                  list_to_set(Z6, Z7), subtract(Z7, Z5, Z),!,
                                  member(X,Z).

sameFame(X,Y) :- ((legendaryFame(X), legendaryFame(Y)) ;
                                       (greatFame(X), greatFame(Y)) ;
                                       (mediumFame(X), mediumFame(Y)) ;
                                       (lowFame(X), lowFame(Y))), X \= Y.

veryCommonProduction(X,Y) :- findall(M1, productionCompany(X,M1),Z1),!,bagof(M2, productionCompany(Y,M2),Z2),
                                                 intersection(Z1, Z2, Z),
                                                 length(Z, W), W >= 4, X \= Y.

moreCommonProduction(X,Y) :- findall(M1, productionCompany(X,M1),Z1),!,bagof(M2, productionCompany(Y,M2),Z2),
                                                 intersection(Z1, Z2, Z),
                                                 length(Z, W), W >= 2, X \= Y.

lessCommonProduction(X,Y) :- findall(M1, productionCompany(X,M1),Z1),!,bagof(M2, productionCompany(Y,M2),Z2),
                                                 intersection(Z1, Z2, Z),
                                                 length(Z, W), W >= 1, X \= Y.

shortFilm(X) :- duration(X, Y), Y =< 40.

mediumFilm(X) :- duration(X, Y), Y > 40, Y =< 90.

largeFilm(X) :- duration(X, Y), Y > 90.

sameDuration(X,Y) :- ((shortFilm(X), shortFilm(Y)) ;
                                          (mediumFilm(X), mediumFilm(Y)) ;
                                          (largeFilm(X), largeFilm(Y))), X \= Y.

veryOldFilm(X) :- releaseYear(X, Y), Y =< 1935.

oldFilm(X) :- releaseYear(X, Y), Y > 1935, Y =< 1960.

intermediateFilm(X) :- releaseYear(X, Y), Y > 1960, Y =< 1990.

newFilm(X) :- releaseYear(X, Y), Y > 1990, Y =< 2010.

veryNewFilm(X) :- releaseYear(X, Y), Y > 2010.

sameEra(X,Y) :- ((veryOldFilm(X), veryOldFilm(Y)) ;
                                     (oldFilm(X), oldFilm(Y)) ;
                                     (intermediateFilm(X), intermediateFilm(Y)) ;
                                     (newFilm(X), newFilm(Y)) ;
                                     (veryNewFilm(X), veryNewFilm(Y))), X \= Y.

commonCountry(X,Y) :- country(X,Z), country(Y,Z), X \= Y.

commonDirector(X,Y) :- director(X,Z), director(Y,Z), X \= Y.

sameStarActors(X,Y) :- findall(M1, playsIn(X,M1),Z1),!,bagof(M2, playsIn(Y,M2),Z2),
                                           intersection(Z1, Z2, Z),
                                           length(Z, W), W =:= 3, X \= Y.

moreStarActors(X,Y) :- findall(M1, playsIn(X,M1),Z1),!,bagof(M2, playsIn(Y,M2),Z2),
                                           intersection(Z1, Z2, Z),
                                           length(Z, W), W >= 2, X \= Y.

lessStarActors(X,Y) :- findall(M1, playsIn(X,M1),Z1),!,bagof(M2, playsIn(Y,M2),Z2),
                                           intersection(Z1, Z2, Z),
                                           length(Z, W), W >= 1, X \= Y.

black_and_white(X) :- plotKeyword(X, 'black and white') ; plotKeyword(X, 'black and white scene') ; 
                                          (releaseYear(X, T), T =< 1950).

color(X) :- findall(M1, plotKeyword(M1, 'black and white'), Z1), 
                                findall(M2, plotKeyword(M2, 'black and white scene'), Z2), 
                                union(Z1, Z2, Z3), findall(M3, plotKeyword(M3,_), Z4),
                                list_to_set(Z4, Z5), subtract(Z5, Z3, Z),!, 
                                member(X, Z), releaseYear(X, T), T > 1950.

sameColor(X,Y) :- (color(X), color(Y)) ;
                                      (black_and_white(X), black_and_white(Y)),
                                      X \= Y.


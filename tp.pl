partido(frank,rojo).
partido(claire,rojo).
partido(garrett,azul).
partido(jackie,amarillo).
partido(linda,azul).
partido(catherine,rojo).
partido(seth,amarillo).
partido(heather,amarillo).

edad(frank,50).
edad(claire,52).
edad(garrett,64).
edad(peter,26).
edad(jackie,38).
edad(linda,30).
edad(catherine,59).
anioNacio(heather,1969).

sePostula(azul, buenosAires).
sePostula(azul, chaco).
sePostula(azul, tierraDelFuego).
sePostula(azul, sanLuis).
sePostula(azul, neuquen).
sePostula(azul, buenosAires).

sePostula(rojo, buenosAires).
sePostula(rojo, santaFe).
sePostula(rojo, tierraDelFuego).
sePostula(rojo, cordoba).
sePostula(rojo, chubut).
sePostula(rojo, sanLuis).

sePostula(amarillo, chaco).
sePostula(amarillo, formosa).
sePostula(amarillo, salta).
sePostula(amarillo, santaCruz).
sePostula(amarillo, laPampa).
sePostula(amarillo, corrientes).
sePostula(amarillo, misiones).
sePostula(amarillo, buenosAires).

cantidadHabitantes(buenosaires, 15355000 ).
cantidadHabitantes(chaco, 1143201).
cantidadHabitantes(tierraDelFuego, 160720 ).
cantidadHabitantes(sanLuis, 489255).
cantidadHabitantes(neuquen, 637913).
cantidadHabitantes(santaFe, 3397532).
cantidadHabitantes(cordoba, 3567654).
cantidadHabitantes(chubut, 577466).
cantidadHabitantes(formosa, 527895).
cantidadHabitantes(tucuman, 1687305).
cantidadHabitantes(salta, 1333365).
cantidadHabitantes(santaCruz, 273964).
cantidadHabitantes(laPampa, 349299).
cantidadHabitantes(corrientes, 992595).
cantidadHabitantes(misiones, 1189446).

intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).


 
% Ejercicio 3
compite(Candidato,Provincia):- partido(Candidato, Color), sePostula(Color,Provincia).

mismoPartido(Candidato1, Candidato2):- partido(Candidato1, Color1), partido(Candidato2,Color2), Color1==Color2.

leGanaA(Candidato1, Candidato2, Provincia):- compite(Candidato1,Provincia).
leGanaA(Candidato1, Candidato2, Provincia):- compite(Candidato1,Provincia), not(compite(Candidato2, Provincia)).
leGanaA(Candidato1, Candidato2, Provincia):- compite(Candidato1,Provincia), compite(Candidato2,Provincia), mismoPartido(Candidato1,Candidato2).
leGanaA(Candidato1, Candidato2, Provincia):- compite(Candidato1,Provincia), compite(Candidato2,Provincia), partido(Candidato1,Color1), 
partido(Candidato2,Color2), intencionDeVotoEn(Provincia,Color1,Intencion1), intencionDeVotoEn(Provincia,Color2,Intencion2), not(Intencion1 < Intencion2).

% Punto 4
esElMasJoven(Candidato):-
  edad(Candidato,Edad1), partido(Candidato,Partido)
  forall((edad(Persona,Edad2),partido(Persona,Partido)),Edad2>Edad1).
elGranCandidato(Candidato) :- 
  forall(compite(Candidato,Provincia),leGanaA(Candidato,_,Provincia)),
  esElMasJoven(Candidato).
  
% Punto 6
promete(azul,construir([edificio(1000,hospital),edificio(100,jardin),edificio(5,escuela)])).
promete(amarillo,construir([edificio(100,hospital),edificio(1,universidad),edificio(200,comisaria)])).
promete(rojo,nuevosPuestosDeTrabajo(800000)).
promete(amarillo,nuevosPuestosDeTrabajo(10000)).
promete(azul,inflacion(2,4)).
promete(amarillo,inflacion(1,15)).
promete(rojo,inflacion(10,30)).

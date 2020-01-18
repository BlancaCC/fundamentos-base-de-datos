-- Base de datos sobre baloncesto
-- pag 24 del pdf

-- Equipos
CREATE TABLE Equipos (
codE varchar2(3) NOT NULL,
nombreE varchar2(5) NOT NULL,
localidad varchar2(5) NOT NULL,
entrenador varchar2(5) NOT NULL,
fecha DATE NOT NULL,

PRIMARY KEY (codE)

);


CREATE TABLE Jugadores (
codJ VARCHAR2(3) NOT NULL,
codE  REFERENCES Equipos (codE),
nombreJ VARCHAR2(10) NOT NULL,

PRIMARY KEY (codJ), 

	
);


CREATE TABLE Encuentros (

ElLocal CONSTRAINT ElLocal_clave_externa_equipos
	REFERENCES Equipos(codE),
ElVisitante CONSTRAINT ElVisitante_clave_externa_equipos
	REFERENCES Equipos(codE),
	
fecha DATE,
pLocal INT DEFAULT 0, 
pVisitante INT DEFAULT 0
	   CONSTRAINT puntuacion_positiva CHECK (pLocal >= 0 and pVisititante >= 0), -- mirar si se puede declarar aquí tambien la de pLocal 
CONSTRAINT clave_primaria PRIMARY KEY (ELocal, EVisitante), 


	
);

-- LA RESTRICCIÓN ES QEU ELLOCAL Y EL VISITANTE SON CLAVE EXTERNA DE LA TABLA ENCUENTROS 
CREATE TABLE Faltas (
codJ REFERENCES Jugadores (codJ),
ELocal REFERENCES Equipos (codE),
EVisitante REFERENCES Equipos (codE),

FOREING KEY (ELocal, Evisitante)
	REFERENCES Encuentros (Elocal, EVisitante),

num NUMBER(1)
    CONSTRAINT faltas_por_defecto DEFAULT 0
    CONSTRAINT faltas_entre CHECK ( num >= 0 and 5<= num),
    
);

-- Añadir constraint, datos y atributos a una tabla 

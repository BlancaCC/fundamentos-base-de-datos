-- Base de datos sobre baloncesto
-- pag 24 del pdf

-- Equipos
DROP TABLE Equipos;
drop table Jugadores;

CREATE TABLE Equipos (
codE char(3) NOT NULL,
nombreE varchar2(30) NOT NULL,
localidad varchar2(30) NOT NULL,
entrenador varchar2(30) NOT NULL,
fecha_crea DATE NOT NULL,

PRIMARY KEY (codE)
);

DESCRIBE Equipos;

insert into Equipos ( codE, nombreE, localidad, entrenador, fecha_crea)
    values ( '1','e1','grx','Paca',SYSDATE-1)
    ;
insert into Equipos ( codE, nombreE, localidad, entrenador, fecha_crea)
values ('123','uenismos','Granada', 'Casimiro',to_Date('10-04-12','dd-mm-yy'));

insert into Equipos select * from opc.equipos;
select * from opc.equipos;
select * from equipos;
describe opc.equipos;



-- No nulo nombreJ, ni el equipo al  que pertenece
describe opc.jugadores;
CREATE TABLE Jugadores (
codJ char(3) PRIMARY KEY,
codE  REFERENCES Equipos (codE),
nombreJ VARCHAR2(30) NOT NULL
);

insert into jugadores select * from opc.jugadores;

describe Jugadores;
describe Equipos;
select * from jugadores;


CREATE TABLE Encuentros (

ElLocal CONSTRAINT ElLocal_clave_externa_equipos
	REFERENCES Equipos(codE),
ElVisitante CONSTRAINT ElVisitante_clave_externa_equipos
	REFERENCES Equipos(codE),
	
fecha DATE,
pLocal INT DEFAULT 0, 
pVisitante INT DEFAULT 0
	   CONSTRAINT puntuacion_positiva CHECK (pLocal >= 0 and pVisititante >= 0), -- mirar si se puede declarar aquí tambien la de pLocal 
CONSTRAINT clave_primaria PRIMARY KEY (ELocal, EVisitante)
	
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

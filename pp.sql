-- Para compilar este archivo se se utiliza:
-- START u:\FBD\pp.sql

CREATE TABLE prueba3(
	cad1 char(8),
	num int);

-- veamos el contenido de la tabla 

DESCRIBE prueba3; 

-- creación más compleja de tablas 

CREATE TABLE plantilla( 
dni varchar2(9),
nombre varchar2(15),
estadocivil varchar2(10)
	CHECK(estadocivil in ('soltero', 'casado', 'divorciado', 'viudo')),
fechaalta date, 
PRIMARY KEY (dni)
);


describe plantilla;

create table serjefe(
dnijefe REFERENCES plantilla(dni),
dnitrabajador REFERENCES plantilla(dni),
PRIMARY KEY (dnitrabajador)
);

describe serjefe;
 
-- añadimos un nuevo atributo   

ALTER TABLE plantilla ADD( fechabaja DATE); 

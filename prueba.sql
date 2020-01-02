CREATE TABLE plantilla( 
dni varchar(9),
nombre varchar(15),
estadocivil varchar(10)
CHECK(estadocivil in ('soltero', 'casado', 'divorciado', 'viudo')),
fechaalta date, 
PRIMARY KEY (dni)
);

alter table plantilla add ( fechabaja date);


CREATE TABLE serjefe(

dniTrabajador REFERENCES 
PRIMARY KEY (dnitrabajador)
);


--dniJefe varchar (10) CONSTRAINT REFERENCES plantilla(dni),

CREATE TABLE proveedor(
codpro VARCHAR(3) CONSTRAINT codpro_no_nulo NOT NULL
	CONSTRAINT codpro_clave_primaria PRIMARY KEY,
nompro VARCHAR(30) CONSTRAINT nompro_no_nulo NOT NULL,
status NUMBER CONSTRAINT status_entre_1_y_10
	CHECK (status>=1 and status<=10),
ciudad VARCHAR(15)
);

 

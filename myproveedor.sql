--CREATE TABLE proveedor(
 --      codpro VARCHAR(3) ,--CONSTRAINT codpro_no_nulo NOT NULL
--       	      CONSTRAINT codpro_clave_primaria PRIMARY KEY,
--       nompro VARCHAR(30) CONSTRAINT nompro_no_nulo NOT NULL,
    --   status NUMBER CONSTRAINT status_entre_1_y_10
      -- 	      CHECK(status>= 1 and status<=10),
--	ciudad VARCHAR(15)
--);
--DROP TABLE  proveedor;

CREATE TABLE proveedor(
       codpro VARCHAR(3)  NOT NULL, 
       	      CONSTRAINT codpro_clave_primaria PRIMARY KEY (codpro),

	nompro VARCHAR(30)  NOT NULL,
	status INT CONSTRAINT status_entre_1_y_10
	       CHECK (status>=1 and status<=10),
	ciudad VARCHAR(15)
      	      
       
      
);
DESCRIBE proveedor;
DROP TABLE  proveedor;
     

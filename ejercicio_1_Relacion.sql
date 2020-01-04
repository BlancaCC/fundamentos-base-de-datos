-- EJERCICIOS RELACIÓN CÁLCULO Y ÁLGEBRA RELACIONA 
select table_name from user_tables; 
describe VENTAS;
DESCRIBE opc.VENTAS;

-- 1A
(SELECT  distinct codpro, codpj from opc.VENTAS) order by (codpj) ; -- mostramos todos, debería de salir S1,S2,s4,S3

select DISTINCT  codpro from opc.VENTAS spj WHERE spj.codpj like 'J1';

--1C nombre piezas, proveedores y proyectos que se encuentran en la misma ciudad 

-- versión natural join 
select DISTINCT s.nompro, p.nompie, j.nompj from 
OPC.PROVEEDOR s NATURAL JOIN 
( OPC.PIEZA p natural join OPC.PROYECTO j); 

-- version join on 

select distinct s.nompro, p.nompie, j.nompj from 
OPC.PROVEEDOR s join 
    ( OPC.PIEZA p join OPC.PROYECTO j
    on p.ciudad = j.ciudad )
ON p.ciudad = s.ciudad ;


--versión from 
SELECT distinct s.nompro, j.nompj, p.nompie
FROM OPC.proveedor s, OPC.proyecto j, OPC.pieza p
WHERE s.ciudad = j.ciudad and j.ciudad = p.ciudad;

--select DiSTINCT s.nompro, j.nompj, p.nompie 
--from OPC.PIEZA p, 
 --   (select s.ciudad, s.nompro, j.nompj from OPC.PROVEEDOR s, OPC.PROYECTO j where s.ciudad=j.ciudad)
--WHERE p.ciudad = s.ciudad;

-- EJERCICIO D: nombre de las piezas suministradas por proveedores de París   

SELECT p.nompie 
FROM OPC.pieza NATURAL JOIN (
    OPC.venta NATURAL JOIN (
        SELECT * 
        FROM OPC.proveedor 
        WHERE ciudad LIKE 'Londres'
    )
); 
            



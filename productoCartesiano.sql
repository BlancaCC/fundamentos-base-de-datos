-- eje 3.13 
select  distinct x.nompro,y.nompro from opc.proveedor x, opc.proveedor y 
--select x.nompro, y.nompro from opc.proveedor x, opc.proveedor y 
    --where (not (x.codpro = y.codpro)) and (not (x.ciudad = y.ciudad)) 
    where x.codpro != y.codpro and x.ciudad != y.ciudad;
--describe opc.proveedor;

-- selección natural  

select nompro, cantidad 
from opc.proveedor NATURAL JOIN (SELECT * FROM opc.ventas where cantidad > 800);

-- eje 3.15 Toda las piezas vendidas por proveedores de madrid  


--(select v.nompie from  opc.ventas v join

--(select p.codpro from opc.proveedor p
  --  where p.ciudad='Madrid'
--)
--on ( p.codpro = v.codpro);

Describe DICTIONARY;
select * from dictionary where table_name like '%INDEX%'; 
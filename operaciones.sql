select ciudad from opc.proyecto; -- muestra contenido repetido 
select distinct ciudad from opc.proyecto;
describe ventas;
-- ejercicio 3.2
select codpro from opc.proveedor;

-- eje 3.3
describe opc.pieza;
select * from opc.pieza;
select codpie,nompie from opc.pieza 
where (color='Rojo' or color='Gris') and ciudad='Madrid';

-- eje 3.4
describe opc.ventas;
select * from opc.ventas 
    where cantidad>= 200 and cantidad <= 300; 
    
-- eje 3.5 churro 

select * from opc.pieza 
    where nompie like 'T%' or nompie like 't%';
    
-- eje 3.6

select table_name  from all_tables
where table_name like upper('%ventas');
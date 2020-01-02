describe proveedor;
select table_name FROM user_tables;
describe prueba2;
insert into prueba2(cad1,num)
    values('hola',1231);
    
    select * from prueba2;
    
--delete from prueba2;
update prueba2
set num = 32 where cad1='hola';
select * from prueba2;

select * from opc.ventas;
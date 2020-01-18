DESCRIBE ventas;
DESCRIBE opc.ventas;

insert into proyecto (select * from opc.proyecto);
insert into  pieza(select * from opc.pieza)
;
insert into proveedor( select * from opc.proveedor);
select * from proveedor;

insert into ventas 
(
select * from opc.ventas
);
select * from opc.ventas;

select * from ventas; 

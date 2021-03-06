-- 3.46
-- No necesita el distinct, le hecha una mano al optimizador pero no sería necesario 
SELECT codpro
FROM proveedor pro
WHERE NOT EXISTS(
      (SELECT DISTINCT codpie FROM ventas WHERE ventas.codpie='S1')
      MINUS
      select DISTINCT codpie FROM ventas where ventas.codpie=pro.codpie)
);


-- 3.47

SELECT codpro, SUM(cantidad)
FROM ventas pro
WHERE NOT EXISTS(
(SELECT DISTINCT codpie FROM ventas WHERE ventas.codpie='S1')
MINUS
(SELECT DISTINCT codpie FROM ventas WHERE ventas.codpro=pro.codpie)
)
GROUP BY(codpro); 


-- 3.48
SELECT *
FROM proyecto
WHERE not exists(
      select v.codpro from ventas v where v.codpie='P3'
      MINUS 
      select v1.codpro from ventas v1 where v1.codpj=proyecto.codpj
);


-- 3.49
-- MIRAR EL DISTINCT, EL IN TE LO AHORRA
-- v1 con subconsulta 
SELECT avg(cantidad)
FROM  (select distinct v.codpro from ventas v  WHERE  v.codpie='P3') p, ventas v1
      where p.codpro=v1.codpro;

-- v2 sin subconsulta (aquí hay el mismo problema de arriba no poner el disting
SELECT avg(cantidad)
WHERE v1.codpie='P3' and v1.codpro


-- 3.50

select index_name, table_name, table_owner from user_indexes; 

-- 3.51

describe ventas; -- la idea es sacar esta información

select column_name NOMBRE, nullable nulo,  data_type Tipo
from user_tab_columns
where table_name='VENTAS';

-- 3.52

select codpro, avg(cantidad), to_char(fecha, 'yyyy')
from ventas
group by codpro, to_char(fecha, 'yyyy')
order by codpro, to_char(fecha, 'yyyy')

-- 3.53
-- que venten exactamente un pieza roja


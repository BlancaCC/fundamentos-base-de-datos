-- 3.24 Encontra los códigos de las pieza suministradas a todos los proyectos loaclizados en Londres

-- versión álgebra

-- versión cálculo

SELECT v.codpie
FROM ventas v
WHERE NOT EXISTS (
      SELECT j.codpj
      FROM  proyectos j
      WHERE NOT EXISTS (
      	    SELECT w.codpie
	    FROM ventas w
	    WHERE
		j.cidudad LIKE 'Londres' AND
		w.codpie = v.codpie AND
		j.codpj = w.codpj
	)
);

-- versión mixta cálculo y álgebra

SELECT v.codpie
FROM ventas v
WHERE NOT EXISTS (
      (SELECT DISTINCT codpj FROM proyectos WHERE ciudad LIKE 'Londres')
      MINUS
      (SELECT DISTINCT codpj FROM ventas WHERE codpie = v.codpie)
);


-- 3.25 Proveedores que envían piezas procedents de todas las ciudades donde hay un proyecto

-- creo vista para la relación proveedor ciudades donde recibe 

CREATE VIEW proveedorCiudad (codpro, ciudad) AS
SELECT codpro, ciudad
FROM ventas NATURAL JOIN piezas;

-- versión mixta
   -- idea subyaciente COGER  proveedores CANDIDATOS para los cuales el conjunto de TODAS las ciudades MENOS LAS SUYAS sea VACÍO 

SELECT v.codpro
FROM prooveedorCiudad v
WHERE NOT EXISTS (
      (SELECT DISTINCT ciudades FROM proyectos)
      MINUS
      (SELECT DISTINCT w.ciudades
      FROM proveedorCiudad w
      WHERE w.codpro = v.codpie      
      )
);

-- versión de cálculo
 -- idea subyaciente: no existe CONDICIÓN para la cual NO EXISTE OTRO elemento del candidato que la satifaga

SELECT v.codpro
FROM proveedorCiudad v
WHERE NOT EXISTS (
      SELECT *
      FROM proyectos p
      WHERE NOT EXISTS (
      	    SELECT *
	    FROM proveedorCiudad w
	    WHERE w.codpro = v.codpro AND
	    	  w.ciudad = p.ciudad 
      )
);

-- 3.26 envios con más de 1000 unidades

SELECT count(*) FROM ventas WHERE cantidad > 10000;

-- 3.27 Mostar el máximo peso

SELECT max(peso) FROM ventas;

-- 3.27 Mostrar código de pieza de máximo peso

SELECT codpie
FROM (SELECT codpie,  max(peso) FROM ventas)
;


-- 3.30 Muestra el código de los proveedores que han hecho más de 3 envíos direntes

SELECT codpro
FROM ventas v
WHERE 3 <  SELECT COUNT(*) FROM ventas v where v.codpro = w.codpro;



--Ejercicio 3.31 Mostrar la media de las cantidades vendidas por cada código de pieza junto con su nombre.


SELECT codpro, avg(vantidad) FROM VENTAS GROUP BY ( codpro);

--Ejercicio 3.32 Encontrar la cantidad media de ventas de la pieza ’P1’ realizadas por cada proveedor.
SELECT codpro , avg( cantidad) FROM ventas where codpie Like 'P1' GROUP BY codpro;

-- Ejercicio 3.33 Encontrar la cantidad total de cada pieza enviada a cada proyecto.

SELECT codpj, count(*) FROM VENTAS GROUP BY codpj;

-- Ejemplo 3.22 Mostrar la media de unidades vendidas de la pieza ’P1’ realizadas por cada proveedor, indicando solamente la información de aquellos proveedores que han hecho entre 2 y 10 ventas.

SELECT codpro, codpie,  AVG(cantidad)
FROM ventas
WHERE codpi LIKE 'P1'
GROUP BY (codpro, codpie)
HAVING count(*)  BETWEEN 2 and 10

-- Ejemplo 3.23 Encuentra los nombres de proyectos y cantidad media de piezas que recibe por proveedor

SELECT v.codpro, j.nompj, AVG(v.cantidad)
FROM ventas v, proyecto j
WHERE v.codpj = j.codpj
GROUP BY(v.codpro, j.proyecto)

-- Ejercicio 3.35 Mostrar los nombres de proveedores tales que el total de sus ventas superen la cantidad de 1000 unidades.

SELECT s.nompro
FROM ventas v, proveedores s
WHERE v.codpro = s.codpro
GROUP BY (v.codpro)
HAVING sum(v.cantidad) > 1000;


-- Ejemplo 3.24 Mostrar el proveedor que más ha vendido en total.

SELECT codpro, sum(cantidad)
FROM ventas
GROUP BY codpro
HAVING  count(cantidad) = (
	SELECT  max( sum(v.cantidad))
	FROM ventas v
	GROUP BY v.codpro
	); 

-- Ejercicio 3.36 Mostrar la pieza que más se ha vendido en total.


SELECT codpie
FROM ventas
GROUP BY codpie
HAVING sum(cantidad) = (
       SELECT max(sum(v.cantidad))
       FROM ventas v
       GROUP BY v.codpie
);

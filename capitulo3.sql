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



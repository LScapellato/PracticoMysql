use domadoresagremiados;

-- 1 Cantidad de Domadores

SELECT 
    COUNT(cuil) AS Total_Domadores
FROM
    domadores;


-- 2  Cantidad de domadores con al menos un seguidor
-- 2.1 Opcion
SELECT 
    COUNT(DISTINCT seguido_cuil) AS Domadores_Seguidos
FROM
    seguimiento;

-- 2.2 Quien sigue a quién 
SELECT 
    I.nombre_y_apellido,
    GROUP_CONCAT(DISTINCT d.nombre_y_apellido
        SEPARATOR ', ') AS SEGUIDORES
FROM
    seguimiento
        INNER JOIN
    domadores AS I ON I.cuil = seguido_cuil
        INNER JOIN
    domadores d ON d.cuil = sequidor_cuil
GROUP BY seguido_cuil;




SELECT DISTINCT
    nombre_y_apellido
FROM
    (SELECT DISTINCT
        (seguido_cuil)
    FROM
        seguimiento) AS seguidos
        NATURAL JOIN
    domadores ;   

-- 3 Cantidad de Domadores que no tienen seguidores

use domadoresagremiados;
SELECT 
    COUNT(nombre_y_apellido) AS domadores_sin_seguidores
FROM
    domadores
        LEFT JOIN
    seguimiento ON cuil = sequidor_cuil
WHERE
    seguido_cuil IS NULL;
 
-- 4  Cantidad de Domadores que operan en la ciudad de Córdoba.

USE domadoresagremiados;

SELECT 
    COUNT(domadores.cuil) AS Domadores_en_Córdoba
FROM
    ciudades
        INNER JOIN
    domadores ON ciudades.id_gremio = domadores.id_gremio
WHERE
    ciudad = 'Córdoba';
    
    
    -- 5 Cantidad de Misiones que pertenezcan al Gremio “DDITF” (Isla Grande de Tierra del Fuego)
-- 5 a - Opcion por cuit de Gremio

SELECT count(misiones.idmision) as Misiones_DDITF FROM misiones
WHERE misiones.id_gremio like '30-55555555-5';

-- 5 b - Opcion por Nombre Gremio

SELECT COUNT(idmision) AS Misiones_DDITF
from misiones
INNER JOIN gremios on cuit = id_gremio
WHERE gremios.nombre ="DDITF" ;

-- 6. Cantidad de Misiones que refieran a un “Chupacabras”.


SELECT 
    COUNT(idmision) AS Misiones_Chupacabras
FROM
    misiones
        INNER JOIN
    monstruo_mision ON (id_mision , monstruo_mision.id_gremio) = (idmision , misiones.id_gremio)
        INNER JOIN
    monstruos ON monstruos.nombre = id_monstruo
WHERE
    tipo = 'Chupacabras';

-- 7. Cantidad de Misiones que pertenezcan a un gremio que opere en la ciudad de Córdoba.
SELECT 
    COUNT(idmision) AS Misiones_en_Córdoba
FROM
    misiones
        INNER JOIN
    ciudades ON ciudades.id_gremio = misiones.id_gremio
WHERE
    ciudades.ciudad = 'Córdoba';

-- 8. Todos los datos de todos los Krakens no domesticados 

SELECT 
    gremios.nombre AS Nombre_Gremio,
    monstruos.nombre AS Nombre_Monstruo,
    monstruos.energia_interior,
    S.recompensa,
    S.desc_cuerpo
FROM
    monstruos
        INNER JOIN
    monstruo_mision MM ON id_monstruo = monstruos.nombre
        INNER JOIN
    misiones S ON (S.id_gremio , idmision) = (MM.id_gremio , MM.id_mision)
        INNER JOIN
    gremios ON cuit = S.id_gremio
        LEFT JOIN
    contratos ON (contratos.id_gremio , contratos.id_mision) = (MM.id_gremio , MM.id_mision)
WHERE
    f_cumplimiento IS NULL
        AND monstruos.tipo = 'Kraken';

-- 9 Datos de la misión que ofrezca la mayor recompensa.

-- 9.1 ordeno registros de mayor a menor

SELECT 
    *
FROM
    misiones
ORDER BY recompensa DESC
LIMIT 1;

-- 9.2 opcion 2 uso Max

SELECT 
    idmision,
    nombre,
    fecha_inicio,
    fecha_fin,
    MAX(recompensa) AS Maxima_recompensa,
    desc_copete,
    desc_cuerpo
FROM
    misiones;
    
-- 9.3 opcion 3 Subconsulta

SELECT 
    idmision, nombre, fecha_inicio, fecha_fin
FROM
    misiones
WHERE
    recompensa = (SELECT 
            MAX(recompensa)
        FROM
            misiones)
;
    
    -- 10 Promedio de los últimas 10 contratos aceptados (pero todavía no cumplimentados) del Gremio 'UDCPBA'
	
SELECT 
    G.nombre AS Gremio,
    ROUND(AVG(M.recompensa), 2) AS Promedio_recompensa,
    COUNT(M.idmision) AS Cantidad_Misiones
FROM
    misiones M
        INNER JOIN
    contratos C ON (C.id_gremio , C.id_mision) = (M.id_gremio , M.idmision)
        INNER JOIN
    gremios G ON cuit = C.id_gremio
WHERE
    G.nombre = 'UDCPBA'
        AND C.f_cumplimiento IS NULL
LIMIT 10;


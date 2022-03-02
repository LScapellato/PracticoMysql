use domadoresagremiados;

-- 1 Cantidad de Domadores

select count(cuil) as Total_Domadores from domadores;


-- 2  Cantidad de domadores con al menos un seguidor

select  count(distinct seguido_cuil) as Domadores_Seguidos from seguimiento
where sequidor_cuil >= 1;

-- 3 Cantidad de Domadores que no tienen seguidores

use domadoresagremiados;
select count(nombre_y_apellido) as domadores_sin_seguidores from domadores
left join seguimiento on cuil = sequidor_cuil
 where seguido_cuil is null;
 
-- 4  Cantidad de Domadores que operan en la ciudad de Córdoba.

USE domadoresagremiados;

SELECT  count(domadores.cuil) as Domadores_en_Córdoba
FROM ciudades
INNER JOIN domadores ON ciudades.id_gremio = domadores.id_gremio
WHERE ciudad = 'Córdoba';
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
SELECT count(idmision) as Misiones_Chupacabras FROM misiones
INNER JOIN monstruo_mision ON (id_mision,monstruo_mision.id_gremio) = (idmision,misiones.id_gremio)
INNER JOIN monstruos ON monstruos.nombre = id_monstruo
where tipo = 'Chupacabras';

-- 7. Cantidad de Misiones que pertenezcan a un gremio que opere en la ciudad de Córdoba.
SELECT COUNT(idmision) AS Misiones_en_Córdoba
from misiones
INNER JOIN ciudades on ciudades.id_gremio = misiones.id_gremio
WHERE ciudades.ciudad ="Córdoba" ;

-- 8. Todos los datos de todos los Krakens no domesticados 

SELECT gremios.nombre as Nombre_Gremio, monstruos.nombre as  Nombre_Monstruo, monstruos.energia_interior, S.recompensa, S.desc_cuerpo FROM monstruos
inner join monstruo_mision MM on id_monstruo = monstruos.nombre
inner join misiones S on (S.id_gremio,idmision) = (MM.id_gremio,MM.id_mision)
inner join gremios on cuit = S.id_gremio
left join contratos on (contratos.id_gremio,contratos.id_mision) = (MM.id_gremio,MM.id_mision)

where f_cumplimiento is null and monstruos.tipo = 'Kraken';

-- 9 Datos de la misión que ofrezca la mayor recompensa.

select * from misiones
order by recompensa desc
limit 1;

-- opcion 2

select idmision,nombre,fecha_inicio , fecha_fin, max(recompensa)  as Maxima_recompensa , desc_copete,desc_cuerpo
from misiones;

-- 10. Promedio de los últimas 10 contratos aceptados (pero todavía no cumplimentados) del
-- Gremio “UDCPBA”
SELECT  G.nombre as Gremio, round(avg(M.recompensa),2) as Promedio_recompensa, count(M.idmision) as Cantidad_Misiones From misiones M
inner join contratos C on (C.id_gremio,C.id_mision) = (M.id_gremio,M.idmision)
inner join gremios G on cuit = C.id_gremio
where G.nombre = 'UDCPBA' and C.f_cumplimiento is null
limit 10;

-- Quien sigue a quién
select  I.nombre_y_apellido ,group_concat(distinct d.nombre_y_apellido separator ', ') as  SEGUIDORES from seguimiento
inner join domadores as I on I.cuil = seguido_cuil
inner join domadores d on d.cuil = sequidor_cuil
group by seguido_cuil;






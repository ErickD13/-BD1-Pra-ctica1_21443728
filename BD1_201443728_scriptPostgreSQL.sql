use BD1Practica1;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE '/var/lib/mysql-files/Reporte_Vuelos_Corregido.csv'
INTO TABLE TEMPORAL
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE ESTADO; 
SET FOREIGN_KEY_CHECKS = 1;

select *
from TEMPORAL;

insert into AEROLINEA(id_aerolinea,aerolinea)
select id_aerolinea, aerolinea
from TEMPORAL
group by id_aerolinea; 

select *
from AEROLINEA
order by id_aerolinea;

insert into ESTADO(id_estado,estado,abrev)
select id_estado_origen, estado_origen, abrev_estado_origen
from TEMPORAL
group by id_estado_origen; 

insert into ESTADO(id_estado,estado,abrev)
select id_estado_destino, estado_destino, abrev_estado_destino
from TEMPORAL
where not exists(
SELECT *FROM ESTADO WHERE id_estado_destino = id_estado)
group by id_estado_destino; 

select *
from ESTADO
order by id_estado;

insert into CIUDAD(id_ciudad,ciudad,abrev,ESTADO_id_estado)
select id_ciudad_origen, ciudad_origen, abrev_ciudad_origen, id_estado_origen
from TEMPORAL
group by id_ciudad_origen; 

insert into CIUDAD(id_ciudad,ciudad,abrev,ESTADO_id_estado)
select id_ciudad_destino, ciudad_destino, abrev_ciudad_destino, id_estado_destino
from TEMPORAL
where not exists(
SELECT *FROM CIUDAD WHERE id_ciudad_destino = id_ciudad)
group by id_ciudad_destino; 

select *
from CIUDAD
order by id_ciudad;

insert into AEROPUERTO(id_aeropuerto,aeropuerto,CIUDAD_id_ciudad)
select id_aeropuerto_origen, aeropuerto_origen, id_ciudad_origen
from TEMPORAL
group by id_aeropuerto_origen; 

insert into AEROPUERTO(id_aeropuerto,aeropuerto,CIUDAD_id_ciudad)
select id_aeropuerto_destino, aeropuerto, id_ciudad_origen
from TEMPORAL
where not exists(
select *
from AEROPUERTO
where id_aeropuerto_destino = id_aeropuerto)
group by id_aeropuerto_destino; 

select *
from AEROPUERTO
order by id_aeropuerto;

insert into VUELO(pasajeros,carga,correo,distancia_recorrida,fecha,AEROLINEA_id_aerolinea,AEROPUERTO_id_aeropuerto,CIUDAD_id_ciudad,CIUDAD_id_ciudad1)
select pasajeros,carga,correo,distancia_recorrida,fecha,id_aerolinea,id_aeropuerto_origen,id_ciudad_origen,id_ciudad_destino
from TEMPORAL
group by id_aeropuerto_origen; 

insert into VUELO(pasajeros,carga,correo,distancia_recorrida,fecha,AEROLINEA_id_aerolinea,AEROPUERTO_id_aeropuerto,CIUDAD_id_ciudad,CIUDAD_id_ciudad1)
select pasajeros,carga,correo,distancia_recorrida,fecha,id_aerolinea,id_aeropuerto_origen,id_ciudad_origen,id_ciudad_destino
from TEMPORAL
where not exists(
select *
from VUELO
where id_aeropuerto_origen = AEROPUERTO_id_aeropuerto)
group by id_vuelo;

select *
from VUELO;
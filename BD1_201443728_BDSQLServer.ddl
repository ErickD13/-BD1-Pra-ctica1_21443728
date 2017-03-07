-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2017-02-27 03:26:35 CST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012




CREATE
  TABLE AEROLINEA
  (
    id_aerolinea INTEGER NOT NULL ,
    aerolinea    VARCHAR (256) NOT NULL
  )
  ON "default"
GO
ALTER TABLE AEROLINEA ADD CONSTRAINT AEROLINEA_PK PRIMARY KEY CLUSTERED (
id_aerolinea)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE AEROPUERTO
  (
    id_aeropuerto    INTEGER NOT NULL ,
    aeropuerto       VARCHAR (256) NOT NULL ,
    CIUDAD_id_ciudad INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE AEROPUERTO ADD CONSTRAINT AEROPUERTO_PK PRIMARY KEY CLUSTERED (
id_aeropuerto)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE CIUDAD
  (
    id_ciudad        INTEGER NOT NULL ,
    ciudad           VARCHAR (256) NOT NULL ,
    abrev            VARCHAR (3) NOT NULL ,
    ESTADO_id_estado INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE CIUDAD ADD CONSTRAINT CIUDAD_PK PRIMARY KEY CLUSTERED (id_ciudad)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE ESTADO
  (
    id_estado INTEGER NOT NULL ,
    estado    VARCHAR (256) NOT NULL ,
    abrev     VARCHAR (2) NOT NULL
  )
  ON "default"
GO
ALTER TABLE ESTADO ADD CONSTRAINT ESTADO_PK PRIMARY KEY CLUSTERED (id_estado)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE VUELO
  (
    id_vuelo                 INTEGER NOT NULL ,
    pasajeros                INTEGER NOT NULL ,
    carga                    INTEGER NOT NULL ,
    correo                   INTEGER NOT NULL ,
    distancia_recorrida      INTEGER NOT NULL ,
    fecha                    DATE NOT NULL ,
    AEROLINEA_id_aerolinea   INTEGER NOT NULL ,
    AEROPUERTO_id_aeropuerto INTEGER NOT NULL ,
    CIUDAD_id_ciudad1        INTEGER NOT NULL ,
    CIUDAD_id_ciudad         INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE VUELO ADD CONSTRAINT VUELO_PK PRIMARY KEY CLUSTERED (id_vuelo)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

ALTER TABLE AEROPUERTO
ADD CONSTRAINT AEROPUERTO_CIUDAD_FK FOREIGN KEY
(
CIUDAD_id_ciudad
)
REFERENCES CIUDAD
(
id_ciudad
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE CIUDAD
ADD CONSTRAINT CIUDAD_ESTADO_FK FOREIGN KEY
(
ESTADO_id_estado
)
REFERENCES ESTADO
(
id_estado
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE VUELO
ADD CONSTRAINT VUELO_AEROLINEA_FK FOREIGN KEY
(
AEROLINEA_id_aerolinea
)
REFERENCES AEROLINEA
(
id_aerolinea
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE VUELO
ADD CONSTRAINT VUELO_AEROPUERTO_FK FOREIGN KEY
(
AEROPUERTO_id_aeropuerto
)
REFERENCES AEROPUERTO
(
id_aeropuerto
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE VUELO
ADD CONSTRAINT VUELO_CIUDAD_FK FOREIGN KEY
(
CIUDAD_id_ciudad
)
REFERENCES CIUDAD
(
id_ciudad
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE VUELO
ADD CONSTRAINT VUELO_CIUDAD_FKv1 FOREIGN KEY
(
CIUDAD_id_ciudad1
)
REFERENCES CIUDAD
(
id_ciudad
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

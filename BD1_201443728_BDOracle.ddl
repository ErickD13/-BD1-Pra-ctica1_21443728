-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2017-02-27 03:26:12 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE AEROLINEA
  (
    id_aerolinea INTEGER NOT NULL ,
    aerolinea    VARCHAR2 (256) NOT NULL
  ) ;
ALTER TABLE AEROLINEA ADD CONSTRAINT AEROLINEA_PK PRIMARY KEY ( id_aerolinea ) ;


CREATE TABLE AEROPUERTO
  (
    id_aeropuerto    INTEGER NOT NULL ,
    aeropuerto       VARCHAR2 (256) NOT NULL ,
    CIUDAD_id_ciudad INTEGER NOT NULL
  ) ;
ALTER TABLE AEROPUERTO ADD CONSTRAINT AEROPUERTO_PK PRIMARY KEY ( id_aeropuerto ) ;


CREATE TABLE CIUDAD
  (
    id_ciudad        INTEGER NOT NULL ,
    ciudad           VARCHAR2 (256) NOT NULL ,
    abrev            VARCHAR2 (3) NOT NULL ,
    ESTADO_id_estado INTEGER NOT NULL
  ) ;
ALTER TABLE CIUDAD ADD CONSTRAINT CIUDAD_PK PRIMARY KEY ( id_ciudad ) ;


CREATE TABLE ESTADO
  (
    id_estado INTEGER NOT NULL ,
    estado    VARCHAR2 (256) NOT NULL ,
    abrev     VARCHAR2 (2) NOT NULL
  ) ;
ALTER TABLE ESTADO ADD CONSTRAINT ESTADO_PK PRIMARY KEY ( id_estado ) ;


CREATE TABLE VUELO
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
  ) ;
ALTER TABLE VUELO ADD CONSTRAINT VUELO_PK PRIMARY KEY ( id_vuelo ) ;


ALTER TABLE AEROPUERTO ADD CONSTRAINT AEROPUERTO_CIUDAD_FK FOREIGN KEY ( CIUDAD_id_ciudad ) REFERENCES CIUDAD ( id_ciudad ) ;

ALTER TABLE CIUDAD ADD CONSTRAINT CIUDAD_ESTADO_FK FOREIGN KEY ( ESTADO_id_estado ) REFERENCES ESTADO ( id_estado ) ;

ALTER TABLE VUELO ADD CONSTRAINT VUELO_AEROLINEA_FK FOREIGN KEY ( AEROLINEA_id_aerolinea ) REFERENCES AEROLINEA ( id_aerolinea ) ;

ALTER TABLE VUELO ADD CONSTRAINT VUELO_AEROPUERTO_FK FOREIGN KEY ( AEROPUERTO_id_aeropuerto ) REFERENCES AEROPUERTO ( id_aeropuerto ) ;

ALTER TABLE VUELO ADD CONSTRAINT VUELO_CIUDAD_FK FOREIGN KEY ( CIUDAD_id_ciudad ) REFERENCES CIUDAD ( id_ciudad ) ;

ALTER TABLE VUELO ADD CONSTRAINT VUELO_CIUDAD_FKv1 FOREIGN KEY ( CIUDAD_id_ciudad1 ) REFERENCES CIUDAD ( id_ciudad ) ;

CREATE SEQUENCE VUELO_id_vuelo_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER VUELO_id_vuelo_TRG BEFORE
  INSERT ON VUELO FOR EACH ROW WHEN (NEW.id_vuelo IS NULL) BEGIN :NEW.id_vuelo := VUELO_id_vuelo_SEQ.NEXTVAL;
END;
/


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
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

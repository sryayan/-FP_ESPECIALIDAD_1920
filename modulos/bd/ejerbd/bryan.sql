CREATE TABLE GENEROS
(
 Genero varchar(12) PRIMARY KEY 
);
CREATE TABLE DIRECTORES
(
NOMBRE varchar(30) PRIMARY KEY,
LUGARNAC varchar(50),
FECHANAC DATE
);
CREATE TABLE ACTORES
(
NOMBRE varchar(30) PRIMARY KEY,
LUGARNAC varchar(50),
FECHANAC DATE,
FOTO VARCHAR(255),
sexo char(1) CHECK ( sexo = 'M' or sexo = 'F')
);

CREATE TABLE PELICULAS
(
CODIGO VARCHAR (30) PRIMARY KEY,
TITULO VARCHAR (50),
DIRECTOR VARCHAR (30) REFERENCES DIRECTORES,
GENEROS VARCHAR (30) REFERENCES GENEROS,
A�O DATE,
CARATULA VARCHAR (255)
);
CREATE TABLE ACTORESPELICULAS
(
PELICULA VARCHAR(50) REFERENCES PELICULAS,
ACTOR VARCHAR(30) REFERENCES ACTORES,
FOTO VARCHAR(255),
A�O DATE,
PRIMARY KEY (PELICULA, ACTOR)
);
CREATE TABLE NUEVA
(
CAMPO1 VARCHAR(50),
CAMPO2 VARCHAR(50),
CAMPO3 VARCHAR(50)
);
Alter table NUEVA ADD
(
CAMPO4 varchar(50)
);
Alter table NUEVA DROP COLUMN CAMPO1;
Alter table NUEVA modify CAMPO2 VARCHAR(60);
ALTER TABLE NUEVA RENAME COLUMN CAMPO3 TO CAMPOSANTO;
CREATE TABLE USUARIOS
(
CREDITO NUMBER(4) CHECK(CREDITO BETWEEN 0 AND 2000)
);
INSERT INTO USUARIOS VALUES(1500);
SELECT * FROM USUARIOS;
INSERT INTO USUARIOS VALUES(2000);
SELECT * FROM USUARIOS;
ALTER TABLE USUARIOS ADD 
(
USER1 VARCHAR(20) PRIMARY KEY
);
DELETE USUARIOS;

DESC USUARIOS --DESCRIBIR LA ESTRUCTURA DE UNA TABLA

ALTER TABLE USUARIOS RENAME COLUMN USER1 TO LOGIN;
DESC USUARIOS --DESCRIBIR LA ESTRUCTURA DE UNA TABLA
INSERT INTO USUARIOS VALUES (500,'ANA');
ALTER TABLE USUARIOS ADD
(
FECHA DATE DEFAULT SYSDATE 
);
INSERT INTO USUARIOS (CREDITO, LOGIN)VALUES (500,'PEPE');
INSERT INTO USUARIOS VALUES (600,'JOSE','01/09/1989');
ALTER TABLE USUARIOS DROP CONSTRAINT SYS_C007009;
INSERT INTO GENEROS VALUES('TERROR');
SELECT * FROM ACTORES;
INSERT INTO ACTORES (SEXO) VALUES (M);
ALTER TABLE ACTORES DROP COLUMN NOMBRE; 
ALTER TABLE ACTORES DROP COLUMN LUGARNAC; 
ALTER TABLE ACTORES DROP CONSTRAINT SYS_C007000 CASCADE;
ALTER TABLE ACTORES ADD NOMBRE VARCHAR (30) PRIMARY KEY;
ALTER TABLE ACTORES ADD LUGARNAC VARCHAR (50);
DELETE ACTORES;
INSERT INTO DIRECTORES VALUES ('CARLOS','MADRID','10-10-1992');
INSERT INTO ACTORES VALUES ('10-10-2010','CARLOSENTANGA','M','MADRID','CARLOS DEL VALLE');
INSERT INTO PELICULAS VALUES (20,'CARLOS AL SOL','CARLOS','TERROR','01-01-1969','CARLOSENTANGA');
INSERT INTO ACTORESPELICULAS VALUES(20,'CARLOS DEL VALLE','CARLOSENTANGA','10-01-2001');


-- NUEVA TABLA--
CREATE TABLE EJEMPLO1
(
DNI VARCHAR(10) NOT NULL,
NOMBRE VARCHAR(30),
FECHA DATE DEFAULT SYSDATE
);
CREATE TABLE EJEMPLO2
(
DNI VARCHAR (10),
NOMBRE VARCHAR(20)DEFAULT 'NO DEFINIDO',
USUARIO VARCHAR(20)DEFAULT uid 
);
CREATE TABLE EJEMPLO3
(
DNI VARCHAR(10) NOT NULL PRIMARY KEY,
NOMBRE VARCHAR(30) NOT NULL CHECK(NOMBRE=UPPER(NOMBRE)),
EDAD NUMBER(2) CHECK (EDAD BETWEEN 5 AND 20),
CURSO VARCHAR(7) CHECK (CURSO BETWEEN 1 AND 3)

);
insert into EJEMPLO1 (DNI,NOMBRE)values('51A6666','CARLOS');
SELECT * FROM EJEMPLO3;
INSERT INTO EJEMPLO1 VALUES ('1','ANA','01/01/2019');
INSERT INTO EJEMPLO2 (DNI) VALUES (1);
INSERT INTO EJEMPLO2 (DNI,NOMBRE) VALUES (2,'ANA');
INSERT INTO EJEMPLO3 VALUES (1,'PEPITO',18,1);
INSERT INTO EJEMPLO3 VALUES (2,'ANITA',18,1);
INSERT INTO EJEMPLO3 VALUES (3,'Maria',28,1);
CREATE TABLE ARTICULOS
(
ARTICULO VARCHAR(20),
COD_FABRICANTE NUMBER(3),
PESO NUMBER(3)CHECK (PESO>0),
CATEGORIA VARCHAR(10)CHECK (CATEGORIA IN('PRIMERA','SEGUNDA','TERCERA')),
PRECIO_VENTA NUMBER(6,2) CHECK(PRECIO_VENTA>0), --DE LOS 6 VALORES 2 SON DECIMALES
PRECIO_COSTO NUMBER(6,2),CHECK (PRECIO_COSTO>0),
EXISTENCIAS NUMBER(5),
CONSTRAINT ART_PK PRIMARY KEY (ARTICULO,COD_FABRICANTE,PESO,CATEGORIA),
CONSTRAINT FAB_FK FOREIGN KEY (COD_FABRICANTE) REFERENCES FABRICANTES 
);
CREATE TABLE FABRICANTES
(
COD_FABRICANTE  NUMBER(3),
NOMBRE VARCHAR(15)CHECK(NOMBRE=UPPER(NOMBRE)),
PAIS VARCHAR(15)CHECK(PAIS=UPPER(PAIS)),
CONSTRAINT FAB_PK PRIMARY KEY (COD_FABRICANTE)
);
INSERT INTO FABRICANTES VALUES(100,'PEPE','ESPA�A');
INSERT INTO ARTICULOS VALUES ('ARTICULO1',100,2,'PRIMERA',456,2,50);
DROP TABLE ARTICULOS;

CREATE TABLE EMPLEADOS
(
APELLIDOS VARCHAR (20),
NOMBRE VARCHAR(20) NOT NULL,
DOMICILIO VARCHAR(30)
);
ALTER TABLE EMPLEADOS ADD FECHAINGRESO DATE;
SELECT * FROM EMPLEADOS;
ALTER TABLE EMPLEADOS ADD SECCION VARCHAR(30) NOT NULL;
ALTER TABLE EMPLEADOS ADD SUELDO NUMBER (3) DEFAULT 0;
CREATE TABLE SECCIONES 
(
CODIGO NUMBER(2),
NOMBRE VARCHAR(20),
CONSTRAINT SEC_PK PRIMARY KEY(CODIGO)
);
CREATE TABLE EMPLEA2
(
APELLIDO VARCHAR(20) NOT NULL,
NOMBRE VARCHAR(20),
DOMICILIO VARCHAR(30),
SECCION NUMBER(2),
FECHAINGRESO DATE,
TELEFONO NUMBER(7),
CONSTRAINT EMP_SEC_FK FOREIGN KEY (SECCION)REFERENCES SECCIONES(CODIGO) ON DELETE SET NULL
);
ALTER TABLE EMPLEA2 MODIFY TELEFONO VARCHAR(11);
ALTER TABLE EMPLEA2 MODIFY NOMBRE VARCHAR(20);
ALTER TABLE EMPLEA2 DROP CONSTRAINT EMP_SEC_FK;
ALTER TABLE SECCIONES DROP CONSTRAINT SEC_PK;
SELECT * FROM DBA_USERS;
CREATE USER nombreUsuario identified BY usuario; 


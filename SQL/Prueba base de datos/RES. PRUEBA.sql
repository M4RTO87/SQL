---------- CREACION DE TABLAS ----------

----- TABLA ESTADO_CIVIL -----

CREATE TABLE ESTADO_CIVIL(
    ID_ESTADO_CIVIL NUMBER(1)NOT NULL PRIMARY KEY,
    ESTADO_CIVIL VARCHAR2(20)NOT NULL
);

----- TABLA SEDE -----

CREATE TABLE SEDE (
    ID_SEDE NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    NOM_SEDE VARCHAR2(30)NOT NULL,
    DIRECCION VARCHAR2(40)NOT NULL,
    ID_ZONA NUMBER(2)NOT NULL,
    ID_COMUNA NUMBER (3)NOT NULL,
    CONSTRAINT FK_ID_ZONA_SEDE FOREIGN KEY (ID_ZONA)REFERENCES ZONA(ID_ZONA),
    CONSTRAINT FK_ID_COMUNA_SEDE FOREIGN KEY (ID_COMUNA) REFERENCES COMUNA(ID_COMUNA)
);

----- TABLA ALUMNO -----

CREATE TABLE ALUMNO(
    ID_ALUMNO NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    RUN_ALUMNO NUMBER(8)NOT NULL,
    DV_ALUMNO VARCHAR2(1)NOT NULL,
    PNOMBRE_ALUMNO VARCHAR2(30)NOT NULL,
    SNOMBRE_ALUMNO VARCHAR2(30),
    APPATERNO_ALUMNO VARCHAR2(30)NOT NULL,
    APMATERNO_ALUMNO VARCHAR2(30)NOT NULL,
    CORREO_ALUMNO VARCHAR2(50)NOT NULL,
    DIRECCION VARCHAR2(40) NOT NULL,
    ID_ZONA NUMBER(2)NOT NULL,
    ID_COMUNA NUMBER(3)NOT NULL,
    ID_ESCUELA NUMBER(1)NOT NULL,
    ID_ESTADO_CIVIL NUMBER(1)NOT NULL,
    ID_SEDE NUMBER(2) NOT NULL,
    CONSTRAINT UNQ_RUN_ALUMNO UNIQUE(RUN_ALUMNO),
    CONSTRAINT CK_CORRERO_ALUMNO CHECK(CORREO_ALUMNO LIKE '%@duocuc.cl'),
    CONSTRAINT FK_ID_ZONA_ALUMNO FOREIGN KEY (ID_ZONA)REFERENCES ZONA(ID_ZONA),
    CONSTRAINT FK_ID_COMUNA_ALUMNO FOREIGN KEY (ID_COMUNA) REFERENCES COMUNA(ID_COMUNA),
    CONSTRAINT FK_ESCUELA_ALUMNO FOREIGN KEY (ID_ESCUELA) REFERENCES ESCUELA(ID_ESCUELA),
    CONSTRAINT FK_ESTADO_CIVIL_ALUMNO FOREIGN KEY (ID_ESTADO_CIVIL) REFERENCES ESTADO_CIVIL(ID_ESTADO_CIVIL),
    CONSTRAINT FK_SEDE_ALUMNO FOREIGN KEY (ID_SEDE) REFERENCES SEDE(ID_SEDE)
);

CREATE SEQUENCE SEQ_COMUNA
START WITH 1
INCREMENT BY 5;

---------- INSERCION DE DATOS ----------

----- INSERCION TABLA COMUNA -----

INSERT INTO COMUNA (ID_COMUNA, NOM_COMUNA) VALUES (100, 'Providencia');
INSERT INTO COMUNA (ID_COMUNA, NOM_COMUNA) VALUES (105, 'Santiago');
INSERT INTO COMUNA (ID_COMUNA, NOM_COMUNA) VALUES (110, 'Nunoa');
INSERT INTO COMUNA (ID_COMUNA, NOM_COMUNA) VALUES (115, 'La Florida');
INSERT INTO COMUNA (ID_COMUNA, NOM_COMUNA) VALUES (120, 'Maipu');

----- INSERCION TABLA ESCUELA -----

INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (1, 'Administracion y Negocios');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (2, 'Comunicacion');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (3, 'Construccion');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (4, 'Diseno');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (5, 'Gastronomia');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (6, 'Informatica y Telecomunicaciones');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (7, 'Ingenieria y Recursos Naturales');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (8, 'Salud');
INSERT INTO ESCUELA (ID_ESCUELA, NOM_ESCUELA) VALUES (9, 'Turismo y Hospitalidad');

----- INSERCION TABLA ZONA -----

INSERT INTO ZONA (ID_ZONA, NOM_ZONA) VALUES (1, 'Norte');
INSERT INTO ZONA (ID_ZONA, NOM_ZONA) VALUES (2, 'Sur');
INSERT INTO ZONA (ID_ZONA, NOM_ZONA) VALUES (3, 'Oriente');
INSERT INTO ZONA (ID_ZONA, NOM_ZONA) VALUES (4, 'Poniente');
INSERT INTO ZONA (ID_ZONA, NOM_ZONA) VALUES (5, 'Centro');

----- INSERCION TABLA SEDE -----

INSERT INTO SEDE (NOM_SEDE,DIRECCION,ID_ZONA,ID_COMUNA) VALUES ('Sede Plaza Vespucio','Froilan Roa 7107',3,115);
INSERT INTO SEDE (NOM_SEDE,DIRECCION,ID_ZONA,ID_COMUNA) VALUES ('Sede Maipu','Av. Esquina Blanca 501',3,120);
INSERT INTO SEDE (NOM_SEDE,DIRECCION,ID_ZONA,ID_COMUNA) VALUES ('Sede Antoni Varas','Antoni Varas 666',3,100);
INSERT INTO SEDE (NOM_SEDE,DIRECCION,ID_ZONA,ID_COMUNA) VALUES ('Sede Alameda','Av. España 8',5,105);

----- INSERCION TABLA ESTADO_CIVIL -----

INSERT INTO ESTADO_CIVIL (ID_ESTADO_CIVIL,ESTADO_CIVIL) VALUES (1,'Soltero');
INSERT INTO ESTADO_CIVIL (ID_ESTADO_CIVIL,ESTADO_CIVIL) VALUES (2,'Casado');
INSERT INTO ESTADO_CIVIL (ID_ESTADO_CIVIL,ESTADO_CIVIL) VALUES (3,'Divorciado');
INSERT INTO ESTADO_CIVIL (ID_ESTADO_CIVIL,ESTADO_CIVIL) VALUES (4,'Viudo');
INSERT INTO ESTADO_CIVIL (ID_ESTADO_CIVIL,ESTADO_CIVIL) VALUES (5,'Union Civil');

----- INSERCION TABLA ESTADO_CIVIL -----

INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,12345678,'K','Juan','Pablo','Gonzalez','Soto','juan.gonzalez@duocuc.cl','Calle Falsa 123',3,115,2,1,1);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,87654321,'1','Maria','Josefa','Lopez','Molina','maria.lopez@duocuc.cl','Av. Siempre Viva 456',5,100,8,2,2);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,11223344,'3','Pedro','Andres','Perez','Carrasco','pedro.perez@duocuc.cl','Camino Real 789',4,120,3,3,3);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,99887766,'2','Ana','Maria','Rojas','Fernandez','ana.rojas@duocuc.cl','Paseo Central 321',2,115,4,4,4);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,33445566,'9','Claudio','Hernan','Salazar','Campos','claudio.salazar@duocuc.cl','Plaza Oeste 654',1,105,5,5,2);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,55667788,'5','Francisca','Sofia','Munoz','Araya','francisca.munoz@duocuc.cl','Calle del Sol 222',3,115,2,2,1);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,66778899,'4','Diego','Antonio','Sepulveda','Navarro','diego.sepulveda@duocuc.cl','Calle Luna 333',4,120,8,3,3);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,77889900,'8','Fernanda','Isidora','Cardenas','Morales','fernanda.cardenas@duocuc.cl','Av. Sol 444',5,100,3,1,2);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,88990011,'7','Rodrigo','Ivan','Ortiz','Garcia','rodrigo.ortiz@duocuc.cl','Camino Estrella 555',1,105,4,5,4);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,99001122,'6','Valentina','Belen','Castro','Vega','valentina.castro@duocuc.cl','Av. Principal 666',2,115,5,4,2);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,10111223,'2','Camila','Alejandra','Fuentes','Diaz','camila.fuentes@duocuc.cl','Calle Norte 777',3,115,2,1,1);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,11223355,'5','Tomas','Cristobal','Vasquez','Reyes','tomas.vasquez@duocuc.cl','Av. Pacifico 888',5,100,8,2,2);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,22334466,'9','Felipe','Ignacio','Medina','Cortes','felipe.medina@duocuc.cl','Camino Cordillera 999',4,120,3,3,3);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,33445577,'1','Catalina','Andrea','Cabrera','Salinas','catalina.cabrera@duocuc.cl','Paseo Del Mar 111',2,115,4,4,4);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,44556688,'6','Cristian','Manuel','Torres','Campos','cristian.torres@duocuc.cl','Plaza Este 222',1,105,5,5,2);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,55667799,'4','Lorena','Victoria','Ramos','Tapia','lorena.ramos@duocuc.cl','Calle Brillante 333',3,115,2,2,1);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,66778800,'8','Matias','Joaquin','Herrera','Ortiz','matias.herrera@duocuc.cl','Av. Estelar 444',4,120,8,3,3);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,77889911,'7','Sofia','Francisca','Mora','Guzman','sofia.mora@duocuc.cl','Calle Oeste 555',5,100,3,1,2);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,88990022,'3','Pablo','Rafael','Godoy','Vergara','pablo.godoy@duocuc.cl','Camino Luna 666',1,105,4,5,4);
INSERT INTO ALUMNO (ID_ALUMNO, RUN_ALUMNO, DV_ALUMNO, PNOMBRE_ALUMNO, SNOMBRE_ALUMNO, APPATERNO_ALUMNO, APMATERNO_ALUMNO, CORREO_ALUMNO, DIRECCION, ID_ZONA, ID_COMUNA, ID_ESCUELA, ID_ESTADO_CIVIL, ID_SEDE) VALUES (NULL,99001133,'5','Daniela','Isabel','Villanueva','Arrieta','daniela.villanueva@duocuc.cl','Av. Secundaria 777',2,115,5,4,2);

---------- CONSULTAS ----------

----- CONSULTA 1 -----

SELECT
    RUN_ALUMNO||'-'||DV_ALUMNO AS "RUT ALUMNO",
    PNOMBRE_ALUMNO||' '||SNOOMBRE_ALUMNO||' '||APPATERNO_ALUMNO||' '||APMATERNO_ALUMNO AS "NOMBRE ALUMNO",
    CORREO_ALUMNO AS "CONTACTO",
    ID_ESTADO_CIVIL AS "ESTADO CIVIL"
FROM
    ALUMNO
WHERE ID_ESTADO_CIVIL IN (1,5)
;

----- CONSULTA 2 -----

SELECT
    'PARA EL ALUMNO '|| PNOMBRE_ALUMNO||' '||APPATERNO_ALUMNO||' '||APMATERNO_ALUMNO||' SU CONTRASEÑA SERA '||DV_ALUMNO||APMATERNO_ALUMNO||ID_COMUNA||PNOMBRE_ALUMNO AS "DATO ALUMNO"
FROM
    ALUMNO
;

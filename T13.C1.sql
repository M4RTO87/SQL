------------- CREACION DE TABLAS -------------------

-----TABLA VENDEDOR-----

CREATE TABLE VENDEDOR(
    ID_VENDEDOR NUMBER(5) GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    NUM_RUT NUMBER(8) NOT NULL,
    DV_VENDEDOR VARCHAR2(1)NOT NULL,
    P_NOMBRE VARCHAR2 (30) NOT NULL,
    S_NOMBRE VARCHAR2 (30),
    AP_PATERNO VARCHAR2 (30)NOT NULL,
    AP_MATERNO VARCHAR2 (30)NOT NULL,
    FECHA_CONTRATO DATE NOT NULL,
    SUELDO_BASE NUMBER(7) NOT NULL CONSTRAINT CK_SUELDO_BASE CHECK (SUELDO_BASE > 440000)
);
-----TABLA BOLETA-----

CREATE TABLE BOLETA(
    NU_BOLETA NUMBER(5) GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    FECHA_BOLETA DATE NOT NULL,
    MONTO_TOTAL NUMBER(8)NOT NULL CONSTRAINT CK_MONTO_TOTAL CHECK (MONTO_TOTAL > 0),
    ID_VENDEDOR NUMBER(5)NOT NULL,
    CONSTRAINT FK_ID_VENDEDOR FOREIGN KEY (ID_VENDEDOR) REFERENCES VENDEDOR(ID_VENDEDOR)
);
-----TABLA COMISION-----

CREATE TABLE COMISION_BOLETA(
    NU_BOLETA NUMBER(5),
    ID_VENDEDOR NUMBER(5),
    PRIMARY KEY (NU_BOLETA,ID_VENDEDOR),
    MONTO_COMISION NUMBER(8)NOT NULL,
    CONSTRAINT FK_COMISION_BOLETA_VENDEDOR FOREIGN KEY (ID_VENDEDOR) REFERENCES VENDEDOR(ID_VENDEDOR),
    CONSTRAINT FK_COMISION_BOLETA_BOLETA FOREIGN KEY (NU_BOLETA) REFERENCES BOLETA(NU_BOLETA)
);

------------- INSERCION DE DATOS -------------------

-----INSERCION TABLA VENDEDOR-----

INSERT INTO VENDEDOR (NUM_RUT, DV_VENDEDOR, P_NOMBRE,S_NOMBRE,AP_PATERNO, AP_MATERNO, FECHA_CONTRATO, SUELDO_BASE) VALUES
(12345678,'K', 'PABLO',NULL, 'PÉREZ', 'SOTO', '01/03/20', 460000);
INSERT INTO VENDEDOR (NUM_RUT, DV_VENDEDOR, P_NOMBRE,S_NOMBRE,AP_PATERNO, AP_MATERNO, FECHA_CONTRATO, SUELDO_BASE) VALUES
(20456789,'1', 'CARLOS',' ANTONIO', 'CASTRO', 'AGUILERA', '01/02/20', 460000);

INSERT INTO VENDEDOR (NUM_RUT, DV_VENDEDOR, P_NOMBRE,S_NOMBRE,AP_PATERNO, AP_MATERNO, FECHA_CONTRATO, SUELDO_BASE) VALUES
(23471469,'6', 'MIGUEL ','ALEJANDRO', 'AGUILAR', 'SOTO', '15/04/22', 480000);

INSERT INTO VENDEDOR (NUM_RUT, DV_VENDEDOR, P_NOMBRE,S_NOMBRE,AP_PATERNO, AP_MATERNO, FECHA_CONTRATO, SUELDO_BASE) VALUES
(20607891,'0', 'ANTONIO',NULL, 'PÉREZ', 'TOLEDO', '02/05/22', 500000);

INSERT INTO VENDEDOR (NUM_RUT, DV_VENDEDOR, P_NOMBRE,S_NOMBRE,AP_PATERNO, AP_MATERNO, FECHA_CONTRATO, SUELDO_BASE) VALUES
(12032321,'K', 'JORGE', NULL,'ALVAREZ', 'RODRÍGUEZ', '01/07/22', 750000);

-----INSERCION TABLA BOLETA-----

INSERT INTO BOLETA (ID_VENDEDOR, FECHA_BOLETA, MONTO_TOTAL) VALUES
(3, '02/08/23', 75990);

INSERT INTO BOLETA (ID_VENDEDOR, FECHA_BOLETA, MONTO_TOTAL) VALUES
(1, '03/09/23', 15990);

INSERT INTO BOLETA (ID_VENDEDOR, FECHA_BOLETA, MONTO_TOTAL) VALUES
(1, '15/12/23', 1590);

INSERT INTO BOLETA (ID_VENDEDOR, FECHA_BOLETA, MONTO_TOTAL) VALUES
(2, '01/02/24', 850);

INSERT INTO BOLETA (ID_VENDEDOR, FECHA_BOLETA, MONTO_TOTAL) VALUES
(3, '02/08/23', 7990);

-----INSERCION TABLA COMISION_BOLETA-----

INSERT INTO COMISION_BOLETA (NU_BOLETA, ID_VENDEDOR, MONTO_COMISION) VALUES
(1, 2, 9750);

INSERT INTO COMISION_BOLETA (NU_BOLETA, ID_VENDEDOR, MONTO_COMISION) VALUES
(2, 1, 3600);

INSERT INTO COMISION_BOLETA (NU_BOLETA, ID_VENDEDOR, MONTO_COMISION) VALUES
(3, 1, 15000);

INSERT INTO COMISION_BOLETA (NU_BOLETA, ID_VENDEDOR, MONTO_COMISION) VALUES
(4, 2, 970);

INSERT INTO COMISION_BOLETA (NU_BOLETA, ID_VENDEDOR, MONTO_COMICION) VALUES
(5, 3, 5876);

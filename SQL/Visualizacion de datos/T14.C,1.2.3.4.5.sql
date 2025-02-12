----- CASO 1 -----
SELECT
     'EL EMPLEADO '||NOMBRE_EMP||' '||APPATERNO_EMP||' '||APMATERNO_EMP||' NACIO EL '||FECNAC_EMP AS "LISTA DE COMPLEAÑOS"
FROM
    EMPLEADO
ORDER BY FECNAC_EMP,APPATERNO_EMP ASC;


----- CASO 2 -----
SELECT
    NUMRUT_CLI AS "RUN",
    DVRUT_CLI AS "DV",
    NOMBRE_CLI||' '||APPATERNO_CLI||' '||APMATERNO_CLI AS "NOMBRE CLIENTE",
    RENTA_CLI AS "RENTA",
    FONOFIJO_CLI AS "FONO FIJO",
    CELULAR_CLI AS "CELULAR CLIENTE"
FROM
    CLIENTE
ORDER BY APPATERNO_CLI,APMATERNO_CLI ASC;


----- CASO 3 -----
SELECT
     NOMBRE_EMP||' '||APPATERNO_EMP||' '||APMATERNO_EMP AS "NOMBRE EMPLEDO",
     SUELDO_EMP AS "SULDO",
     SUELDO_EMP *1.50 AS "BONO POR CAPACITACION"
FROM
    EMPLEADO
    
ORDER BY 3 DESC;


----- CASE 4 -----
SELECT
     NRO_PROPIEDAD AS "NUM PROPIEDA",
     NUMRUT_PROP AS "RUT",
     DIRECCION_PROPIEDAD AS "DIRECCION PROPIEDAD",
     VALOR_ARRIENDO AS "VALOR ARRIENDO",
     VALOR_ARRIENDO *1.054 AS "COMPENSACION"
FROM
    PROPIEDAD;


----- CASE 5 -----
SELECT
    NUMRUT_EMP||'-'||DVRUT_EMP AS "RUN",
    NOMBRE_EMP||' '||APPATERNO_EMP||' '||APMATERNO_EMP AS"NOMBRE EMPLEADO",
    SUELDO_EMP AS "SUELSO ACTUAL",
    SUELDO_EMP *0.135 AS "BONO",
    SUELDO_EMP +(SUELDO_EMP*1.135) AS "SUELDO FINAL"
FROM
    EMPLEADO
ORDER BY (SUELDO_EMP*0.135),APPATERNO_EMP ASC

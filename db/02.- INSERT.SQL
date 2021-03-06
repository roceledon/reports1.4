INSERT INTO AREA (AREA_NOMBRE) SELECT 'Operaciones';
INSERT INTO AREA (AREA_NOMBRE) SELECT 'Riesgo';
INSERT INTO AREA (AREA_NOMBRE) SELECT 'Cobranza';
INSERT INTO AREA (AREA_NOMBRE) SELECT 'Comercial';
INSERT INTO AREA (AREA_NOMBRE) SELECT 'PostVenta';
INSERT INTO AREA (AREA_NOMBRE) SELECT 'Gerencia';

INSERT INTO CONTROLADOR (CTRL_NOMBRE) SELECT 'PostgreSQL';
INSERT INTO CONTROLADOR (CTRL_NOMBRE) SELECT 'SQLServer';
INSERT INTO CONTROLADOR (CTRL_NOMBRE) SELECT 'MySQL';
INSERT INTO CONTROLADOR (CTRL_NOMBRE) SELECT 'Oracle';
INSERT INTO CONTROLADOR (CTRL_NOMBRE) SELECT 'JDTs';



INSERT INTO TIPO_PARAMETRO_REPORTE (TPPR_NOMBRE) SELECT 'Alfanumerico';
INSERT INTO TIPO_PARAMETRO_REPORTE (TPPR_NOMBRE) SELECT 'Fecha';
INSERT INTO TIPO_PARAMETRO_REPORTE (TPPR_NOMBRE) SELECT 'Numerico';
INSERT INTO TIPO_PARAMETRO_REPORTE (TPPR_NOMBRE) SELECT 'Booleano';
INSERT INTO TIPO_PARAMETRO_REPORTE (TPPR_NOMBRE) SELECT 'Rango Fechas';
INSERT INTO TIPO_PARAMETRO_REPORTE (TPPR_NOMBRE) SELECT 'Alfanumerico+Like';

INSERT INTO TIPO_RESPUESTA_REPORTE (TPRR_NOMBRE) SELECT 'OK';
INSERT INTO TIPO_RESPUESTA_REPORTE (TPRR_NOMBRE) SELECT 'Error General';
INSERT INTO TIPO_RESPUESTA_REPORTE (TPRR_NOMBRE) SELECT 'Alerta';
INSERT INTO TIPO_RESPUESTA_REPORTE (TPRR_NOMBRE) SELECT 'Error en SQL';
INSERT INTO TIPO_RESPUESTA_REPORTE (TPRR_NOMBRE) SELECT 'Error en parametros';
INSERT INTO TIPO_RESPUESTA_REPORTE (TPRR_NOMBRE) SELECT 'Error generando reporte';
INSERT INTO TIPO_RESPUESTA_REPORTE (TPRR_NOMBRE) SELECT 'Driver no soportado';


INSERT INTO CONEXIONES(CTRL_SEQ_CDG, CONX_NOMBRE, CONX_URL, CONX_USER, CONX_PASS, CONX_USUARIO_CREADOR, CONX_FECHA_CREACION)
SELECT 2, 'Local sqlserver', 'jdbc:sqlserver://localhost;databaseName=REPORTES_DIMAMICOS', 'sa', '11042.', 'camilo', GETDATE()

INSERT INTO CONEXIONES(CTRL_SEQ_CDG, CONX_NOMBRE, CONX_URL, CONX_USER, CONX_PASS, CONX_USUARIO_CREADOR, CONX_FECHA_CREACION)
SELECT 2, 'Local sqlserver 2', 'jdbc:sqlserver://localhost;databaseName=REPORTES_DIMAMICOS', 'sa', '11042.', 'camilo', GETDATE()

INSERT INTO CONEXIONES(CTRL_SEQ_CDG, CONX_NOMBRE, CONX_URL, CONX_USER, CONX_PASS, CONX_USUARIO_CREADOR, CONX_FECHA_CREACION)
SELECT 2, 'SQL', 'jdbc:sqlserver://localhost;databaseName=REPORTES_DIMAMICOS', 'sa', '11042.', 'camilo', GETDATE()

INSERT INTO CONEXIONES(CTRL_SEQ_CDG, CONX_NOMBRE, CONX_URL, CONX_USER, CONX_PASS, CONX_USUARIO_CREADOR, CONX_FECHA_CREACION)
SELECT 2, 'MHE', 'jdbc:sqlserver://10.220.0.31;databaseName=BTCSHPCDB', 'user_hipotecario', 'hipoteca2012', 'ADMIN', GETDATE()

INSERT INTO REPORTE (AREA_SEQ_CDG, CONX_SEQ_CDG, RPTE_NOMBRE, RPTE_DESCRIPCION, RPTE_SQL, RPTE_ACTIVO, RPTE_USUARIO_CREADOR, RPTE_FECHA_CREACION)
SELECT 1, 1, 'TEST1', 'TEST1', 'select * from CONEXIONES', 1, 'camilo', GETDATE()

INSERT INTO REPORTE (AREA_SEQ_CDG, CONX_SEQ_CDG, RPTE_NOMBRE, RPTE_DESCRIPCION, RPTE_SQL, RPTE_ACTIVO, RPTE_USUARIO_CREADOR, RPTE_FECHA_CREACION)
SELECT 1, 1, 'TEST2', 'TEST2', 'SELECT C.* FROM CONEXIONES C WHERE C.CONX_NOMBRE LIKE $P{NOMBRE}', 1, 'camilo', GETDATE()

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 1, 2, 'NOMBRE', 1, 1

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 1, 2, 'AREA', 1, 0

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 2, 2, 'DESDE', 1, 0

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 2, 2, 'HASTA', 1, 0

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 3, 2, 'CODIGO', 1, 0

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 4, 2, 'ACTIVO', 1, 0



INSERT INTO REPORTE (AREA_SEQ_CDG, CONX_SEQ_CDG, RPTE_NOMBRE, RPTE_DESCRIPCION, RPTE_SQL, RPTE_ACTIVO, RPTE_USUARIO_CREADOR, RPTE_FECHA_CREACION)
SELECT 3, 4, 'Autoajustables PCH Flexibles', 'Autoajustables PCH Flexibles', '

select m.mutu_codigo as mutuo   , pc.PRCO_DIVID_PREPAGO  as cuota_maxima   , (select COUNT(tran_monto) from transaccion where MUTU_CODIGO = m.mutu_codigo) as cantidad_prepagos
from mutuo m
    inner join SOLICITUD s on m.SLCT_SEQ_CDG = s.SLCT_SEQ_CDG
    inner join PRODUCTO_COTIZADO pc on s.prco_SEQ_CDG = pc.prco_SEQ_CDG
where 1=1
	and m.MUTU_FLG_AUTOAJUS_PERMITE_PAGO_LIBRE = $P{PAGO_LIBRE}
	and s.TPPR_SEQ_CDG = 4
  $O{ESTADO_MUTUO} and m.ESMU_SEQ_CDG = $P{ESTADO_MUTUO}   $O{ESTADO_MUTUO}
  $O{MUTUO} and m.mutu_codigo like  $P{MUTUO}   $O{MUTUO}
  $O{RANGO} and m.MUTU_FECHA_COLOCACION between $P{RANGO} and $P{RANGO} $O{RANGO}
'

', 1, 'ADMIN', GETDATE()


INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 4, 3, 'PAGO_LIBRE', 1, 0

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 1, 3, 'MUTUO', 0, 1

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO)
SELECT 1, 3, 'ESTADO_MUTUO', 0, 0

INSERT INTO PARAMETROS_REPORTE (TPPR_SEQ_CDG, RPTE_SEQ_CDG, PARE_NOMBRE, PARE_REQUERIDO, PARE_COMO, PARE_DATO1)
SELECT 5, 3, 'RANGO', 0, 0, 90




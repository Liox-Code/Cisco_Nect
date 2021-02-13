//BD XAMP

CREATE TABLE usuario(
	nombre_cuenta VARCHAR(15) PRIMARY KEY,
	nombre_usuario VARCHAR(15) NOT NULL,
	apellido_usuario VARCHAR(15) NOT NULL,
	contraseña VARCHAR(15) NOT NULL,
	puntos INTEGER NOT NULL
);

//Nombre Base Datos BD_NECT_Cisco_Gami
CREATE TABLE usuario(
	nombre_cuenta VARCHAR( 0, 15) PRIMARY KEY,
	nombre_usuario VARCHAR( 0, 15),
	apellido_usuario VARCHAR( 0, 15),
	contraseña VARCHAR( 0, 15),
	nivel_cuenta INTEGER,
	exp_sig_nivel INTEGER,
	exp_actual INTEGER,
	puntos INTEGER,
	usuario_cuenta_activo BOOLEAN,
	cuenta_usuario_fecha_creacion DATE
);

CREATE TABLE estadistica(
	nombre_cuenta VARCHAR(0, 15),
	fecha_dia DATETIME,
	porcentaje_acertado FLOAT,
	FOREIGN KEY (nombre_cuenta) REFERENCES usuario(nombre_cuenta)
);

CREATE TABLE tipo_logro(
	nombre_tipo_logro VARCHAR( 0, 30) PRIMARY KEY,
	descripcion_logro VARCHAR( 0, 30),
	nivel_tipo_logro_max INTEGER,
	tipo_logro_activo BOOLEAN
);

CREATE TABLE logro_niveles(
	nombre_tipo_logro VARCHAR( 0, 30),
	nivel_logro INTEGER,
	imagen_nombre VARCHAR,
	cantidad_objetivo_alcanzar INTEGER,
	logro_niveles_activo BOOLEAN,
	FOREIGN KEY (nombre_tipo_logro) REFERENCES tipo_logro(nombre_tipo_logro)
);

CREATE TABLE logro(
	nombre_tipo_logro VARCHAR( 0, 30),
	nombre_cuenta VARCHAR(0, 15),
	nivel_logro INTEGER,
	progreso_objetivo_actual INTEGER,
	logro_completado BOOLEAN,
	FOREIGN KEY (nombre_cuenta) REFERENCES usuario(nombre_cuenta),
	FOREIGN KEY (nombre_tipo_logro) REFERENCES tipo_logro(nombre_tipo_logro)
);

CREATE TABLE nivel_juego(
	nombre_nivel VARCHAR( 0, 30) PRIMARY KEY,
	descripcion VARCHAR,
	tiempo TIME,
	cantidad_preguntas INT,
	nombre_tipo_nivel VARCHAR( 0, 30),
	nivel_juego_activo BOOLEAN,
	nivel_requerido INTEGER,
	FOREIGN KEY (nombre_tipo_nivel) REFERENCES tipo_nivel(nombre_tipo_nivel)
);

CREATE TABLE tipo_nivel(
	nombre_tipo_nivel VARCHAR( 0, 30) PRIMARY KEY,
	dificultad_tipo_nivel VARCHAR( 0, 30),
	tipo_nivel_activo BOOLEAN
);

CREATE TABLE nivel_desbloqueado(
	nombre_cuenta VARCHAR(0, 15),
	nombre_nivel VARCHAR( 0, 30),
	disponible BOOLEAN,
	FOREIGN KEY (nombre_cuenta) REFERENCES usuario(nombre_cuenta),
	FOREIGN KEY (nombre_nivel) REFERENCES nivel_juego(nombre_nivel)
);

CREATE TABLE juego_resultados(
	nombre_cuenta VARCHAR(0, 15),
	nombre_nivel VARCHAR( 0, 30),
	num_respuestas_correctas INTEGER,
	num_respuestas_incorrectas INTEGER,
	tiempo_total TIME,
	puntaje_obtenido INTEGER,
	Experiencia_Obtenida INTEGER,
	fecha_juego DATETIME,
	FOREIGN KEY (nombre_cuenta) REFERENCES usuario(nombre_cuenta),
	FOREIGN KEY (nombre_nivel) REFERENCES nivel_juego(nombre_nivel)
);

CREATE TABLE preguntas(
	cod_pregunta VARCHAR( 0, 15) PRIMARY KEY,
	texto_pregunta VARCHAR( 0, 300),
	dificultad_pregunta VARCHAR,
	preguntas_activo BOOLEAN
);

CREATE TABLE preguntas_nivel(
	nombre_nivel VARCHAR( 0, 30),
	cod_pregunta VARCHAR( 0, 15),
	FOREIGN KEY (nombre_nivel) REFERENCES nivel_juego(nombre_nivel),
	FOREIGN KEY (cod_pregunta) REFERENCES preguntas(cod_pregunta)
);

CREATE TABLE respuestas_dadas(
	nombre_cuenta VARCHAR(0, 15),
	cod_pregunta VARCHAR( 0, 15),
	cantidad_veces_respondido_correctamente INTEGER,
	Cantidad_Veces_Respondido_Incorrectamente INTEGER,
	FOREIGN KEY (nombre_cuenta) REFERENCES usuario(nombre_cuenta),
	FOREIGN KEY (cod_pregunta) REFERENCES preguntas(cod_pregunta)
);

CREATE TABLE respuesta(
	cod_respuesta VARCHAR( 0, 15) PRIMARY KEY,
	respuesta_descripcion VARCHAR,
	respuesta_activo BOOLEAN
);

CREATE TABLE res_pre(
	cod_pregunta VARCHAR( 0, 15),
	cod_respuesta VARCHAR( 0, 15),
	respuesta_correcta BOOLEAN,
	FOREIGN KEY (cod_pregunta) REFERENCES preguntas(cod_pregunta),
	FOREIGN KEY (cod_respuesta) REFERENCES respuesta(cod_respuesta)
);

CREATE TABLE dato_cisco(
	cod_dato VARCHAR( 0, 30) PRIMARY KEY,
	dato_texto VARCHAR( 0, 800),
	dato_activo BOOLEAN
);

CREATE TABLE dato_nivel(
	nombre_nivel VARCHAR( 0, 30),
	cod_dato VARCHAR( 0, 15),
	cantidad_veces_visto INTEGER,
	FOREIGN KEY (nombre_nivel) REFERENCES nivel_juego(nombre_nivel),
	FOREIGN KEY (cod_dato) REFERENCES dato_cisco(cod_dato)
);

//BORRAR TODAS LAS TABLAS

DROP TABLE res_pre;
DROP TABLE respuesta;
DROP TABLE respuestas_dadas;
DROP TABLE preguntas_nivel;
DROP TABLE preguntas;
DROP TABLE juego_resultados;
DROP TABLE nivel_desbloqueado;
DROP TABLE tipo_nivel;
DROP TABLE nivel_juego;
DROP TABLE logro;
DROP TABLE tipo_logro;
DROP TABLE logro_niveles;
DROP TABLE estadistica;
DROP TABLE usuario;

/* INSERT USUARIO*/

INSERT INTO usuario Values ('Liox', 'Angel', 'Mendieta', 'Leonardo.mc.xd@gmail.com', '1234', 0, 1000, 0, 0, 1, DATE());

/* INSERT TIPO LOGRO*/

INSERT INTO tipo_logro VALUES ( "FUEGO_RACHA", "Responder preguntas seguidas sin equivocarse", 3, 1);
INSERT INTO tipo_logro VALUES ( "TRUENO_RAPIDEZ", "Pasar el nivel en 10 minutos", 3, 1);
INSERT INTO tipo_logro VALUES ( "DINERO_PUNTOS", "Ganer 100 puntos", 3, 1);
INSERT INTO tipo_logro VALUES ( "NIVEL_ALCANZADO", "Alcanzar el nivel 5", 3, 1);
INSERT INTO tipo_logro VALUES ( "PERSEVERANTE", "Tiempo utilizando el juego", 3, 1);

/*INSERT LOGRO_NIVELES*/

INSERT INTO logro_niveles VALUES ( "FUEGO_RACHA", 1, "FUEGO_RACHA_NIVEL_1", 3, 1);
INSERT INTO logro_niveles VALUES ( "FUEGO_RACHA", 2, "FUEGO_RACHA_NIVEL_2", 6, 1);
INSERT INTO logro_niveles VALUES ( "FUEGO_RACHA", 3, "FUEGO_RACHA_NIVEL_3", 9, 1);

INSERT INTO logro_niveles VALUES ( "TRUENO_RAPIDEZ", 1, "TRUENO_RAPIDEZ_NIVEL_1", 10, 1);
INSERT INTO logro_niveles VALUES ( "TRUENO_RAPIDEZ", 2, "TRUENO_RAPIDEZ_NIVEL_2", 5, 1);
INSERT INTO logro_niveles VALUES ( "TRUENO_RAPIDEZ", 3, "TRUENO_RAPIDEZ_NIVEL_3", 3, 1);

INSERT INTO logro_niveles VALUES ( "DINERO_PUNTOS", 1, "DINERO_PUNTOS_NIVEL_1", 1000, 1);
INSERT INTO logro_niveles VALUES ( "DINERO_PUNTOS", 2, "DINERO_PUNTOS_NIVEL_2", 5000, 1);
INSERT INTO logro_niveles VALUES ( "DINERO_PUNTOS", 3, "DINERO_PUNTOS_NIVEL_3", 10000, 1);

INSERT INTO logro_niveles VALUES ( "NIVEL_ALCANZADO", 1, "NIVEL_ALCANZADO_NIVEL_1", 5, 1);
INSERT INTO logro_niveles VALUES ( "NIVEL_ALCANZADO", 2, "NIVEL_ALCANZADO_NIVEL_2", 10, 1);
INSERT INTO logro_niveles VALUES ( "NIVEL_ALCANZADO", 3, "NIVEL_ALCANZADO_NIVEL_3", 15, 1);

INSERT INTO logro_niveles VALUES ( "PERSEVERANTE", 1, "PERSEVERANTE_NIVEL_1", 10, 1);
INSERT INTO logro_niveles VALUES ( "PERSEVERANTE", 2, "PERSEVERANTE_NIVEL_2", 20, 1);
INSERT INTO logro_niveles VALUES ( "PERSEVERANTE", 3, "PERSEVERANTE_NIVEL_3", 30, 1);

/* INSERT TIPO_NIVEL */
INSERT INTO tipo_nivel VALUES ( "NIVEL_NOMBRE", "NORMAL", 1);

/*INSERT NIVEL DESBLOQUEADO*/

INSERT INTO nivel_desbloqueado VALUES ( "Liox", "Nivel_01", 1);
INSERT INTO nivel_desbloqueado VALUES ( "Liox", "Nivel_02", 0);
INSERT INTO nivel_desbloqueado VALUES ( "Liox", "Nivel_03", 0);

/* INSERT NIVEL_JUEGO */

INSERT INTO nivel_juego VALUES ( "Nivel_01", "Primer reto del Ingeniero.", "2:00", 5, "NIVEL_NOMBRE", 1, 1);
INSERT INTO nivel_juego VALUES ( "Nivel_02", "Segundo reto del Ingeniero.", "4:00", 10, "NIVEL_NOMBRE", 1, 5);
INSERT INTO nivel_juego VALUES ( "Nivel_03", "Tercer reto del Ingeniero.", "6:00", 15, "NIVEL_NOMBRE", 1, 10);

/*INSERT PREGUNTAS*/

INSERT INTO preguntas VALUES( "PRE_01", "¿CUANTO ES 1 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_02", "¿CUANTO ES 2 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_03", "¿CUANTO ES 3 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_04", "¿CUANTO ES 4 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_05", "¿CUANTO ES 5 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_06", "¿CUANTO ES 6 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_07", "¿CUANTO ES 7 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_08", "¿CUANTO ES 8 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_09", "¿CUANTO ES 9 + 1?", "FACIL", 1);
INSERT INTO preguntas VALUES( "PRE_10", "¿CUANTO ES 10 + 1?", "FACIL", 1);

/*INSERT RESPUESTA*/

INSERT INTO respuesta VALUES( "RES_01", "ES 2", 1);
INSERT INTO respuesta VALUES( "RES_02", "ES 3", 1);
INSERT INTO respuesta VALUES( "RES_03", "ES 4", 1);
INSERT INTO respuesta VALUES( "RES_04", "ES 5", 1);
INSERT INTO respuesta VALUES( "RES_05", "ES 6", 1);
INSERT INTO respuesta VALUES( "RES_06", "ES 7", 1);
INSERT INTO respuesta VALUES( "RES_07", "ES 8", 1);
INSERT INTO respuesta VALUES( "RES_08", "ES 9", 1);
INSERT INTO respuesta VALUES( "RES_09", "ES 10", 1);
INSERT INTO respuesta VALUES( "RES_10", "ES 11", 1);

/*INSERT RES_PRE*/

INSERT INTO res_pre VALUES( "PRE_01", "RES_01", 1);
INSERT INTO res_pre VALUES( "PRE_01", "RES_02", 0);
INSERT INTO res_pre VALUES( "PRE_01", "RES_03", 0);
INSERT INTO res_pre VALUES( "PRE_01", "RES_04", 0);

INSERT INTO res_pre VALUES( "PRE_02", "RES_01", 0);
INSERT INTO res_pre VALUES( "PRE_02", "RES_02", 1);
INSERT INTO res_pre VALUES( "PRE_02", "RES_03", 0);
INSERT INTO res_pre VALUES( "PRE_02", "RES_04", 0);

INSERT INTO res_pre VALUES( "PRE_03", "RES_01", 0);
INSERT INTO res_pre VALUES( "PRE_03", "RES_02", 0);
INSERT INTO res_pre VALUES( "PRE_03", "RES_03", 1);
INSERT INTO res_pre VALUES( "PRE_03", "RES_04", 0);

INSERT INTO res_pre VALUES( "PRE_04", "RES_01", 0);
INSERT INTO res_pre VALUES( "PRE_04", "RES_02", 0);
INSERT INTO res_pre VALUES( "PRE_04", "RES_03", 0);
INSERT INTO res_pre VALUES( "PRE_04", "RES_04", 1);

INSERT INTO res_pre VALUES( "PRE_05", "RES_05", 1);
INSERT INTO res_pre VALUES( "PRE_05", "RES_06", 0);
INSERT INTO res_pre VALUES( "PRE_05", "RES_07", 0);
INSERT INTO res_pre VALUES( "PRE_05", "RES_08", 0);

INSERT INTO res_pre VALUES( "PRE_06", "RES_05", 0);
INSERT INTO res_pre VALUES( "PRE_06", "RES_06", 1);
INSERT INTO res_pre VALUES( "PRE_06", "RES_07", 0);
INSERT INTO res_pre VALUES( "PRE_06", "RES_08", 0);

INSERT INTO res_pre VALUES( "PRE_07", "RES_05", 0);
INSERT INTO res_pre VALUES( "PRE_07", "RES_06", 0);
INSERT INTO res_pre VALUES( "PRE_07", "RES_07", 1);
INSERT INTO res_pre VALUES( "PRE_07", "RES_08", 0);

INSERT INTO res_pre VALUES( "PRE_08", "RES_05", 0);
INSERT INTO res_pre VALUES( "PRE_08", "RES_06", 0);
INSERT INTO res_pre VALUES( "PRE_08", "RES_07", 0);
INSERT INTO res_pre VALUES( "PRE_08", "RES_08", 1);

INSERT INTO res_pre VALUES( "PRE_09", "RES_07", 0);
INSERT INTO res_pre VALUES( "PRE_09", "RES_08", 0);
INSERT INTO res_pre VALUES( "PRE_09", "RES_09", 1);
INSERT INTO res_pre VALUES( "PRE_09", "RES_10", 0);

INSERT INTO res_pre VALUES( "PRE_10", "RES_07", 0);
INSERT INTO res_pre VALUES( "PRE_10", "RES_08", 0);
INSERT INTO res_pre VALUES( "PRE_10", "RES_09", 0);
INSERT INTO res_pre VALUES( "PRE_10", "RES_10", 1);

/* INSERT PREGUNTAS_NIVEL*/

INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_01");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_02");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_03");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_04");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_05");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_06");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_07");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_08");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_09");
INSERT INTO preguntas_nivel VALUES( "Nivel_01", "PRE_10");

INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_01");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_02");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_03");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_04");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_05");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_06");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_07");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_08");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_09");
INSERT INTO preguntas_nivel VALUES( "Nivel_02", "PRE_10");

INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_01");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_02");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_03");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_04");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_05");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_06");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_07");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_08");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_09");
INSERT INTO preguntas_nivel VALUES( "Nivel_03", "PRE_10");

/*INSERT DATO_CISCO*/

insert into dato_cisco VALUES( "DATO_01", "Este es el dato util numero 1.", 1);
insert into dato_cisco VALUES( "DATO_02", "Este es el dato util numero 2.", 1);
insert into dato_cisco VALUES( "DATO_03", "Este es el dato util numero 3.", 1);
insert into dato_cisco VALUES( "DATO_04", "Este es el dato util numero 4.", 1);
insert into dato_cisco VALUES( "DATO_05", "Este es el dato util numero 5.", 1);
insert into dato_cisco VALUES( "DATO_06", "Este es el dato util numero 6.", 1);
insert into dato_cisco VALUES( "DATO_07", "Este es el dato util numero 7.", 1);
insert into dato_cisco VALUES( "DATO_08", "Este es el dato util numero 8.", 1);
insert into dato_cisco VALUES( "DATO_09", "Este es el dato util numero 9.", 1);
insert into dato_cisco VALUES( "DATO_10", "Este es el dato util numero 10.", 1);

/*INSERT DATO_NIVEL*/

INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_01", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_02", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_03", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_04", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_05", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_06", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_07", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_08", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_09", 0);
INSERT INTO dato_nivel VALUES( "Nivel_01", "DATO_10", 0);

INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_01", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_02", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_03", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_04", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_05", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_06", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_07", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_08", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_09", 0);
INSERT INTO dato_nivel VALUES( "Nivel_02", "DATO_10", 0);

INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_01", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_02", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_03", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_04", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_05", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_06", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_07", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_08", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_09", 0);
INSERT INTO dato_nivel VALUES( "Nivel_03", "DATO_10", 0);

/*INSET RESPUESTAS_DADAS*/

INSERT INTO respuestas_dadas VALUES( "Liox", "PRE_01", 0);

/*INSERT JUEGO_RESULTADOS*/

INSERT INTO juego_resultados VALUES( "1", "Nivel_01", 8, 2, "5:00", 1000, 100, "03-10-2020");

/* INSERT RANCKING */

insert into rancking values(1,"Liox",1000,CURRENT_DATE);
insert into rancking values(2,"Leo",900,CURRENT_DATE);
insert into rancking values(3,"Pedro",800,CURRENT_DATE);
insert into rancking values(4,"Juan",700,CURRENT_DATE);
insert into rancking values(5,"Marco",600,CURRENT_DATE);
insert into rancking values(6,"Angel",500,CURRENT_DATE);
insert into rancking values(7,"Juan",400,CURRENT_DATE);
insert into rancking values(8,"Steve",300,CURRENT_DATE);
insert into rancking values(9,"Sebas",200,CURRENT_DATE);
insert into rancking values(10,"Romel",100,CURRENT_DATE);

/*SELECT RESPUESTAS_DADAS*/

SELECT p.cod_pregunta, p.texto_pregunta, p.dificultad_pregunta
FROM respuestas_dadas rd 
INNER JOIN preguntas p ON rd.cod_pregunta = p.cod_pregunta 
INNER JOIN preguntas_nivel pn ON p.cod_pregunta = pn.cod_pregunta
INNER JOIN nivel_juego nj ON pn.nombre_nivel = nj.nombre_nivel
INNER JOIN usuario u ON rd.nombre_cuenta = u.nombre_cuenta
WHERE nj.nombre_nivel = "Nivel_01" AND nj.nivel_juego_activo = 1 AND p.preguntas_activo = 1 AND u.nombre_cuenta = "1"
ORDER BY (rd.cantidad_veces_respondido_correctamente - rd.Cantidad_Veces_Respondido_Incorrectamente), random() LIMIT 10;

/*SELECT RESPUESTA CORRECTA*/

SELECT DISTINCT r.cod_respuesta, r.respuesta_descripcion
FROM preguntas p
INNER JOIN res_pre rp ON p.cod_pregunta = rp.cod_pregunta
INNER JOIN respuesta r ON rp.cod_respuesta = r.cod_respuesta
WHERE r.respuesta_activo = 1 AND p.preguntas_activo = 1 AND p.cod_pregunta = "PRE_01" AND rp.respuesta_correcta = 1
ORDER BY random() 
LIMIT 1;

/*SELECT RESPUESTA CORRECTA*/

SELECT DISTINCT r.cod_respuesta, r.respuesta_descripcion FROM preguntas p INNER JOIN res_pre rp ON p.cod_pregunta = rp.cod_pregunta INNER JOIN respuesta r ON rp.cod_respuesta = r.cod_respuesta WHERE r.respuesta_activo = 1 AND p.preguntas_activo = 1 AND p.cod_pregunta = "PRE_01"  AND rp.respuesta_correcta = 0 ORDER BY random() LIMIT 3;

/*SELECT LOGRO AND TIPO_LOGRO AND LOGRO_NIVEL*/

SELECT l.nombre_tipo_logro, l.nivel_logro, tl.nivel_tipo_logro_max, l.progreso_objetivo_actual, ln.cantidad_objetivo_alcanzar
FROM logro_niveles ln 
INNER JOIN tipo_logro tl ON ln.nombre_tipo_logro = tl.nombre_tipo_logro
INNER JOIN logro l ON tl.nombre_tipo_logro = l.nombre_tipo_logro
INNER JOIN usuario u ON l.nombre_cuenta = u.nombre_cuenta
WHERE l.nivel_logro = ln.nivel_logro AND u.nombre_cuenta = 1 AND l.nombre_tipo_logro = 'DINERO_PUNTOS'

SELECT l.nombre_tipo_logro, l.nivel_logro, tl.nivel_tipo_logro_max, l.progreso_objetivo_actual, ln.cantidad_objetivo_alcanzar
FROM logro_niveles ln 
INNER JOIN tipo_logro tl ON ln.nombre_tipo_logro = tl.nombre_tipo_logro
INNER JOIN logro l ON tl.nombre_tipo_logro = l.nombre_tipo_logro
INNER JOIN usuario u ON l.nombre_cuenta = u.nombre_cuenta
WHERE l.nivel_logro = ln.nivel_logro AND u.nombre_cuenta = 1 AND l.nombre_tipo_logro = 'NIVEL_ALCANZADO'

/*DELETE TABLES*/

DELETE FROM dato_nivel;
DELETE FROM dato_cisco;
DELETE FROM res_pre;
DELETE FROM respuesta;
DELETE FROM respuestas_dadas;
DELETE FROM preguntas_nivel;
DELETE FROM preguntas;
DELETE FROM juego_resultados;
DELETE FROM nivel_desbloqueado;
DELETE FROM tipo_nivel;
DELETE FROM nivel_juego;
DELETE FROM logro;
DELETE FROM tipo_logro;
DELETE FROM logro_niveles;
DELETE FROM estadistica;
DELETE FROM usuario;

/*UPDATE
UPDATE respuestas_dadas
SET cantidad_veces_respondido_correctamente = (cantidad_veces_respondido_correctamente + 1)
WHERE u.nombre_usuario = "1" AND p.cod_pregunta = "PRE_01";

UPDATE respuestas_dadas
SET cantidad_veces_respondido_correctamente = ((SELECT RD.cantidad_veces_respondido_correctamente FROM usuario u INNER JOIN respuestas_dadas rd ON u.nombre_cuenta = rd.nombre_cuenta INNER JOIN preguntas p ON rd.cod_pregunta = p.cod_pregunta WHERE u.nombre_cuenta = "1" AND p.cod_pregunta = "PRE_01") + 1)
WHERE EXISTS (SELECT RD.cantidad_veces_respondido_correctamente FROM usuario u INNER JOIN respuestas_dadas rd ON u.nombre_cuenta = rd.nombre_cuenta INNER JOIN preguntas p ON rd.cod_pregunta = p.cod_pregunta WHERE u.nombre_cuenta = "1" AND p.cod_pregunta = "PRE_01");
*/

/* UPDATE USUARIO */

UPDATE usuario SET nivel_cuenta = (nivel_cuenta + 1), exp_sig_nivel = (exp_sig_nivel + {0}) WHERE nombre_cuenta = {1};

UPDATE usuario SET exp_actual = (exp_actual + {0}), puntos = (puntos + {1}) WHERE nombre_cuenta = {2};

UPDATE usuario SET nivel_cuenta = (nivel_cuenta + 1), exp_sig_nivel = (exp_sig_nivel + (exp_sig_nivel * nivel_cuenta)) WHERE nombre_cuenta = "1";

UPDATE usuario SET nivel_cuenta = (nivel_cuenta + 1), exp_sig_nivel = (exp_sig_nivel + 500) WHERE nombre_cuenta = "1"

/*UPDATE LOGRO*/

UPDATE logro
SET progreso_objetivo_actual = 0
WHERE nombre_cuenta = "1" 
AND nombre_tipo_logro = "DINERO_PUNTOS";

/* UPDATE NIVEL DESBLOQUEADO*/

UPDATE nivel_desbloqueado SET disponible = 1 WHERE nombre_nivel IN (SELECT nd.nombre_nivel FROM nivel_desbloqueado nd INNER JOIN usuario u ON nd.nombre_cuenta = u.nombre_cuenta INNER JOIN nivel_juego nj ON nj.nombre_nivel = nd.nombre_nivel WHERE nd.nombre_cuenta = "1z" AND nd.disponible = 0 AND nj.nivel_requerido <= 5);
/*1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos;

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
	  nombre VARCHAR(255) NOT NULL,
	  edad INT NOT NULL
);
/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO Usuarios (nombre, edad) 
VALUES ('Andrea', 34);

INSERT INTO Usuarios (nombre, edad) 
VALUES ('Pablo', 31);

/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE Usuarios
SET nombre = 'Pablo', edad = 27
WHERE id = 2;

/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM Usuarios
WHERE id = 1;

Nivel de dificultad: Moderado
/*1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE IF NOT EXISTS Ciudades (
    id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	pais VARCHAR(255) NOT NULL
);

/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO Ciudades (nombre, pais)
VALUES ('Tokyo', 'Japon');

INSERT INTO Ciudades (nombre, pais)
VALUES ('Sidney', 'Australia');

INSERT INTO Ciudades (nombre, pais)
VALUES ('Madrid', 'España');

INSERT INTO Ciudades (nombre, pais)
VALUES ('Paris', 'Francia');

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/
ALTER TABLE Usuarios 
ADD COLUMN ciudad_id INT;

ALTER TABLE Usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) REFERENCES Ciudades(id);

/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT Usuarios.nombre AS usuario_nombre, 
Ciudades.nombre AS ciudad_nombre, 
Ciudades.pais
FROM Usuarios
LEFT JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/
SELECT Usuarios.nombre AS usuario_nombre, 
Ciudades.nombre AS ciudad_nombre, 
Ciudades.pais
FROM Usuarios
INNER JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;
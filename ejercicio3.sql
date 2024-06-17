/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE IF NOT EXISTS Productos (
    id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	precio NUMERIC NOT NULL
)

/*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO Productos (nombre, precio) 
VALUES ('linterna', 10.50);
INSERT INTO Productos (nombre, precio) 
VALUES ('manta', 15.75);
INSERT INTO Productos (nombre, precio) 
VALUES ('botas', 20.00);
INSERT INTO Productos (nombre, precio) 
VALUES ('clavos', 25.25);
INSERT INTO Productos (nombre, precio) 
VALUES ('tienda de campaña', 30.50);

/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE Productos
SET precio = 09.20
WHERE nombre = 'linterna';

/*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM Productos
WHERE id = 1;

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/
CREATE TABLE Compras (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL
);

INSERT INTO Compras (usuario_id, producto_id) VALUES (1, 2);
INSERT INTO Compras (usuario_id, producto_id) VALUES (1, 3);
INSERT INTO Compras (usuario_id, producto_id) VALUES (2, 4);
INSERT INTO Compras (usuario_id, producto_id) VALUES (2, 5);


SELECT Usuarios.nombre AS usuario_nombre, Productos.nombre AS producto_nombre
FROM Compras
INNER JOIN Usuarios ON Compras.usuario_id = Usuarios.id
INNER JOIN Productos ON Compras.producto_id = Productos.id;


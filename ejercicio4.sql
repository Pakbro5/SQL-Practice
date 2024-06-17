/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS Pedidos (
    id SERIAL PRIMARY KEY,
	id_usuario SERIAL REFERENCES Usuarios(id),
	id_producto SERIAL REFERENCES Productos(id)
);

/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos.*/
INSERT INTO Pedidos (id_usuario, id_producto) VALUES (1, 2);
INSERT INTO Pedidos (id_usuario, id_producto) VALUES (1, 3);
INSERT INTO Pedidos (id_usuario, id_producto) VALUES (2, 4);
INSERT INTO Pedidos (id_usuario, id_producto) VALUES (2, 5);

/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT Usuarios.nombre AS usuario_nombre, 
COALESCE(Productos.nombre, 'No ha comprado') AS producto_nombre
FROM Usuarios
LEFT JOIN Pedidos ON Usuarios.id = Pedidos.id_usuario
LEFT JOIN Productos ON Pedidos.id_producto = Productos.id;

/*4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/
SELECT Usuarios.nombre AS usuario_nombre,
FROM Usuarios
LEFT JOIN Pedidos ON Usuarios.id = Pedidos.id_usuario;

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE Pedidos
ADD COLUMN cantidad INT;

UPDATE Pedidos
SET cantidad = 2;
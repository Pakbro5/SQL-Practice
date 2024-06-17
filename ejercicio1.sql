/*1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).*/
CREATE TABLE IF NOT EXISTS Clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

/*2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/
INSERT INTO Clientes (id, nombre, email) 
VALUES (1, 'Juan', 'juan@example.com');

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE Clientes 
SET email = 'juan@gmail.com' 
WHERE id = 1;

/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM Clientes
WHERE id = 1;

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).*/
CREATE TABLE IF NOT EXISTS Pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES Clientes(id),
    producto VARCHAR(255) NOT NULL,
    cantidad INT NOT NULL
)
/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/
INSERT INTO Pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2);

/*7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE Pedidos SET cantidad = 3
WHERE id = 1;

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM Pedidos WHERE id = 1;

/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE IF NOT EXISTS Productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
)
/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO Productos (nombre, precio) VALUES
('vaqueros', 59.00),
('gorra', 30.00),
('zapatos', 90.00),
('gafas', 100.00);

/*11. Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM Clientes;

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/
SELECT * FROM Pedidos, Clientes.nombre AS cliente_nombre
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id;

/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
SELECT * FROM Productos
WHERE precio > 50.00;

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/
SELECT * FROM Pedidos
WHERE cantidad >= 5;

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".*/
SELECT * FROM Clientes
WHERE nombre LIKE 'A%';

/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.*/
SELECT Clientes.nombre, COUNT(Pedidos.id) AS total_pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id

/*17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.*/
SELECT Productos.nombre, SUM(Pedidos.cantidad) AS total_pedidos
FROM Productos
LEFT JOIN Pedidos ON Productos.nombre = Pedidos.producto
GROUP BY Productos.nombre

/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE Pedidos
ADD COLUMN fecha DATE;

/*19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/
ALTER TABLE Pedidos
ADD CONSTRAINT FK_productos 
FOREIGN KEY (producto_id) REFERENCES Productos(nombre)

/*20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.*/
SELECT Clientes.nombre AS cliente_nombre, Productos.nombre AS producto_nombre, Pedidos.cantidad 
FROM Pedidos
INNER JOIN Clientes ON Pedidos.cliente_id = Clientes.id 
INNER JOIN Productos ON Pedidos.producto = Productos.nombre

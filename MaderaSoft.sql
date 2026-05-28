CREATE DATABASE madereria;

USE madereria;

CREATE TABLE proveedores(
id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
telefono VARCHAR(20),
direccion VARCHAR(150)
);

CREATE TABLE productos(
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
tipo_madera VARCHAR(100),
medida VARCHAR(50),
precio DECIMAL(10,2),
stock INT,
id_proveedor INT,
FOREIGN KEY(id_proveedor)
REFERENCES proveedores(id_proveedor)
);

CREATE TABLE ventas(
id_venta INT AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
total DECIMAL(10,2)
);

CREATE TABLE detalle_venta(
id_detalle INT AUTO_INCREMENT PRIMARY KEY,
id_venta INT,
id_producto INT,
cantidad INT,
subtotal DECIMAL(10,2),
FOREIGN KEY(id_venta)
REFERENCES ventas(id_venta),
FOREIGN KEY(id_producto)
REFERENCES productos(id_producto)
);
# Código desarrollado

Este proyecto fue desarrollado utilizando MySQL para la creación de una base de datos orientada a la administración de una maderería. El código se encuentra almacenado en un repositorio de GitHub para facilitar su revisión y ejecución.

## Herramientas utilizadas

Durante el desarrollo del proyecto se utilizaron herramientas de apoyo como:

* MySQL Workbench para el diseño y ejecución de la base de datos.
* Git y GitHub para el control de versiones y almacenamiento del proyecto.
* ChatGPT como apoyo para resolver dudas de sintaxis, organización del código y documentación.

## Explicación del código

### Base de datos

```sql id="ql1n3u"
CREATE DATABASE madereria;
USE madereria;
```

Se crea la base de datos llamada `madereria` y posteriormente se selecciona para trabajar sobre ella.

### Tabla proveedores

```sql id="v3rnb0"
CREATE TABLE proveedores(
id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
telefono VARCHAR(20),
direccion VARCHAR(150)
);
```

Esta tabla almacena la información de los proveedores.
Cada proveedor cuenta con un identificador único y datos básicos como nombre, teléfono y dirección.

### Tabla productos

```sql id="y5u8sz"
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
```

La tabla productos guarda la información de los materiales disponibles en la maderería, incluyendo nombre, tipo de madera, medida, precio y existencia.

También se relaciona con la tabla proveedores mediante una llave foránea para identificar quién suministra cada producto.

### Tabla ventas

```sql id="w0plzn"
CREATE TABLE ventas(
id_venta INT AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
total DECIMAL(10,2)
);
```

Aquí se registran las ventas realizadas, almacenando la fecha y el total correspondiente.

### Tabla detalle_venta

```sql id="qz2x3y"
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
```

Esta tabla guarda el detalle de cada venta, relacionando los productos vendidos con la venta correspondiente. También registra la cantidad y subtotal de cada producto.

## Procesos automatizados y manuales

### Automatizados

* Generación automática de IDs con `AUTO_INCREMENT`.
* Relación entre tablas mediante llaves foráneas.
* Control de integridad de datos entre productos, proveedores y ventas.

Estos procesos se automatizaron para reducir errores y mantener organizada la información.

### Manuales

* Registro de proveedores.
* Captura de productos.
* Registro de ventas y cantidades.

Estos procesos requieren intervención del usuario, ya que dependen de información real ingresada en el sistema.

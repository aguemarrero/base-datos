# Tarea 4

### Paso 1: Creación de la BBDD

Crea con el siguente contenido el fichero __supermercado-dump.sql__.

```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO productos (id, nombre, categoria, precio) VALUES 
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
```
  
### Paso 2 Lectura del fichero sql.

Entra en sqlite a través del siguiente comando:

```sql

sqlite3 tarea4.db 
.read supermercado-db.sql
```

Haciendo un __.read__ del fichero __sql__, de nombre __supermercado-db.sql__, realiza la creación e inserción de información de la __BBDD__.

### Paso 3: Responde a las siguientes cuestiones

- Realiza el diagrama __ER__ de la __BBDD__ supermercado.
- Realiza el diagrama __MR__ de la __BBDD__ supermercado.
- Indica si la BBDD esta __normalizada__ hasta la 3ª forma normal, justificando la respuesta.

### Paso 4: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Mostrar todos los productos de la categoría "Bebidas".

```sql
SELECT * FROM productos WHERE categoria = 'Bebidas';
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 16 | Café             | Bebidas   | 5.0    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |
+----+------------------+-----------+--------+
```
- Listar los productos ordenados por precio de forma descendente.

```sql
SELECT * FROM productos ORDER BY precio DESC;
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 5  | Pollo              | Carnes    | 5.5    |
| 16 | Café               | Bebidas   | 5.0    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 9  | Queso              | Lácteos   | 4.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
| 10 | Cereal             | Desayuno  | 3.5    |
| 4  | Manzanas           | Frutas    | 3.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 1  | Arroz              | Alimentos | 2.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 8  | Tomates            | Verduras  | 2.2    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 2  | Leche              | Lácteos   | 1.8    |
| 14 | Galletas           | Snacks    | 1.7    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 3  | Pan                | Panadería | 1.2    |
| 18 | Jabón de Baño      | Higiene   | 1.2    |
| 6  | Huevos             | Lácteos   | 1.0    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
+----+--------------------+-----------+--------+

```
- Calcular el precio total de todos los productos en la tabla "productos".

```sql
SELECT SUM(precio) AS precio_total FROM productos;
+--------------+
| precio_total |
+--------------+
| 52.5         |
+--------------+
```
- Encontrar los productos con un nombre que contenga la letra 'a'.

```sql
SELECT * FROM productos WHERE nombre LIKE '%a%';
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 1  | Arroz            | Alimentos | 2.5    |
| 3  | Pan              | Panadería | 1.2    |
| 4  | Manzanas         | Frutas    | 3.0    |
| 8  | Tomates          | Verduras  | 2.2    |
| 10 | Cereal           | Desayuno  | 3.5    |
| 11 | Papel Higiénico  | Hogar     | 1.5    |
| 14 | Galletas         | Snacks    | 1.7    |
| 15 | Aceite de Oliva  | Cocina    | 4.5    |
| 16 | Café             | Bebidas   | 5.0    |
| 17 | Sopa enlatada    | Conservas | 2.3    |
| 18 | Jabón de Baño    | Higiene   | 1.2    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |
+----+------------------+-----------+--------+
```
- Obtener la cantidad total de productos vendidos en todas las fechas.

```sql
SELECT SUM(cantidad) AS cantidad_total_vendida FROM ventas;
+------------------------+
| cantidad_total_vendida |
+------------------------+
| 43                     |
+------------------------+
```
- Encontrar el producto más caro en cada categoría.

```sql
SELECT categoria,nombre,precio
FROM productos
WHERE precio IN (
SELECT MAX(precio) FROM productos GROUP BY categoria
);
+-----------+--------------------+--------+
| categoria |       nombre       | precio |
+-----------+--------------------+--------+
| Alimentos | Arroz              | 2.5    |
| Panadería | Pan                | 1.2    |
| Frutas    | Manzanas           | 3.0    |
| Carnes    | Pollo              | 5.5    |
| Lácteos   | Yogurt             | 2.0    |
| Verduras  | Tomates            | 2.2    |
| Lácteos   | Queso              | 4.0    |
| Desayuno  | Cereal             | 3.5    |
| Hogar     | Papel Higiénico    | 1.5    |
| Higiene   | Cepillo de Dientes | 2.0    |
| Limpieza  | Detergente         | 2.8    |
| Snacks    | Galletas           | 1.7    |
| Cocina    | Aceite de Oliva    | 4.5    |
| Bebidas   | Café               | 5.0    |
| Conservas | Sopa enlatada      | 2.3    |
| Higiene   | Jabón de Baño      | 1.2    |
+-----------+--------------------+--------+
```
- Listar los productos que no han sido vendidos.

```sql
SELECT * FROM productos
   WHERE id NOT IN (SELECT DISTINCT id_producto FROM ventas);
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 3  | Pan                | Panadería | 1.2    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 9  | Queso              | Lácteos   | 4.0    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
+----+--------------------+-----------+--------+
```
- Calcular el precio promedio de los productos en la categoría "Snacks".

```sql
SELECT AVG(precio) AS precio_promedio FROM productos WHERE categoria = 'Snacks';
+-----------------+
| precio_promedio |
+-----------------+
| 1.7             |
+-----------------+
```
- Encontrar los productos que han sido vendidos más de 5 veces.

```sql
SELECT p.nombre, SUM(v.cantidad) AS total_vendido
 FROM productos p
 JOIN ventas v ON p.id = v.id_producto
 GROUP BY p.id
 HAVING SUM(v.cantidad) >5;
+---------------+---------------+
|    nombre     | total_vendido |
+---------------+---------------+
| Huevos        | 10            |
| Galletas      | 7             |
| Jabón de Baño | 6             |
+---------------+---------------+
```

- Encontrar los productos que tienen un precio menor o igual a 2.

```sql
SELECT * FROM productos WHERE precio <=2;
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 2  | Leche              | Lácteos   | 1.8    |
| 3  | Pan                | Panadería | 1.2    |
| 6  | Huevos             | Lácteos   | 1.0    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 14 | Galletas           | Snacks    | 1.7    |
| 18 | Jabón de Baño      | Higiene   | 1.2    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
+----+--------------------+-----------+--------+
```
- Calcular la cantidad total de ventas para cada fecha.

```sql
SELECT fecha, SUM(cantidad) AS total_vendido FROM ventas GROUP BY fecha;
+------------+---------------+
|   fecha    | total_vendido |
+------------+---------------+
| 2024-01-17 | 11            |
| 2024-01-18 | 16            |
| 2024-01-19 | 10            |
| 2024-01-20 | 6             |
+------------+---------------+
```
- Listar los productos cuyo nombre comienza con la letra 'P'.

```sql
SELECT * FROM productos WHERE nombre Like 'P%';
+----+-----------------+-----------+--------+
| id |     nombre      | categoria | precio |
+----+-----------------+-----------+--------+
| 3  | Pan             | Panadería | 1.2    |
| 5  | Pollo           | Carnes    | 5.5    |
| 11 | Papel Higiénico | Hogar     | 1.5    |
+----+-----------------+-----------+--------+
```

- Mostrar los productos que fueron vendidos en la fecha '__2024-01-18__'.

```sql
SELECT p.nombre FROM productos p
    JOIN ventas v ON p.id = v.id_producto
    WHERE v.fecha = '2024-01-18';
+---------+
| nombre  |
+---------+
| Huevos  |
| Tomates |
| Cereal  |
+---------+
```
- Calcular el total de ventas para cada producto.

```sql
SELECT p.nombre, SUM(v.cantidad*p.precio) AS total_ventas
 FROM productos p
 JOIN ventas v ON p.id = v.id_producto
 GROUP BY p.id;
+---------------+--------------+
|    nombre     | total_ventas |
+---------------+--------------+
| Arroz         | 12.5         |
| Leche         | 5.4          |
| Manzanas      | 6.0          |
| Pollo         | 5.5          |
| Huevos        | 10.0         |
| Tomates       | 8.8          |
| Cereal        | 7.0          |
| Galletas      | 11.9         |
| Café          | 15.0         |
| Jabón de Baño | 7.2          |
+---------------+--------------+
```
- Encontrar los productos con un precio entre 3 y 4.

```sql
SELECT * FROM productos WHERE precio BETWEEN 3 AND 4;
+----+----------+-----------+--------+
| id |  nombre  | categoria | precio |
+----+----------+-----------+--------+
| 4  | Manzanas | Frutas    | 3.0    |
| 9  | Queso    | Lácteos   | 4.0    |
| 10 | Cereal   | Desayuno  | 3.5    |
| 20 | Cerveza  | Bebidas   | 3.8    |
+----+----------+-----------+--------+
```

</div>
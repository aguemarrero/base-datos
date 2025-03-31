# Tarea 7

## Pasos a seguir:

1. Realizar la lectura de la base de datos a través del fichero base-datos-clientes2.sql
```sql
sqlite3 tarea7.db
.read base-datos-clientes2.sql
.tables
clientes  coches    ventas
```

```sql
select * from clientes;
+------------+-----------------+------+----------------+
| id_cliente |     nombre      | edad |   direccion    |
+------------+-----------------+------+----------------+
| 1          | Juan Pérez      | 30   | Calle A #123   |
| 2          | María Gómez     | 25   | Avenida B #456 |
| 3          | Carlos López    | 35   | Calle C #789   |
| 4          | Ana Martínez    | 28   | Avenida D #101 |
| 5          | Pedro Rodríguez | 40   | Calle E #234   |
| 6          | Laura Sánchez   | 32   | Avenida F #567 |
| 7          | Miguel González | 27   | Calle G #890   |
| 8          | Isabel Díaz     | 38   | Avenida H #111 |
| 9          | Francisco Ruiz  | 33   | Calle I #222   |
| 10         | Elena Torres    | 29   | Avenida J #333 |
| 11         | Juan Pérez      | 30   | Calle A #123   |
| 12         | María Gómez     | 25   | Avenida B #456 |
| 13         | Carlos López    | 35   | Calle C #789   |
| 14         | Ana Martínez    | 28   | Avenida D #101 |
| 15         | Pedro Rodríguez | 40   | Calle E #234   |
| 16         | Laura Sánchez   | 32   | Avenida F #567 |
| 17         | Miguel González | 27   | Calle G #890   |
| 18         | Isabel Díaz     | 38   | Avenida H #111 |
| 19         | Francisco Ruiz  | 33   | Calle I #222   |
| 20         | Elena Torres    | 29   | Avenida J #333 |
| 21         | Juan Pérez      | 30   | Calle A #123   |
| 22         | María Gómez     | 25   | Avenida B #456 |
| 23         | Carlos López    | 35   | Calle C #789   |
| 24         | Ana Martínez    | 28   | Avenida D #101 |
| 25         | Pedro Rodríguez | 40   | Calle E #234   |
| 26         | Laura Sánchez   | 32   | Avenida F #567 |
| 27         | Miguel González | 27   | Calle G #890   |
| 28         | Isabel Díaz     | 38   | Avenida H #111 |
| 29         | Francisco Ruiz  | 33   | Calle I #222   |
| 30         | Elena Torres    | 29   | Avenida J #333 |
+------------+-----------------+------+----------------+
sqlite> select* from coches;
+----------+----------------+------------+------+---------+
| id_coche |     modelo     |   marca    | año  | precio  |
+----------+----------------+------------+------+---------+
| 1        | Sedán 2022     | Toyota     | 2022 | 25000.0 |
| 2        | Hatchback 2021 | Honda      | 2021 | 22000.0 |
| 3        | SUV 2023       | Ford       | 2023 | 30000.0 |
| 4        | Coupé 2022     | Chevrolet  | 2022 | 28000.0 |
| 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 |
| 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 |
| 7        | Híbrido 2022   | Hyundai    | 2022 | 27000.0 |
| 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 |
| 9        | Pickup 2022    | Ram        | 2022 | 31000.0 |
| 10       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 |
| 11       | Sedán 2022     | Toyota     | 2022 | 25000.0 |
| 12       | Hatchback 2021 | Honda      | 2021 | 22000.0 |
| 13       | SUV 2023       | Ford       | 2023 | 30000.0 |
| 14       | Coupé 2022     | Chevrolet  | 2022 | 28000.0 |
| 15       | Camioneta 2023 | Nissan     | 2023 | 32000.0 |
| 16       | Compacto 2021  | Volkswagen | 2021 | 20000.0 |
| 17       | Híbrido 2022   | Hyundai    | 2022 | 27000.0 |
| 18       | Deportivo 2023 | Mazda      | 2023 | 35000.0 |
| 19       | Pickup 2022    | Ram        | 2022 | 31000.0 |
| 20       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 |
| 21       | Sedán 2022     | Toyota     | 2022 | 25000.0 |
| 22       | Hatchback 2021 | Honda      | 2021 | 22000.0 |
| 23       | SUV 2023       | Ford       | 2023 | 30000.0 |
| 24       | Coupé 2022     | Chevrolet  | 2022 | 28000.0 |
| 25       | Camioneta 2023 | Nissan     | 2023 | 32000.0 |
| 26       | Compacto 2021  | Volkswagen | 2021 | 20000.0 |
| 27       | Híbrido 2022   | Hyundai    | 2022 | 27000.0 |
| 28       | Deportivo 2023 | Mazda      | 2023 | 35000.0 |
| 29       | Pickup 2022    | Ram        | 2022 | 31000.0 |
| 30       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 |
+----------+----------------+------------+------+---------+
sqlite> select * from ventas;
+----------+------------+----------+-------------+
| id_venta | id_cliente | id_coche | fecha_venta |
+----------+------------+----------+-------------+
| 1        | 1          | 1        | 2023-01-15  |
| 2        | 2          | 2        | 2023-02-20  |
| 3        | 3          | 3        | 2023-03-25  |
| 4        | 4          | 4        | 2023-04-10  |
| 5        | 5          | 5        | 2023-05-05  |
| 6        | 6          | 6        | 2023-06-15  |
| 7        | 7          | 7        | 2023-07-20  |
| 8        | 8          | 8        | 2023-08-25  |
| 9        | 10         | 10       | 2023-10-05  |
| 10       | 1          | 1        | 2023-01-15  |
| 11       | 2          | 2        | 2023-02-20  |
| 12       | 3          | 3        | 2023-03-25  |
| 13       | 4          | 4        | 2023-04-10  |
| 14       | 5          | 5        | 2023-05-05  |
| 15       | 6          | 6        | 2023-06-15  |
| 16       | 7          | 7        | 2023-07-20  |
| 17       | 8          | 8        | 2023-08-25  |
| 18       | 10         | 10       | 2023-10-05  |
| 19       | 1          | 1        | 2023-01-15  |
| 20       | 2          | 2        | 2023-02-20  |
| 21       | 3          | 3        | 2023-03-25  |
| 22       | 4          | 4        | 2023-04-10  |
| 23       | 5          | 5        | 2023-05-05  |
| 24       | 6          | 6        | 2023-06-15  |
| 25       | 7          | 7        | 2023-07-20  |
| 26       | 8          | 8        | 2023-08-25  |
| 27       | 10         | 10       | 2023-10-05  |
+----------+------------+----------+-------------+
```

-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?

```sql
 select coches.modelo,
   ...> coches.precio,
   ...> clientes.nombre
   ...> FROM ventas
   ...> JOIN coches ON ventas.id_coche = coches.id_coche
   ...> JOIN clientes ON ventas.id_cliente = clientes.id_cliente;
+----------------+---------+-----------------+
|     modelo     | precio  |     nombre      |
+----------------+---------+-----------------+
| Sedán 2022     | 25000.0 | Juan Pérez      |
| Hatchback 2021 | 22000.0 | María Gómez     |
| SUV 2023       | 30000.0 | Carlos López    |
| Coupé 2022     | 28000.0 | Ana Martínez    |
| Camioneta 2023 | 32000.0 | Pedro Rodríguez |
| Compacto 2021  | 20000.0 | Laura Sánchez   |
| Híbrido 2022   | 27000.0 | Miguel González |
| Deportivo 2023 | 35000.0 | Isabel Díaz     |
| Eléctrico 2021 | 40000.0 | Elena Torres    |
| Sedán 2022     | 25000.0 | Juan Pérez      |
| Hatchback 2021 | 22000.0 | María Gómez     |
| SUV 2023       | 30000.0 | Carlos López    |
| Coupé 2022     | 28000.0 | Ana Martínez    |
| Camioneta 2023 | 32000.0 | Pedro Rodríguez |
| Compacto 2021  | 20000.0 | Laura Sánchez   |
| Híbrido 2022   | 27000.0 | Miguel González |
| Deportivo 2023 | 35000.0 | Isabel Díaz     |
| Eléctrico 2021 | 40000.0 | Elena Torres    |
| Sedán 2022     | 25000.0 | Juan Pérez      |
| Hatchback 2021 | 22000.0 | María Gómez     |
| SUV 2023       | 30000.0 | Carlos López    |
| Coupé 2022     | 28000.0 | Ana Martínez    |
| Camioneta 2023 | 32000.0 | Pedro Rodríguez |
| Compacto 2021  | 20000.0 | Laura Sánchez   |
| Híbrido 2022   | 27000.0 | Miguel González |
| Deportivo 2023 | 35000.0 | Isabel Díaz     |
| Eléctrico 2021 | 40000.0 | Elena Torres    |
+----------------+---------+-----------------+
```
-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
```sql
 SELECT DISTINCT clientes.nombre
   ...> FROM ventas
   ...> JOIN coches ON ventas.id_coche = coches.id_coche
   ...> JOIN clientes ON ventas.id_cliente = clientes.id_cliente
   ...> WHERE coches.precio > (
(x1...>     SELECT AVG(coches.precio)
(x1...>     FROM ventas
(x1...>     JOIN coches ON ventas.id_coche = coches.id_coche
(x1...> );
+-----------------+
|     nombre      |
+-----------------+
| Carlos López    |
| Pedro Rodríguez |
| Isabel Díaz     |
| Elena Torres    |
+-----------------+
```
-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
```sql
 SELECT modelo, precio FROM coches
   ...> WHERE id_coche NOT IN (
(x1...> SELECT id_coche FROM ventas);
+----------------+---------+
|     modelo     | precio  |
+----------------+---------+
| Pickup 2022    | 31000.0 |
| Sedán 2022     | 25000.0 |
| Hatchback 2021 | 22000.0 |
| SUV 2023       | 30000.0 |
| Coupé 2022     | 28000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Híbrido 2022   | 27000.0 |
| Deportivo 2023 | 35000.0 |
| Pickup 2022    | 31000.0 |
| Eléctrico 2021 | 40000.0 |
| Sedán 2022     | 25000.0 |
| Hatchback 2021 | 22000.0 |
| SUV 2023       | 30000.0 |
| Coupé 2022     | 28000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Híbrido 2022   | 27000.0 |
| Deportivo 2023 | 35000.0 |
| Pickup 2022    | 31000.0 |
| Eléctrico 2021 | 40000.0 |
+----------------+---------+
```
-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

```sql
SELECT SUM(coches.precio) AS total_gastado FROM ventas
JOIN coches ON ventas.id_coche = coches.id_coche;
+---------------+
| total_gastado |
+---------------+
| 777000.0      |
+---------------+
```
-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?
```sql
 SELECT
   ...> coches.modelo,
   ...> ventas.fecha_venta,
   ...> clientes.nombre
   ...> FROM ventas
   ...> JOIN coches ON ventas.id_coche = coches.id_coche
   ...> JOIN clientes ON ventas.id_cliente = clientes.id_cliente
   ...> ORDER BY ventas.fecha_venta DESC;
+----------------+-------------+-----------------+
|     modelo     | fecha_venta |     nombre      |
+----------------+-------------+-----------------+
| Eléctrico 2021 | 2023-10-05  | Elena Torres    |
| Eléctrico 2021 | 2023-10-05  | Elena Torres    |
| Eléctrico 2021 | 2023-10-05  | Elena Torres    |
| Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
| Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
| Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
| Híbrido 2022   | 2023-07-20  | Miguel González |
| Híbrido 2022   | 2023-07-20  | Miguel González |
| Híbrido 2022   | 2023-07-20  | Miguel González |
| Compacto 2021  | 2023-06-15  | Laura Sánchez   |
| Compacto 2021  | 2023-06-15  | Laura Sánchez   |
| Compacto 2021  | 2023-06-15  | Laura Sánchez   |
| Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
| Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
| Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
| Coupé 2022     | 2023-04-10  | Ana Martínez    |
| Coupé 2022     | 2023-04-10  | Ana Martínez    |
| Coupé 2022     | 2023-04-10  | Ana Martínez    |
| SUV 2023       | 2023-03-25  | Carlos López    |
| SUV 2023       | 2023-03-25  | Carlos López    |
| SUV 2023       | 2023-03-25  | Carlos López    |
| Hatchback 2021 | 2023-02-20  | María Gómez     |
| Hatchback 2021 | 2023-02-20  | María Gómez     |
| Hatchback 2021 | 2023-02-20  | María Gómez     |
| Sedán 2022     | 2023-01-15  | Juan Pérez      |
| Sedán 2022     | 2023-01-15  | Juan Pérez      |
| Sedán 2022     | 2023-01-15  | Juan Pérez      |
+----------------+-------------+-----------------+
```
-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
```sql
SELECT DISTINCT modelo, precio
   ...> FROM coches
   ...> WHERE precio = (
(x1...> SELECT MAX(precio)
(x1...> FROM coches
(x1...> );
+----------------+---------+
|     modelo     | precio  |
+----------------+---------+
| Eléctrico 2021 | 40000.0 |
+----------------+---------+
```
-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
```sql
SELECT
   ...>     clientes.nombre,
   ...>     COUNT(ventas.id_coche) AS coches_comprados
   ...> FROM ventas
   ...> JOIN clientes ON ventas.id_cliente = clientes.id_cliente
   ...> GROUP BY ventas.id_cliente;
+-----------------+------------------+
|     nombre      | coches_comprados |
+-----------------+------------------+
| Juan Pérez      | 3                |
| María Gómez     | 3                |
| Carlos López    | 3                |
| Ana Martínez    | 3                |
| Pedro Rodríguez | 3                |
| Laura Sánchez   | 3                |
| Miguel González | 3                |
| Isabel Díaz     | 3                |
| Elena Torres    | 3                |
+-----------------+------------------+
```
-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
```sql
SELECT DISTINCT clientes.nombre
   ...> FROM ventas
   ...> JOIN coches ON ventas.id_coche = coches.id_coche
   ...> JOIN clientes ON ventas.id_cliente = clientes.id_cliente
   ...> WHERE coches.marca = 'Toyota';
+------------+
|   nombre   |
+------------+
| Juan Pérez |
+------------+
```
-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo? .
```sql
SELECT AVG(clientes.edad) AS promedio_edad
   ...> FROM ventas
   ...> JOIN coches ON ventas.id_coche = coches.id_coche
   ...> JOIN clientes ON ventas.id_cliente = clientes.id_cliente
   ...> WHERE coches.precio > 25000;
+------------------+
|  promedio_edad   |
+------------------+
| 32.8333333333333 |
+------------------+
```
-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
```sql
SELECT coches.modelo, coches.precio
   ...> FROM ventas
   ...> JOIN coches ON ventas.id_coche = coches.id_coche
   ...> JOIN clientes ON ventas.id_cliente = clientes.id_cliente
   ...> WHERE clientes.edad > 30;
+----------------+---------+
|     modelo     | precio  |
+----------------+---------+
| SUV 2023       | 30000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Deportivo 2023 | 35000.0 |
| SUV 2023       | 30000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Deportivo 2023 | 35000.0 |
| SUV 2023       | 30000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Deportivo 2023 | 35000.0 |
+----------------+---------+
```
-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
```sql
SELECT coches.modelo, coches.marca, ventas.fecha_venta
   ...> FROM ventas
   ...> JOIN coches ON ventas.id_coche = coches.id_coche
   ...> WHERE strftime('%Y', ventas.fecha_venta) = '2022';
   --sin resultado
```
-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG
```sql
 SELECT modelo, marca, precio
   ...> FROM coches
   ...> WHERE precio > (
(x1...>     SELECT AVG(coches.precio)
(x1...>     FROM ventas
(x1...>     JOIN coches ON ventas.id_coche = coches.id_coche
(x1...>     JOIN clientes ON ventas.id_cliente = clientes.id_cliente
(x1...>     WHERE clientes.edad < 30
(x1...> );
+----------------+--------+---------+
|     modelo     | marca  | precio  |
+----------------+--------+---------+
| SUV 2023       | Ford   | 30000.0 |
| Camioneta 2023 | Nissan | 32000.0 |
| Deportivo 2023 | Mazda  | 35000.0 |
| Pickup 2022    | Ram    | 31000.0 |
| Eléctrico 2021 | Tesla  | 40000.0 |
| SUV 2023       | Ford   | 30000.0 |
| Camioneta 2023 | Nissan | 32000.0 |
| Deportivo 2023 | Mazda  | 35000.0 |
| Pickup 2022    | Ram    | 31000.0 |
| Eléctrico 2021 | Tesla  | 40000.0 |
| SUV 2023       | Ford   | 30000.0 |
| Camioneta 2023 | Nissan | 32000.0 |
| Deportivo 2023 | Mazda  | 35000.0 |
| Pickup 2022    | Ram    | 31000.0 |
| Eléctrico 2021 | Tesla  | 40000.0 |
+----------------+--------+---------+
```
-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

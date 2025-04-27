-- ----------------------------------------
-- Consultas sobre una tabla
-- 0,2 puntos la correcta. Total = 1,4 puntos
-- ----------------------------------------

-- 1.- Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados
-- por la fecha de realización, mostrando en primer lugar las compras más recientes.
select * from compra order by fecha DESC;
+----+---------+------------+---------------+------------------+
| id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+---------+------------+---------------+------------------+
| 15 | 370.85  | 2022-03-11 | 1             | 5                |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                |
| 13 | 545.75  | 2022-01-25 | 6             | 1                |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 1  | 150.5   | 2020-10-05 | 5             | 2                |
| 3  | 65.26   | 2020-10-05 | 2             | 1                |
| 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                |
| 14 | 145.82  | 2020-02-02 | 6             | 1                |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                |
| 2  | 270.65  | 2019-09-10 | 1             | 5                |
| 4  | 110.5   | 2019-08-17 | 8             | 3                |
| 11 | 75.29   | 2019-08-17 | 3             | 7                |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                |
| 10 | 250.45  | 2018-06-27 | 8             | 2                |
+----+---------+------------+---------------+------------------+
-- 2. Devuelve todos los datos de los dos compras de mayor valor.
SELECT * from compra order by total DESC LIMIT 2;
+----+--------+------------+---------------+------------------+
| id | total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+------------+---------------+------------------+
| 7  | 5760.0 | 2018-09-10 | 2             | 1                |
| 12 | 3045.6 | 2020-04-25 | 2             | 1                |
+----+--------+------------+---------------+------------------+
-- 3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT c.id from consumidor c, compra co where c.id = co.id_consumidor;
+----+
| id |
+----+
| 5  |
| 1  |
| 2  |
| 8  |
| 7  |
| 4  |
| 3  |
| 6  |
+----+
-- 4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,
-- cuya cantidad total sea superior a 500€.
SELECT * FROM compra where fecha REGEXP '2020'  AND total > 500;
+----+---------+------------+---------------+------------------+
| id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+---------+------------+---------------+------------------+
| 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                |
+----+---------+------------+---------------+------------------+
-- 5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.
select s.apellido1, s.apellido2, s.nombre from suministrador s where categoria BETWEEN 0.11 AND 0.15;
+-----------+-----------+---------+
| apellido1 | apellido2 | nombre  |
+-----------+-----------+---------+
| Sáez      | Vega      | Daniel  |
| Gómez     | López     | Juan    |
| Flores    | Salas     | Diego   |
| Herrera   | Gil       | Marta   |
| Carretero | Ortega    | Antonio |
| Domínguez | Hernández | Manuel  |
| Vega      | Hernández | Antonio |
+-----------+-----------+---------+
-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.
 SELECT MAX(categoria) AS Máxima_comision from suministrador;
+-----------------+
| Máxima_comision |
+-----------------+
| 0.15            |
+-----------------+
-- 7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.
select c.id, c.apellido1, c.nombre from consumidor c where c.apellido2 IS NOT NULL ORDER BY apellido1;
+----+-----------+-----------+
| id | apellido1 |  nombre   |
+----+-----------+-----------+
| 5  | Loyola    | Marcos    |
| 9  | López     | Guillermo |
| 1  | Rivero    | Aarón     |
| 3  | Rubio     | Adolfo    |
| 8  | Ruiz      | Pepe      |
| 2  | Salas     | Adela     |
| 6  | Santana   | María     |
| 10 | Santana   | Daniel    |
+----+-----------+-----------+
-- (Consultas Multitabla Where)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total =  2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
select DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 from consumidor c, compra co where c.id =co.id_consumidor ORDER BY c.apellido1;
+----+--------+-----------+-----------+
| id | nombre | apellido1 | apellido2 |
+----+--------+-----------+-----------+
| 5  | Marcos | Loyola    | Méndez    |
| 1  | Aarón  | Rivero    | Gómez     |
| 3  | Adolfo | Rubio     | Flores    |
| 8  | Pepe   | Ruiz      | Santana   |
| 7  | Pilar  | Ruiz      |           |
| 2  | Adela  | Salas     | Díaz      |
| 6  | María  | Santana   | Moreno    |
| 4  | Adrián | Suárez    |           |
+----+--------+-----------+-----------+
-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select c.*, co.* from consumidor c, compra co where c.id = co.id_consumidor ORDER BY c.apellido1, c.apellido2, c.nombre;
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
SELECT c.* , s.* from compra c, suministrador s where c.id_suministrador = s.id ORDER BY s.apellido1, s.apellido2, s.nombre;
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
SELECT c.*,  co.*, s.apellido1, s.apellido2 from consumidor c, suministrador s, compra co where c.id = co.id_consumidor AND co.id_suministrador = s.id ORDER BY apellido1;
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+-----------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador | apellido1 | apellido2 |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+-----------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                | Gómez     | López     |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                | Gómez     | López     |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                | Carretero | Ortega    |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                | Carretero | Ortega    |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                | Carretero | Ortega    |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                | Vega      | Hernández |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                | Flores    | Salas     |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                | Sáez      | Vega      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                | Flores    | Salas     |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                | Gómez     | López     |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                | Sáez      | Vega      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                | Sáez      | Vega      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                | Sáez      | Vega      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                | Sáez      | Vega      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                | Sáez      | Vega      |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                | Domínguez | Hernández |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+-----------+-----------+
-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select c.* from consumidor c, compra co where c.id = co.id_consumidor AND co.fecha REGEXP '2020' AND  co.total BETWEEN 300 AND 1000;
+----+--------+-----------+-----------+---------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+--------+-----------+-----------+---------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
+----+--------+-----------+-----------+---------+-----------+
-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
SELECT s.nombre , s.apellido1 , s.apellido2 from suministrador s, compra c, consumidor co where s.id = c.id_suministrador AND c.id_consumidor = co.id AND co.nombre REGEXP 'María' AND co.apellido1 REGEXP 'Santana' AND co.apellido2 REGEXP 'Moreno';
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Daniel | Sáez      | Vega      |
| Daniel | Sáez      | Vega      |
+--------+-----------+-----------+
-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
Select  DISTINCT c.nombre , c.apellido1, c.apellido2 FROM consumidor c, compra co, suministrador s where c.id = co.id_consumidor AND co.id_suministrador = s.id AND s.nombre REGEXP 'Daniel' AND s.apellido1 REGEXP 'Sáez' ORDER BY c.apellido1, c.apellido2, c.nombre;
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Pilar  | Ruiz      |           |
| Adela  | Salas     | Díaz      |
| María  | Santana   | Moreno    |
+--------+-----------+-----------+
-- (Consultas Multitabla Join)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total = 2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
select DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 from consumidor c JOIN  compra co ON c.id =co.id_consumidor ORDER BY c.apellido1;
+----+--------+-----------+-----------+
| id | nombre | apellido1 | apellido2 |
+----+--------+-----------+-----------+
| 5  | Marcos | Loyola    | Méndez    |
| 1  | Aarón  | Rivero    | Gómez     |
| 3  | Adolfo | Rubio     | Flores    |
| 8  | Pepe   | Ruiz      | Santana   |
| 7  | Pilar  | Ruiz      |           |
| 2  | Adela  | Salas     | Díaz      |
| 6  | María  | Santana   | Moreno    |
| 4  | Adrián | Suárez    |           |
+----+--------+-----------+-----------+

-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select c.*, co.* from consumidor c JOIN compra co ON c.id = co.id_consumidor ORDER BY c.apellido1, c.apellido2, c.nombre;
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
SELECT c.* , s.* from compra c JOIN suministrador s ON c.id_suministrador = s.id ORDER BY s.apellido1, s.apellido2, s.nombre;
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
SELECT c.*,  co.*, s.apellido1, s.apellido2 from consumidor c JOIN compra co ON co.id_consumidor = c.id JOIN suministrador s ON s.id = co.id_suministrador;
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+-----------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador | apellido1 | apellido2 |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+-----------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                | Gómez     | López     |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                | Carretero | Ortega    |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                | Sáez      | Vega      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                | Flores    | Salas     |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                | Gómez     | López     |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                | Sáez      | Vega      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                | Sáez      | Vega      |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                | Domínguez | Hernández |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                | Flores    | Salas     |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                | Gómez     | López     |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                | Vega      | Hernández |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                | Sáez      | Vega      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                | Sáez      | Vega      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                | Sáez      | Vega      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                | Carretero | Ortega    |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                | Carretero | Ortega    |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+-----------+-----------+
-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
 select c.* from consumidor c JOIN compra co ON c.id = co.id_consumidor AND co.fecha REGEXP '2020' AND  co.total BETWEEN 300 AND 1000;
+----+--------+-----------+-----------+---------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+--------+-----------+-----------+---------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
+----+--------+-----------+-----------+---------+-----------+
-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
 SELECT s.nombre , s.apellido1 , s.apellido2 from suministrador s JOIN compra c ON s.id = c.id_suministrador JOIN consumidor co  ON c.id_consumidor = co.id AND co.nombre REGEXP 'María' AND co.apellido1 REGEXP 'Santana' AND co.apellido2 REGEXP 'Moreno';
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Daniel | Sáez      | Vega      |
| Daniel | Sáez      | Vega      |
+--------+-----------+-----------+
-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
Select  DISTINCT c.nombre , c.apellido1, c.apellido2 FROM consumidor c, compra co ON  c.id = co.id_consumidor  JOIN suministrador s ON co.id_suministrador = s.id AND s.nombre REGEXP 'Daniel' AND s.apellido1 REGEXP 'Sáez' ORDER BY c.apellido1, c.apellido2, c.nombre;
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Pilar  | Ruiz      |           |
| Adela  | Salas     | Díaz      |
| María  | Santana   | Moreno    |
+--------+-----------+-----------+

-- ---------------------------
-- Consultas resumen (funciones)
-- -----------------------------------------------
-- 0,2 puntos la correcta. (1-6) 1,2 puntos
-- 0,25 puntos la correcta. (7-10) 1 punto.
-- Total = 2,2 puntos
-- -----------------------------------------------

-- 1. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.
select avg(total) AS total_compra from compra;
+--------------+
| total_compra |
+--------------+
| 1312.051875  |
+--------------+
-- 2. Calcula el número total de suministradores distintos que aparecen en la tabla compra.
Select count( DISTINCT id_suministrador) AS total_suministradores FROM compra;
+-----------------------+
| total_suministradores |
+-----------------------+
| 6                     |
+-----------------------+
-- 3. Calcula el número total de consumidores que aparecen en la tabla consumidor.
SELECT count(*) AS consumidores_totales from consumidor;
+----------------------+
| consumidores_totales |
+----------------------+
| 10                   |
+----------------------+
-- 4. Calcula cuál es la mayor cantidad que aparece en la tabla compra.
select MAX(total) AS mayor_cantidad from compra;
+----------------+
| mayor_cantidad |
+----------------+
| 5760.0         |
+----------------+
-- 5. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.
select ciudad, MAX(categoria) from consumidor GROUP BY ciudad;
+---------+----------------+
| ciudad  | MAX(categoria) |
+---------+----------------+
| Almería | 200            |
| Cádiz   | 100            |
| Granada | 225            |
| Huelva  | 200            |
| Jaén    | 300            |
| Sevilla | 300            |
+---------+----------------+
-- 6. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores.
-- Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.
-- Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total)
   ...> FROM consumidor c JOIN compra co ON c.id = co.id_consumidor
   ...> GROUP BY c.id, co.fecha;
+----+--------+-----------+-----------+------------+---------------+
| id | nombre | apellido1 | apellido2 |   fecha    | MAX(co.total) |
+----+--------+-----------+-----------+------------+---------------+
| 1  | Aarón  | Rivero    | Gómez     | 2019-09-10 | 270.65        |
| 1  | Aarón  | Rivero    | Gómez     | 2022-03-11 | 2389.23       |
| 2  | Adela  | Salas     | Díaz      | 2018-09-10 | 5760.0        |
| 2  | Adela  | Salas     | Díaz      | 2020-04-25 | 3045.6        |
| 2  | Adela  | Salas     | Díaz      | 2020-10-05 | 65.26         |
| 3  | Adolfo | Rubio     | Flores    | 2019-08-17 | 75.29         |
| 4  | Adrián | Suárez    |           | 2020-10-10 | 1983.43       |
| 5  | Marcos | Loyola    | Méndez    | 2020-09-10 | 948.5         |
| 5  | Marcos | Loyola    | Méndez    | 2020-10-05 | 150.5         |
| 6  | María  | Santana   | Moreno    | 2020-02-02 | 145.82        |
| 6  | María  | Santana   | Moreno    | 2022-01-25 | 545.75        |
| 7  | Pilar  | Ruiz      |           | 2019-07-27 | 2400.6        |
| 8  | Pepe   | Ruiz      | Santana   | 2018-06-27 | 250.45        |
| 8  | Pepe   | Ruiz      | Santana   | 2019-08-17 | 110.5         |
| 8  | Pepe   | Ruiz      | Santana   | 2019-10-10 | 2480.4        |
+----+--------+-----------+-----------+------------+---------------+
-- 7. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores,
-- teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total)
   ...> FROM consumidor c JOIN compra co ON c.id = co.id_consumidor
   ...> GROUP BY c.id, co.fecha
   ...> HAVING MAX(co.total) > 2000;
+----+--------+-----------+-----------+------------+---------------+
| id | nombre | apellido1 | apellido2 |   fecha    | MAX(co.total) |
+----+--------+-----------+-----------+------------+---------------+
| 1  | Aarón  | Rivero    | Gómez     | 2022-03-11 | 2389.23       |
| 2  | Adela  | Salas     | Díaz      | 2018-09-10 | 5760.0        |
| 2  | Adela  | Salas     | Díaz      | 2020-04-25 | 3045.6        |
| 7  | Pilar  | Ruiz      |           | 2019-07-27 | 2400.6        |
| 8  | Pepe   | Ruiz      | Santana   | 2019-10-10 | 2480.4        |
+----+--------+-----------+-----------+------------+---------------+ 
-- 8. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17.
-- Muestra el identificador del suministrador, nombre, apellidos y total.
 select MAX(co.total) AS máximo_valor, s.id, s.nombre, s.apellido1 FROM compra co JOIN suministrador s ON s.id = co.id_suministrador WHERE  fecha REGEXP '2020-08-17';
+--------------+----+--------+-----------+
| máximo_valor | id | nombre | apellido1 |
+--------------+----+--------+-----------+
|              |    |        |           |
+--------------+----+--------+-----------+
-- 9. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores.
-- Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra.
-- Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.
select c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id_consumidor) from compra co JOIN consumidor c ON c.id= co.id_consumidor GROUP BY c.id;
+----+--------+-----------+-----------+-------------------------+
| id | nombre | apellido1 | apellido2 | COUNT(co.id_consumidor) |
+----+--------+-----------+-----------+-------------------------+
| 1  | Aarón  | Rivero    | Gómez     | 3                       |
| 2  | Adela  | Salas     | Díaz      | 3                       |
| 3  | Adolfo | Rubio     | Flores    | 1                       |
| 4  | Adrián | Suárez    |           | 1                       |
| 5  | Marcos | Loyola    | Méndez    | 2                       |
| 6  | María  | Santana   | Moreno    | 2                       |
| 7  | Pilar  | Ruiz      |           | 1                       |
| 8  | Pepe   | Ruiz      | Santana   | 3                       |
+----+--------+-----------+-----------+-------------------------+
-- 10. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.
select c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id_consumidor) from consumidor c JOIN compra co ON co.id_consumidor = c.id WHERE co.fecha REGEXP '2020' GROUP BY c.id;
+----+--------+-----------+-----------+-------------------------+
| id | nombre | apellido1 | apellido2 | COUNT(co.id_consumidor) |
+----+--------+-----------+-----------+-------------------------+
| 2  | Adela  | Salas     | Díaz      | 2                       |
| 4  | Adrián | Suárez    |           | 1                       |
| 5  | Marcos | Loyola    | Méndez    | 2                       |
| 6  | María  | Santana   | Moreno    | 1                       |
+----+--------+-----------+-----------+-------------------------+
-- ---------------------
-- Subconsultas
-- -----------------------------------------------
-- 0,2 puntos la correcta (1-5).
-- 0,3 puntos la correcta (6-9).
-- Total = 2,2 puntos
-- -----------------------------------------------

--- Con operadores básicos de comparación

-- 1. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select * from compra where id_consumidor = (SELECT id FROM consumidor where nombre REGEXP 'Adela' AND apellido1 REGEXP 'Salas');
+----+--------+------------+---------------+------------------+
| id | total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+------------+---------------+------------------+
| 3  | 65.26  | 2020-10-05 | 2             | 1                |
| 7  | 5760.0 | 2018-09-10 | 2             | 1                |
| 12 | 3045.6 | 2020-04-25 | 2             | 1                |
+----+--------+------------+---------------+------------------+
-- 2. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.
select fecha , MIN(total) AS Mínimo_Importe FROM compra where id_consumidor = (select id from consumidor where nombre regexp 'Pepe' AND apellido1 REGEXP 'Ruiz');
+------------+----------------+
|   fecha    | Mínimo_Importe |
+------------+----------------+
| 2019-08-17 | 110.5          |
+------------+----------------+
-- 3. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)
 Select COUNT(*) FROM compra where id_suministrador =(select id from suministrador where nombre regexp 'Daniel' and apellido1 regexp 'Sáez');
+----------+
| COUNT(*) |
+----------+
| 6        |
+----------+
-- 4. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)
 select * from consumidor where id = (select id_consumidor from compra where fecha regexp '2021' ORDER BY total DESC LIMIT 1);
-- 5. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.

-- 6. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).
-- 7. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).
-- 8. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
-- 9. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
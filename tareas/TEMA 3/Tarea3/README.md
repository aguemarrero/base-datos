# TAREA 3


### Paso 1: Creación de la BBDD

Crea con el siguente contenido el fichero __empleados-dump.sql__.

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```
  
### Paso 2 Lectura del fichero sql

```sql

sqlite3 tarea3.db

.read empleados-dump.sql;

.mode table;

SELECT * FROM empleados;
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 1  | Juan      | 50000.0 | Ventas           |
| 2  | María     | 60000.0 | TI               |
| 3  | Carlos    | 55000.0 | Ventas           |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 5  | Pedro     | 70000.0 | TI               |
| 6  | Laura     | 52000.0 | Ventas           |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 8  | Carmen    | 65000.0 | TI               |
| 9  | Miguel    | 51000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 11 | Diego     | 72000.0 | TI               |
| 12 | Sofía     | 49000.0 | Ventas           |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 14 | Isabel    | 53000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 17 | Alejandro | 71000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 19 | Roberto   | 49000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |
+----+-----------+---------+------------------+
.exit;

```

### Paso 3: Realización de consultas

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Funciones UPPER y LOWER:
  - Muestra el nombre de todos los empleados en mayúsculas.
```sql
SELECT UPPER(nombre) FROM empleados;
+---------------+
| UPPER(nombre) |
+---------------+
| JUAN          |
| MARíA         |
| CARLOS        |
| ANA           |
| PEDRO         |
| LAURA         |
| JAVIER        |
| CARMEN        |
| MIGUEL        |
| ELENA         |
| DIEGO         |
| SOFíA         |
| ANDRéS        |
| ISABEL        |
| RAúL          |
| PATRICIA      |
| ALEJANDRO     |
| NATALIA       |
| ROBERTO       |
| BEATRIZ       |
+---------------+
```

- Funciones Numéricas:
  - Calcula el valor absoluto del salario de todos los empleados.

 ```sql
  SELECT nombre, ABS(salario) FROM empleados;
+-----------+--------------+
|  nombre   | ABS(salario) |
+-----------+--------------+
| Juan      | 50000.0      |
| María     | 60000.0      |
| Carlos    | 55000.0      |
| Ana       | 48000.0      |
| Pedro     | 70000.0      |
| Laura     | 52000.0      |
| Javier    | 48000.0      |
| Carmen    | 65000.0      |
| Miguel    | 51000.0      |
| Elena     | 55000.0      |
| Diego     | 72000.0      |
| Sofía     | 49000.0      |
| Andrés    | 60000.0      |
| Isabel    | 53000.0      |
| Raúl      | 68000.0      |
| Patricia  | 47000.0      |
| Alejandro | 71000.0      |
| Natalia   | 54000.0      |
| Roberto   | 49000.0      |
| Beatriz   | 63000.0      |
+-----------+--------------+
```

- Funciones de Fecha y Hora:
  - Muestra la fecha actual.
  
```sql
SELECT DATE('now');
+-------------+
| DATE('now') |
+-------------+
| 2025-03-17  |

```
- Funciones de Agregación:
  - Calcula el promedio de salarios de todos los empleados.
```sql
SELECT AVG(salario) FROM empleados;
+--------------+
| AVG(salario) |
+--------------+
| 57000.0      |
+--------------+
```

  - Convierte la cadena '123' a un valor entero.

```sql
SELECT CAST('123' AS INTEGER);
123
```
- Funciones de Manipulación de Cadenas:
  - Concatena el nombre y el departamento de cada empleado.

```sql
SELECT nombre || '-' || departamento FROM empleados;
+-------------------------------+
| nombre || '-' || departamento |
+-------------------------------+
| Juan-Ventas                   |
| María-TI                      |
| Carlos-Ventas                 |
| Ana-Recursos Humanos          |
| Pedro-TI                      |
| Laura-Ventas                  |
| Javier-Recursos Humanos       |
| Carmen-TI                     |
| Miguel-Ventas                 |
| Elena-Recursos Humanos        |
| Diego-TI                      |
| Sofía-Ventas                  |
| Andrés-Recursos Humanos       |
| Isabel-TI                     |
| Raúl-Ventas                   |
| Patricia-Recursos Humanos     |
| Alejandro-TI                  |
| Natalia-Ventas                |
| Roberto-Recursos Humanos      |
| Beatriz-TI                    |
+-------------------------------+
```
- Funciones de Manipulación de Cadenas (CONCAT_WS):
  - Concatena el nombre y el departamento de cada empleado con un guion como separador.

```sql
 SELECT nombre,departamento,CONCAT_WS('-',nombre,departamento) FROM empleados;
+-----------+------------------+------------------------------------+
|  nombre   |   departamento   | CONCAT_WS('-',nombre,departamento) |
+-----------+------------------+------------------------------------+
| Juan      | Ventas           | Juan-Ventas                        |
| María     | TI               | María-TI                           |
| Carlos    | Ventas           | Carlos-Ventas                      |
| Ana       | Recursos Humanos | Ana-Recursos Humanos               |
| Pedro     | TI               | Pedro-TI                           |
| Laura     | Ventas           | Laura-Ventas                       |
| Javier    | Recursos Humanos | Javier-Recursos Humanos            |
| Carmen    | TI               | Carmen-TI                          |
| Miguel    | Ventas           | Miguel-Ventas                      |
| Elena     | Recursos Humanos | Elena-Recursos Humanos             |
| Diego     | TI               | Diego-TI                           |
| Sofía     | Ventas           | Sofía-Ventas                       |
| Andrés    | Recursos Humanos | Andrés-Recursos Humanos            |
| Isabel    | TI               | Isabel-TI                          |
| Raúl      | Ventas           | Raúl-Ventas                        |
| Patricia  | Recursos Humanos | Patricia-Recursos Humanos          |
| Alejandro | TI               | Alejandro-TI                       |
| Natalia   | Ventas           | Natalia-Ventas                     |
| Roberto   | Recursos Humanos | Roberto-Recursos Humanos           |
| Beatriz   | TI               | Beatriz-TI                         |
+-----------+------------------+------------------------------------+
```
- Funciones de Control de Flujo (CASE):
  - Categoriza a los empleados según sus salarios.

```sql
SELECT nombre, salario,
    CASE
    WHEN salario <50000 THEN 'bajo'
    WHEN salario BETWEEN 50000 AND 65000 THEN 'medio'
    ELSE 'alto'
    END AS categoria
    FROM empleados;
+-----------+---------+-----------+
|  nombre   | salario | categoria |
+-----------+---------+-----------+
| Juan      | 50000.0 | medio     |
| María     | 60000.0 | medio     |
| Carlos    | 55000.0 | medio     |
| Ana       | 48000.0 | bajo      |
| Pedro     | 70000.0 | alto      |
| Laura     | 52000.0 | medio     |
| Javier    | 48000.0 | bajo      |
| Carmen    | 65000.0 | medio     |
| Miguel    | 51000.0 | medio     |
| Elena     | 55000.0 | medio     |
| Diego     | 72000.0 | alto      |
| Sofía     | 49000.0 | bajo      |
| Andrés    | 60000.0 | medio     |
| Isabel    | 53000.0 | medio     |
| Raúl      | 68000.0 | alto      |
| Patricia  | 47000.0 | bajo      |
| Alejandro | 71000.0 | alto      |
| Natalia   | 54000.0 | medio     |
| Roberto   | 49000.0 | bajo      |
| Beatriz   | 63000.0 | medio     |
+-----------+---------+-----------+
```
- Funciones de Agregación (SUM):
  - Calcula la suma total de salarios de todos los empleados.

```sql
SELECT SUM(salario) FROM empleados;
+--------------+
| SUM(salario) |
+--------------+
| 1140000.0    |
+--------------+
```
- Funciones Numéricas (ROUND):
  - Redondea el salario de todos los empleados a dos decimales.

```sql
SELECT nombre, ROUND(salario,2) FROM empleados;
+-----------+------------------+
|  nombre   | ROUND(salario,2) |
+-----------+------------------+
| Juan      | 50000.0          |
| María     | 60000.0          |
| Carlos    | 55000.0          |
| Ana       | 48000.0          |
| Pedro     | 70000.0          |
| Laura     | 52000.0          |
| Javier    | 48000.0          |
| Carmen    | 65000.0          |
| Miguel    | 51000.0          |
| Elena     | 55000.0          |
| Diego     | 72000.0          |
| Sofía     | 49000.0          |
| Andrés    | 60000.0          |
| Isabel    | 53000.0          |
| Raúl      | 68000.0          |
| Patricia  | 47000.0          |
| Alejandro | 71000.0          |
| Natalia   | 54000.0          |
| Roberto   | 49000.0          |
| Beatriz   | 63000.0          |
+-----------+------------------+
```
- Funciones de Manipulación de Cadenas (LENGTH):
  - Muestra la longitud de cada nombre de empleado.

```sql
SELECT nombre, LENGTH(nombre) FROM empleados;
+-----------+----------------+
|  nombre   | LENGTH(nombre) |
+-----------+----------------+
| Juan      | 4              |
| María     | 5              |
| Carlos    | 6              |
| Ana       | 3              |
| Pedro     | 5              |
| Laura     | 5              |
| Javier    | 6              |
| Carmen    | 6              |
| Miguel    | 6              |
| Elena     | 5              |
| Diego     | 5              |
| Sofía     | 5              |
| Andrés    | 6              |
| Isabel    | 6              |
| Raúl      | 4              |
| Patricia  | 8              |
| Alejandro | 9              |
| Natalia   | 7              |
| Roberto   | 7              |
| Beatriz   | 7              |
+-----------+----------------+
```
- Funciones de Agregación (COUNT):
  - Cuenta el número total de empleados en cada departamento.

```sql
SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento;
+------------------+----------+
|   departamento   | COUNT(*) |
+------------------+----------+
| Recursos Humanos | 6        |
| TI               | 7        |
| Ventas           | 7        |
+------------------+----------+
```
- Funciones de Fecha y Hora (CURRENT_TIME):
  - Muestra la hora actual.

```sql
 SELECT TIME('now');
+-------------+
| TIME('now') |
+-------------+
| 23:35:20    |
+-------------+
```
- Funciones de Conversión (CAST):
  - Convierte el salario a un valor de punto flotante.

```sql
SELECT nombre, CAST(salario AS REAL) FROM empleados;
+-----------+-----------------------+
|  nombre   | CAST(salario AS REAL) |
+-----------+-----------------------+
| Juan      | 50000.0               |
| María     | 60000.0               |
| Carlos    | 55000.0               |
| Ana       | 48000.0               |
| Pedro     | 70000.0               |
| Laura     | 52000.0               |
| Javier    | 48000.0               |
| Carmen    | 65000.0               |
| Miguel    | 51000.0               |
| Elena     | 55000.0               |
| Diego     | 72000.0               |
| Sofía     | 49000.0               |
| Andrés    | 60000.0               |
| Isabel    | 53000.0               |
| Raúl      | 68000.0               |
| Patricia  | 47000.0               |
| Alejandro | 71000.0               |
| Natalia   | 54000.0               |
| Roberto   | 49000.0               |
| Beatriz   | 63000.0               |
+-----------+-----------------------+
```
- Funciones de Manipulación de Cadenas (SUBSTR):
  - Muestra los primeros tres caracteres de cada nombre de empleado.

```sql
SELECT nombre, SUBSTR(nombre,1,3) FROM empleados;
+-----------+--------------------+
|  nombre   | SUBSTR(nombre,1,3) |
+-----------+--------------------+
| Juan      | Jua                |
| María     | Mar                |
| Carlos    | Car                |
| Ana       | Ana                |
| Pedro     | Ped                |
| Laura     | Lau                |
| Javier    | Jav                |
| Carmen    | Car                |
| Miguel    | Mig                |
| Elena     | Ele                |
| Diego     | Die                |
| Sofía     | Sof                |
| Andrés    | And                |
| Isabel    | Isa                |
| Raúl      | Raú                |
| Patricia  | Pat                |
| Alejandro | Ale                |
| Natalia   | Nat                |
| Roberto   | Rob                |
| Beatriz   | Bea                |
+-----------+--------------------+
```

- __Order By__ and __Like__.
  - Empleados en el departamento de 'Ventas' con salarios superiores a 52000.

```sql
SELECT * FROM empleados WHERE departamento = 'Ventas' AND salario >5
2000;
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 3  | Carlos  | 55000.0 | Ventas       |
| 15 | Raúl    | 68000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+
```
  - Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

```sql
 SELECT * FROM empleados WHERE nombre LIKE '%a%' ORDER BY salario ASC;
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 12 | Sofía     | 49000.0 | Ventas           |
| 1  | Juan      | 50000.0 | Ventas           |
| 6  | Laura     | 52000.0 | Ventas           |
| 14 | Isabel    | 53000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 3  | Carlos    | 55000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 2  | María     | 60000.0 | TI               |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |
| 8  | Carmen    | 65000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 17 | Alejandro | 71000.0 | TI               |
+----+-----------+---------+------------------+
```
  - Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.

```sql
SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND salario BETWEEN 45000 AND 55000;
+----+----------+---------+------------------+
| id |  nombre  | salario |   departamento   |
+----+----------+---------+------------------+
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 7  | Javier   | 48000.0 | Recursos Humanos |
| 10 | Elena    | 55000.0 | Recursos Humanos |
| 16 | Patricia | 47000.0 | Recursos Humanos |
| 19 | Roberto  | 49000.0 | Recursos Humanos |
+----+----------+---------+------------------+
```
  - Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.

```sql
SELECT * FROM empleados ORDER BY salario DESC LIMIT 5;
+----+-----------+---------+--------------+
| id |  nombre   | salario | departamento |
+----+-----------+---------+--------------+
| 11 | Diego     | 72000.0 | TI           |
| 17 | Alejandro | 71000.0 | TI           |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |
+----+-----------+---------+--------------+
```
  - Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.

```sql
SELECT * FROM empleados WHERE (nombre LIKE 'M%' OR nombre LIKE 'N%')
AND salario > 50000;
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 2  | María   | 60000.0 | TI           |
| 9  | Miguel  | 51000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+
```
  - Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.

```sql
SELECT * FROM empleados WHERE departamento IN ('TI','Ventas') ORDER BY nombre;
+----+-----------+---------+--------------+
| id |  nombre   | salario | departamento |
+----+-----------+---------+--------------+
| 17 | Alejandro | 71000.0 | TI           |
| 20 | Beatriz   | 63000.0 | TI           |
| 3  | Carlos    | 55000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |
| 11 | Diego     | 72000.0 | TI           |
| 14 | Isabel    | 53000.0 | TI           |
| 1  | Juan      | 50000.0 | Ventas       |
| 6  | Laura     | 52000.0 | Ventas       |
| 2  | María     | 60000.0 | TI           |
| 9  | Miguel    | 51000.0 | Ventas       |
| 18 | Natalia   | 54000.0 | Ventas       |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 12 | Sofía     | 49000.0 | Ventas       |
+----+-----------+---------+--------------+
```
  - Empleados con salarios únicos (eliminando duplicados) en orden ascendente.

```sql
SELECT DISTINCT nombre, salario FROM empleados ORDER BY salario ASC;

+-----------+---------+
|  nombre   | salario |
+-----------+---------+
| Patricia  | 47000.0 |
| Ana       | 48000.0 |
| Javier    | 48000.0 |
| Sofía     | 49000.0 |
| Roberto   | 49000.0 |
| Juan      | 50000.0 |
| Miguel    | 51000.0 |
| Laura     | 52000.0 |
| Isabel    | 53000.0 |
| Natalia   | 54000.0 |
| Carlos    | 55000.0 |
| Elena     | 55000.0 |
| María     | 60000.0 |
| Andrés    | 60000.0 |
| Beatriz   | 63000.0 |
| Carmen    | 65000.0 |
| Raúl      | 68000.0 |
| Pedro     | 70000.0 |
| Alejandro | 71000.0 |
| Diego     | 72000.0 |
+-----------+---------+
```
  - Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.

```sql
SELECT * FROM empleados WHERE departamento = 'Ventas' AND (nombre LIKE '%O' OR nombre LIKE '%a');
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 6  | Laura   | 52000.0 | Ventas       |
| 12 | Sofía   | 49000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+
  ```
  - Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.

```sql
SELECT * FROM empleados WHERE salario NOT BETWEEN 55000 AND 70000 OR
DER BY departamento;
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 19 | Roberto   | 49000.0 | Recursos Humanos |
| 11 | Diego     | 72000.0 | TI               |
| 14 | Isabel    | 53000.0 | TI               |
| 17 | Alejandro | 71000.0 | TI               |
| 1  | Juan      | 50000.0 | Ventas           |
| 6  | Laura     | 52000.0 | Ventas           |
| 9  | Miguel    | 51000.0 | Ventas           |
| 12 | Sofía     | 49000.0 | Ventas           |
| 18 | Natalia   | 54000.0 | Ventas           |
+----+-----------+---------+------------------+
  ```
  - Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.

```sql
SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND nombre NOT LIKE '%E%';
+----+----------+---------+------------------+
| id |  nombre  | salario |   departamento   |
+----+----------+---------+------------------+
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 13 | Andrés   | 60000.0 | Recursos Humanos |
| 16 | Patricia | 47000.0 | Recursos Humanos |
+----+----------+---------+------------------+
  ```

</div>
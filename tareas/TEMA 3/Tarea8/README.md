# Tarea 8
## Consultas realizadas: 


```sql
PS C:\Users\ariad\OneDrive\Escritorio\carpeta database> sqlite3 tarea8.db
SQLite version 3.49.1 2025-02-18 13:38:58
Enter ".help" for usage hints.
sqlite> .read base-datos-alumnos.sql
sqlite> .tables
Alumnos        Clases         Inscripciones
sqlite> .mode table
sqlite> SELECT * FROM alumnos;
+----+--------+------+-----------+
| id | nombre | edad | direccion |
+----+--------+------+-----------+
| 1  | Juan   | 20   | Calle A   |
| 2  | María  | 21   | Calle B   |
| 3  | Pedro  | 19   | Calle C   |
| 4  | Laura  | 22   | Calle D   |
| 5  | Carlos | 20   | Calle E   |
| 6  | Ana    | 19   | Calle F   |
| 7  | Sofía  | 21   | Calle G   |
| 8  | Diego  | 20   | Calle H   |
| 9  | Lucía  | 22   | Calle I   |
| 10 | Miguel | 19   | Calle J   |
+----+--------+------+-----------+
sqlite> SELECT * FROM clases;
+----+------------------------+-------------+------------+
| id |         nombre         |   materia   |  profesor  |
+----+------------------------+-------------+------------+
| 1  | Matemáticas 101        | Matemáticas | Profesor X |
| 2  | Historia Antigua       | Historia    | Profesor Y |
| 3  | Literatura Moderna     | Literatura  | Profesor Z |
| 4  | Biología Avanzada      | Biología    | Profesor W |
| 5  | Química Orgánica       | Química     | Profesor V |
| 6  | Física Cuántica        | Física      | Profesor U |
| 7  | Arte Contemporáneo     | Arte        | Profesor T |
| 8  | Inglés Avanzado        | Idiomas     | Profesor S |
| 9  | Economía Internacional | Economía    | Profesor R |
| 10 | Derecho Penal          | Derecho     | Profesor Q |
+----+------------------------+-------------+------------+
sqlite> SELECT * FROM inscripciones;
+----+-----------+----------+
| id | id_alumno | id_clase |
+----+-----------+----------+
| 1  | 1         | 1        |
| 2  | 1         | 2        |
| 3  | 2         | 3        |
| 4  | 2         | 4        |
| 5  | 3         | 5        |
| 6  | 3         | 6        |
| 7  | 4         | 7        |
| 8  | 4         | 8        |
| 9  | 5         | 9        |
| 10 | 6         | 10       |
+----+-----------+----------+
```
- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.
```sql
SELECT a.nombre AS alumno, c.nombre AS clase
   ...> FROM inscripciones i, alumnos a, clases c
   ...> WHERE i.id_alumno = a.id
   ...>   AND i.id_clase = c.id;
+--------+------------------------+
| alumno |         clase          |
+--------+------------------------+
| Juan   | Matemáticas 101        |
| Juan   | Historia Antigua       |
| María  | Literatura Moderna     |
| María  | Biología Avanzada      |
| Pedro  | Química Orgánica       |
| Pedro  | Física Cuántica        |
| Laura  | Arte Contemporáneo     |
| Laura  | Inglés Avanzado        |
| Carlos | Economía Internacional |
| Ana    | Derecho Penal          |
+--------+------------------------+
```
- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
```sql
SELECT a.nombre AS alumno, c.materia
   ...> FROM inscripciones i, alumnos a, clases c
   ...> WHERE i.id_alumno = a.id
   ...>   AND i.id_clase = c.id;
+--------+-------------+
| alumno |   materia   |
+--------+-------------+
| Juan   | Matemáticas |
| Juan   | Historia    |
| María  | Literatura  |
| María  | Biología    |
| Pedro  | Química     |
| Pedro  | Física      |
| Laura  | Arte        |
| Laura  | Idiomas     |
| Carlos | Economía    |
| Ana    | Derecho     |
+--------+-------------+
```
- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.

```sql
SELECT a.nombre AS alumno, a.edad, c.profesor
   ...> FROM inscripciones i, alumnos a, clases c
   ...> WHERE i.id_alumno = a.id
   ...>   AND i.id_clase = c.id;
+--------+------+------------+
| alumno | edad |  profesor  |
+--------+------+------------+
| Juan   | 20   | Profesor X |
| Juan   | 20   | Profesor Y |
| María  | 21   | Profesor Z |
| María  | 21   | Profesor W |
| Pedro  | 19   | Profesor V |
| Pedro  | 19   | Profesor U |
| Laura  | 22   | Profesor T |
| Laura  | 22   | Profesor S |
| Carlos | 20   | Profesor R |
| Ana    | 19   | Profesor Q |
+--------+------+------------+
```
- Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.

```sql
SELECT a.nombre AS alumno, a.direccion
   ...> FROM inscripciones i
   ...> JOIN alumnos a ON i.id_alumno = a.id;
+--------+-----------+
| alumno | direccion |
+--------+-----------+
| Juan   | Calle A   |
| Juan   | Calle A   |
| María  | Calle B   |
| María  | Calle B   |
| Pedro  | Calle C   |
| Pedro  | Calle C   |
| Laura  | Calle D   |
| Laura  | Calle D   |
| Carlos | Calle E   |
| Ana    | Calle F   |
+--------+-----------+
```
- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.

```sql
SELECT a.nombre AS alumno, c.nombre AS clase, c.profesor
   ...> FROM inscripciones i
   ...> JOIN alumnos a ON i.id_alumno = a.id
   ...> JOIN clases c ON i.id_clase = c.id;
+--------+------------------------+------------+
| alumno |         clase          |  profesor  |
+--------+------------------------+------------+
| Juan   | Matemáticas 101        | Profesor X |
| Juan   | Historia Antigua       | Profesor Y |
| María  | Literatura Moderna     | Profesor Z |
| María  | Biología Avanzada      | Profesor W |
| Pedro  | Química Orgánica       | Profesor V |
| Pedro  | Física Cuántica        | Profesor U |
| Laura  | Arte Contemporáneo     | Profesor T |
| Laura  | Inglés Avanzado        | Profesor S |
| Carlos | Economía Internacional | Profesor R |
| Ana    | Derecho Penal          | Profesor Q |
+--------+------------------------+------------+
```
- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
```sql
 SELECT a.nombre AS alumno, c.materia, c.profesor
   ...> FROM inscripciones i
   ...> JOIN alumnos a ON i.id_alumno = a.id
   ...> JOIN clases c ON i.id_clase = c.id;
+--------+-------------+------------+
| alumno |   materia   |  profesor  |
+--------+-------------+------------+
| Juan   | Matemáticas | Profesor X |
| Juan   | Historia    | Profesor Y |
| María  | Literatura  | Profesor Z |
| María  | Biología    | Profesor W |
| Pedro  | Química     | Profesor V |
| Pedro  | Física      | Profesor U |
| Laura  | Arte        | Profesor T |
| Laura  | Idiomas     | Profesor S |
| Carlos | Economía    | Profesor R |
| Ana    | Derecho     | Profesor Q |
+--------+-------------+------------+
```
- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
```sql
SELECT a.nombre AS alumno, a.edad, c.materia
   ...> FROM inscripciones i, alumnos a, clases c
   ...> WHERE i.id_alumno = a.id
   ...>   AND i.id_clase = c.id;
+--------+------+-------------+
| alumno | edad |   materia   |
+--------+------+-------------+
| Juan   | 20   | Matemáticas |
| Juan   | 20   | Historia    |
| María  | 21   | Literatura  |
| María  | 21   | Biología    |
| Pedro  | 19   | Química     |
| Pedro  | 19   | Física      |
| Laura  | 22   | Arte        |
| Laura  | 22   | Idiomas     |
| Carlos | 20   | Economía    |
| Ana    | 19   | Derecho     |
+--------+------+-------------+
```
- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
```sql
SELECT a.nombre AS alumno, a.direccion, c.profesor
   ...> FROM inscripciones i
   ...> JOIN alumnos a ON i.id_alumno = a.id
   ...> JOIN clases c ON i.id_clase = c.id;
+--------+-----------+------------+
| alumno | direccion |  profesor  |
+--------+-----------+------------+
| Juan   | Calle A   | Profesor X |
| Juan   | Calle A   | Profesor Y |
| María  | Calle B   | Profesor Z |
| María  | Calle B   | Profesor W |
| Pedro  | Calle C   | Profesor V |
| Pedro  | Calle C   | Profesor U |
| Laura  | Calle D   | Profesor T |
| Laura  | Calle D   | Profesor S |
| Carlos | Calle E   | Profesor R |
| Ana    | Calle F   | Profesor Q |
+--------+-----------+------------+
``` 
- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.

```sql
SELECT a.nombre AS alumno, c.materia
   ...> FROM inscripciones i, alumnos a, clases c
   ...> WHERE i.id_alumno = a.id
   ...>   AND i.id_clase = c.id
   ...> ORDER BY a.nombre;
+--------+-------------+
| alumno |   materia   |
+--------+-------------+
| Ana    | Derecho     |
| Carlos | Economía    |
| Juan   | Matemáticas |
| Juan   | Historia    |
| Laura  | Arte        |
| Laura  | Idiomas     |
| María  | Literatura  |
| María  | Biología    |
| Pedro  | Química     |
| Pedro  | Física      |
+--------+-------------+
```
- Contar cuántos alumnos están inscritos en cada clase.
```sql
SELECT c.nombre AS clase, COUNT(i.id_alumno) AS cantidad_alumnos
   ...> FROM clases c
   ...> LEFT JOIN inscripciones i ON c.id = i.id_clase
   ...> GROUP BY c.nombre
   ...> ORDER BY cantidad_alumnos DESC;
+------------------------+------------------+
|         clase          | cantidad_alumnos |
+------------------------+------------------+
| Química Orgánica       | 1                |
| Matemáticas 101        | 1                |
| Literatura Moderna     | 1                |
| Inglés Avanzado        | 1                |
| Historia Antigua       | 1                |
| Física Cuántica        | 1                |
| Economía Internacional | 1                |
| Derecho Penal          | 1                |
| Biología Avanzada      | 1                |
| Arte Contemporáneo     | 1                |
+------------------------+------------------+
```
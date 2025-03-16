
<div>
    
# Tarea 1


### Paso 1: Crear una tabla con un campo de cada tipo

1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada `tarea1.db`.

    ```bash
    sqlite3 tarea1.db

    ```

2. Dentro de SQLite3, crea una tabla llamada `Ejemplo`:


    ```sql
     CREATE TABLE Ejemplo ( id INTEGER NOT NULL PRIMARY KEY,
        texto TEXT NOT NULL,
        entero INTEGER NOT NULL,
        decimal REAL NOT NULL,
        fecha DATE NOT NULL, 
        booleano BOOLEAN NOT NULL);
    ```



### Paso 2: Insertar 50 entradas

He introducido 10 Entradas solamente de la siguiente manera: 

```sql
INSERT INTO Ejemplo (id, texto,entero,decimal,fecha,booleano)
VALUES('1','Ejemplo1','25','10.5','22-05-15','0');
```
```sql
INSERT INTO Ejemplo( id,texto,entero,decimal,fecha,booleano)
VALUES('2','Ejemplo2','63','45.7','2022-06-22','1');
```
Para visualizar si los datos se han introducido correctamente he utilizado lo siguiente: 

```sql
SELECT * FROM Ejemplo;
```
```bash
+----+----------+--------+---------+------------+----------+
| id |  texto   | entero | decimal |   fecha    | booleano |
+----+----------+--------+---------+------------+----------+
| 1  | Ejemplo1 | 25     | 10.5    | 22-05-15   | 0        |
| 2  | Ejemplo2 | 63     | 45.7    | 2022-06-22 | 1        |
| 3  | Ejemplo3 | 12     | 30.0    | 2022-07-10 | 0        |
| 4  | Ejeplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 5  | Ejeplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 6  | Ejeplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 7  | Ejeplo7  | 10     | 40.1    | 2022-11-17 | 0        |
| 8  | Ejeplo8  | 87     | 22.6    | 2022-12-03 | 1        |
| 9  | Ejeplo9  | 31     | 55.0    | 2022-01-20 | 0        |
| 10 | Ejeplo10 | 68     | 90.4    | 2022-02-14 | 1        |
+----+----------+--------+---------+------------+----------+
```

### Paso 3: Realizar 5 consultas de datos

1. Obtén todas las entradas de la tabla `Ejemplo`.

```sql
SELECT * FROM Ejemplo;
+----+----------+--------+---------+------------+----------+
| id |  texto   | entero | decimal |   fecha    | booleano |
+----+----------+--------+---------+------------+----------+
| 1  | Ejemplo1 | 25     | 10.5    | 22-05-15   | 0        |
| 2  | Ejemplo2 | 63     | 45.7    | 2022-06-22 | 1        |
| 3  | Ejemplo3 | 12     | 30.0    | 2022-07-10 | 0        |
| 4  | Ejeplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 5  | Ejeplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 6  | Ejeplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 7  | Ejeplo7  | 10     | 40.1    | 2022-11-17 | 0        |
| 8  | Ejeplo8  | 87     | 22.6    | 2022-12-03 | 1        |
| 9  | Ejeplo9  | 31     | 55.0    | 2022-01-20 | 0        |
| 10 | Ejeplo10 | 68     | 90.4    | 2022-02-14 | 1        |
+----+----------+--------+---------+------------+----------+
```

2. Obtén las entradas con el campo `entero` mayor a 50.

Para obtener las entradas con el campo `entero` sea mayor a 50 utilizamos SELECT * para seleccionar todas las columnas de la tabla ejemplo y luego WHERE entero > 50 filtra los registros que le pido.

```sql
SELECT * FROM Ejemplo WHERE entero > 50;
+----+----------+--------+---------+------------+----------+
| id |  texto   | entero | decimal |   fecha    | booleano |
+----+----------+--------+---------+------------+----------+
| 2  | Ejemplo2 | 63     | 45.7    | 2022-06-22 | 1        |
| 4  | Ejeplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 6  | Ejeplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 8  | Ejeplo8  | 87     | 22.6    | 2022-12-03 | 1        |
| 10 | Ejeplo10 | 68     | 90.4    | 2022-02-14 | 1        |
+----+----------+--------+---------+------------+----------+
```


### Paso 4: Realizar 3 eliminaciones y 3 modificaciones

1. Elimina las entradas donde el campo `booleano` es igual a `True`.

```sql
DELETE FROM Ejemplo WHERE booleano =1;

Si borramos las entradas donde el campo es =1 (true) las entradas que nos quedan son las siguientes:
 SELECT * FROM Ejemplo;
+----+----------+--------+---------+------------+----------+
| id |  texto   | entero | decimal |   fecha    | booleano |
+----+----------+--------+---------+------------+----------+
| 1  | Ejemplo1 | 25     | 10.5    | 22-05-15   | 0        |
| 3  | Ejemplo3 | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejeplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejeplo7  | 10     | 40.1    | 2022-11-17 | 0        |
| 9  | Ejeplo9  | 31     | 55.0    | 2022-01-20 | 0        |
+----+----------+--------+---------+------------+----------+

```

1. Modifica el campo `texto` de las entradas donde el campo `entero` es menor a 30 y establece el texto como "Modificado".

```sql
UPDATE Ejemplo SET texto = 'Modificado' WHERE entero <30;
SELECT * FROM Ejemplo;
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Modificado | 25     | 10.5    | 22-05-15   | 0        |
| 3  | Modificado | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejeplo5    | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Modificado | 10     | 40.1    | 2022-11-17 | 0        |
| 9  | Ejeplo9    | 31     | 55.0    | 2022-01-20 | 0        |
+----+------------+--------+---------+------------+----------+
```


2. Elimina las entradas donde el campo `entero` es igual a 50.

```sql
DELETE FROM Ejemplo WHERE entero =50;
SELECT entero FROM Ejemplo;
+--------+
| entero |
+--------+
| 25     |
| 12     |
| 42     |
| 10     |
| 31     |
+--------+

```

4. Incrementa en 10 el valor del campo `entero` para las entradas donde el campo `booleano` es igual a `False`.

```sql
UPDATE Ejemplo SET entero = entero + 10 WHERE booleano =0;
sqlite> SELECT * FROM Ejemplo;
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Modificado | 35     | 10.5    | 22-05-15   | 0        |
| 3  | Modificado | 22     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejeplo5    | 52     | 18.9    | 2022-09-12 | 0        |
| 7  | Modificado | 20     | 40.1    | 2022-11-17 | 0        |
| 9  | Ejeplo9    | 41     | 55.0    | 2022-01-20 | 0        |
+----+------------+--------+---------+------------+----------+
```
En este caso se puede ver la incrementación en la columna entero con la actividad anterior.

4. Elimina las entradas donde el campo `decimal` es menor a 50.

```sql
DELETE FROM Ejemplo WHERE decimal <50;
sqlite> SELECT * FROM Ejemplo;
+----+---------+--------+---------+------------+----------+
| id |  texto  | entero | decimal |   fecha    | booleano |
+----+---------+--------+---------+------------+----------+
| 9  | Ejeplo9 | 41     | 55.0    | 2022-01-20 | 0        |
+----+---------+--------+---------+------------+----------+
```
Se eliminan todas menos el id 9. 
5. Actualiza el campo `fecha` de todas las entradas a la fecha actual.

```sql
UPDATE ejemplo SET fecha = DATE('now');
SELECT * FROM Ejemplo;
+----+---------+--------+---------+------------+----------+
| id |  texto  | entero | decimal |   fecha    | booleano |
+----+---------+--------+---------+------------+----------+
| 9  | Ejeplo9 | 41     | 55.0    | 2025-03-16 | 0        |
+----+---------+--------+---------+------------+----------+
sqlite>
```
</div>

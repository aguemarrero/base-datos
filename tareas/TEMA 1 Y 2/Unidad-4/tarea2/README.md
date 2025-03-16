

# 🚀 **Verificar y transformar la tabla a 1FN** 


## ✅ Tabla modificada

| ProductoID | Nombre          | Categorias                  | Precio | ClienteID | NombreCliente | Calle                    | Ciudad|
|------------|-----------------|-----------------------------|--------|-----------|---------------|-------------------------------------|------------|
| 1          | Laptop HP       | Electrónicos  | 800    | 101       | Juan          | Calle 1| Ciudad A |
| 1          | Laptop HP       | Informática    | 800     | 101       | Juan          | Calle 2 | Ciudad A |
| 2          | Camiseta Nike   | Ropa| 30     | 102       | María         | Calle 3 | Ciudad B |
| 2          | Camiseta Nike   | Deportes| 30     | 102       | María         | Calle 3 |Ciudad B                    |
| 3          | Libro "Dune"    | Libros| 20     | 101       | Juan          | Calle 1 | Ciudad A|
| 3          | Libro "Dune"    | Ciencia ficción| 20     | 101       | Juan          | Calle 1 | Ciudad A| 



---

## ✨ Justificación de la respuesta

He normalizado la tabla así ya que la **1FN** establece que cada celda debe contener un solo valor atómico y cada fila debe ser única y bien estructurada. 

En este caso, la columna categorías tenía varios valores. Ahora, cada categoría aparece en una fila diferente.


---

# 🚀 **Verificar y transformar la tabla a 2FN** 


## ✅ Tablas modificadas

**Tabla Producto**

| ProductoID  | Nombre | Precio |
|-------------|--------|--------|
| 1           | Laptop HP | 800 |
| 2           | Camiseta Nike | 102 |
| 3           | Libro "Dune" | 101 |


**Tabla Categoría**

| CategoríaID  | NombreCategoría | 
|-------------|--------|
| 1           | Electrónicos | 
| 2           | Informática | 
| 3           | Ropa|
| 4           | Deportes|
| 5           | Libros|
| 6           | Ciencia Ficción |


**Tabla Clientes**

| ClienteID  | NombreCliente |
|-------------|--------|
| 101           | Juan | 
| 102          | María | 


**Tabla relación Producto-Categoría**

| ProductoID  | CategoríaID |
|-------------|--------|
| 1           | 1 |
| 1           | 2 |
| 2          | 3 | 
| 2          | 4 |
| 3           | 5|
| 3           | 6|

**Tabla Direcciones**

| ClienteID  | DireciónID  | Calle | Ciudad |
|-------------|----|----|-------|
| 101         | 1  | Calle 1 | Ciudad A |
| 101         | 2  | Calle 2  | Ciudad A |
| 102         | 3  | Calle 3  | Ciudad B |

---

## ✨ Justificación de la respuesta

Para la **2FN**  primero debe cumplir con la 1FN y como podemos observar, todos los valores son atómicos por lo tanto, cumple con la 1FN. 

Luego, he eliminado dependencias parciales. 

-He separado categorías en una tabla independiente porque un producto puede tener múltiples categorías, por lo que no depende de la clave principal.
- Creé una tabla intermedia para representar la relación entre productos y categorías.
- **Clientes** también lo he separado en una tabla independiente ya que nombreCliente solo depende de ClienteID y no de ProductoID. Así evitamos datos duplicados.
-**Direcciones** solo depende de ClienteID, por lo que he creado otra tabla direcciones ya que se repetía en varias filas.

# 🚀 **Verificar y transformar la tabla a 3FN** 


## ✅ Tablas modificadas


No realizaré ningún cambio en 3FN , aunque me planteo si se pudiese realizar con ciudad en

---

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/tarea2/img/practicaExamen.drawio.png)


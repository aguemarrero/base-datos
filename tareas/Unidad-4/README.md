<div align="justify">

# Respuestas a la tarea 6

## **Ejercicio 1: Lista de Productos**

### **Tabla Inicial: Productos**

| ID_Producto | Nombre_Producto | Proveedores      | Categoría   | Precio |
|------------|----------------|-----------------|------------|--------|
| 1          | Laptop         | Dell, HP        | Tecnología | 1000   |
| 2          | Mouse          | Logitech        | Accesorios | 25     |

### **Tareas:**

1. Aplicar **1FN**:

 Tabla de productos

  | ID_Producto | Nombre_Producto | Categoría   | Precio |
|------------|----------------|------------|--------|
| 1          | Laptop         | Tecnología | 1000   |
| 2          | Mouse          | Accesorios | 25     |

 Tabla de proveedor
 | ID_Producto | Proveedor | 
|------------|----------------|
| 1          | Dell        | 
| 2          | Logitech        | 
| 1          | HP   |

3. Aplicar **2FN**:

![ Actividad 1 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio1.drawio.png)
---

## **Ejercicio 2: Pedidos de Clientes**

### **Tabla Inicial: Pedidos**

| ID_Pedido | Cliente   | Dirección       | Producto     | Cantidad | Precio |
|----------|----------|---------------|-------------|----------|--------|
| 101      | Juan Pérez | Calle 123     | Laptop      | 1        | 1000   |
| 102      | Ana López | Av. Central   | Teclado     | 2        | 50     |

### **Tareas:**

 Aplicar **1FN**:

  | ID_Pedido | Cliente   | Dirección       | Producto     | Cantidad | Precio |
|----------|----------|---------------|-------------|----------|--------|
| 101      | Juan Pérez | Calle 123     | Laptop      | 1        | 1000   |
| 102      | Ana López | Av. Central   | Teclado     | 2        | 50     |

 Aplicar **2FN**:

| ID_Pedido  | Cliente      | Dirección |
|------------|----------------|------------|
| 101        | Juan Pérez     | Calle 123  |
| 102        | Ana Pérez      | Av.Central |


| ID_Pedido  | Producto      | Cantidad | Precio |
|------------|---------------|------------|------|
| 101        | Laptop        |   1  | 1000  |
| 102        | Teclado       |   2  | 50    |


![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio2.drawio.png)

---

## **Ejercicio 3: Registro de Empleados**

### **Tabla Inicial: Empleados**

| ID_Empleado | Nombre     | Teléfonos         | Departamento |
|------------|------------|------------------|--------------|
| 1          | Carlos R.  | 12345, 67890     | Ventas       |
| 2          | Laura M.   | 54321            | Finanzas     |

### **Tareas:**

1. Aplicar **1FN**:

   ***Tabla de Registro de empleados:***

| ID_Empleado | Nombre   | Teléfonos | Departamento     |
|----------|----------|-------------|-------------------|
| 1        | Carlos R.| 12345     | Ventas   |
| 1        | Carlos R.| 67890     | Ventas   |
| 2        | Laura M. | 54321     | Finanzas |

3. Aplicar **2FN**: 

No es necesario realizar 2FN

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio3.drawio.png)
---

## **Ejercicio 4: Reservas de Hotel**

### **Tabla Inicial: Reservas**

| ID_Reserva | Cliente    | Habitación | Fechas              | Precio |
|------------|-----------|------------|---------------------|--------|
| 5001      | Pedro G.  | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002      | María T.  | 202        | 10/03, 11/03       | 200    |

### **Tareas:**

1. Aplicar **1FN**:

 ***Tabla de Reservas de Hotel:***
| ID_Reserva | Cliente    | Habitación | Fecha  | Precio |
|------------|-----------|------------|---------|--------|
| 5001      | Pedro G.  | 101        | 01/02 | 300    |
| 5001      | Pedro G.  | 101        | 02/02 | 300    |
| 5001      | Pedro G.  | 101        | 03/02 | 300    |
| 5002      | María T.  | 202        | 10/03 | 200    |
| 5002      | María T.  | 202        | 11/03 | 200    |

2. Aplicar **2FN**:

| ID_Reserva  | Cliente     | Habitacion | Precio |
|------------|--------------|------------|--------|
| 5001       | Pedro G.     | 101        | 300    |
| 5002       | María T.      | Av.Central |

| ID_Reserva  |    Fecha    |
|------------|--------------|
| 5001       | 01/02        |   
| 5001       | 02/02        | 
| 5001       | 03/02        | 
| 5002       | 10/03        | 
| 5002       | 11/03        | 

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio4.drawio.png)

---

## **Ejercicio 5: Inscripciones a Cursos**

### **Tabla Inicial: Inscripciones**

| ID_Inscripción | Estudiante | Curso        | Profesor    | Horarios |
|---------------|------------|--------------|------------|----------|
| 3001         | Luis R.    | Matemáticas  | Prof. Pérez | Lunes 10AM, Miércoles 2PM |
| 3002         | Ana S.     | Física       | Prof. Gómez | Martes 3PM |

### **Tareas:**

1. Aplicar **1FN**:

  | ID_Inscripción | Estudiante | Curso        | Profesor    | Horarios |
|---------------|------------|--------------|------------|----------|
| 3001         | Luis R.    | Matemáticas  | Prof. Pérez | Lunes 10AM |
| 3001         | Luis R.    | Matemáticas  | Prof. Pérez | Miércoles 2PM |
| 3002         | Ana S.     | Física       | Prof. Gómez | Martes 3PM |

2. Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

***Nueva tablas: Inscripciones a cursos***:

| ID_Inscripción | Estudiante | Curso        | Profesor    |
|---------------|------------|--------------|------------|
| 3001         | Luis R.    | Matemáticas  | Prof. Pérez |
| 3002         | Ana S.     | Física       | Prof. Gómez |

| ID_Inscripción  |    Horario    |
|------------|--------------|
| 3001       | Lunes 10AM        |   
| 3001       | Miércoles 2PM     | 
| 3002       | Martes 3PM        | 

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio5.drawio.png)
---

## **Ejercicio 6: Ventas de Tienda**

### **Tabla Inicial: Ventas**

| ID_Venta | Cliente    | Productos Comprados | Total |
|----------|------------|---------------------|-------|
| 8001     | Juan P.   | Celular, Funda      | 500   |
| 8002     | Andrea M. | Laptop              | 1000  |

### **Tareas:**

1. Aplicar **1FN**:
  ***Tabla de Ventas de Tienda***
   
| ID_Venta | Cliente    | Productos Comprados | Total |
|----------|------------|---------------------|-------|
| 8001     | Juan P.   | Celular    | 500   |
| 8001     | Juan P.   | Funda      | 500   |
| 8002     | Andrea M. | Laptop     | 1000  |
2. Aplicar **2FN**:

***Nueva tablas: Ventas de Tienda***:

| ID_Venta | Cliente | Total |
|---------------|------------|--------------|
| 8001         | Juan P.    | 500  |
| 8002         | Andrea M.  | 1000 |

| ID_Venta  |    Producto    |
|------------|--------------|
| 8001       | Celular   |   
| 8001       | Funda     | 
| 8001       | Laptop    | 


![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio6.drawio.png)

---

## **Ejercicio 7: Biblioteca de Libros**

### **Tabla Inicial: Libros**

| ID_Libro | Título | Autores          | Género  |
|----------|--------|-----------------|---------|
| 101      | El Quijote | Cervantes   | Novela  |
| 102      | 1984       | Orwell       | Ciencia Ficción |

### **Tareas:**

1. Aplicar **1FN**, eliminando valores multivaluados en "Autores".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio7.drawio.png)

---

## **Ejercicio 8: Facturación de Servicios**

### **Tabla Inicial: Facturas**

| ID_Factura | Cliente   | Servicios Contratados | Costo Total |
|------------|-----------|----------------------|-------------|
| 9001       | Juan P.   | Internet, TV        | 50          |
| 9002       | Ana M.    | Teléfono            | 20          |

### **Tareas:**

1. Aplicar **1FN**, separando valores multivaluados en "Servicios Contratados".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio8.drawio.png)

---

## **Ejercicio 9: Gestión de Vehículos**

### **Tabla Inicial: Vehículos**

| ID_Vehículo | Marca   | Modelos          | Año |
|------------|--------|----------------|-----|
| 5001       | Toyota  | Corolla, Yaris  | 2022 |
| 5002       | Honda   | Civic          | 2023 |

### **Tareas:**

1. Aplicar **1FN**, eliminando valores multivaluados en "Modelos".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio9.drawio.png)

---

## **Ejercicio 10: Gestión de Proyectos**

### **Tabla Inicial: Proyectos**

| ID_Proyecto | Nombre       | Miembros        | Presupuesto |
|------------|-------------|----------------|------------|
| 7001       | Web App     | Juan, Ana      | 5000       |
| 7002       | E-commerce  | Pedro, María   | 10000      |

### **Tareas:**

1. Aplicar **1FN**, eliminando valores multivaluados en "Miembros".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

![ Actividad 2 resuelta](https://github.com/aguemarrero/base-datos/blob/main/tareas/Unidad-4/img/ejercicio10.drawio.png)

 </div>

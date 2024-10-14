
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.

SELECT min("Milliseconds") AS "Duración mínima de la pista"
FROM "Track";

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.

SELECT max("Milliseconds") AS "Duración máxima de la pista"
FROM "Track";

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.

SELECT  min("UnitPrice") AS "Precio mínimo de la pista"
FROM  "Track";

-- Ejercicio 4: Encontrar el precio máximo de las pistas.

SELECT  max("UnitPrice") AS "Precio máximo de la pista"
FROM  "Track";

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
   
SELECT min("InvoiceDate") AS  "Fecha mínima factura"
FROM "Invoice" ;


-- Ejercicio 6: Encontrar la fecha máxima de la factura.

SELECT max("InvoiceDate") AS  "Fecha m´xaima factura"
FROM "Invoice" ;  

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
SELECT count("TrackId") AS "Número total de pistas"
FROM "Track" ; 

-- Ejercicio 8: Contar el número de clientes en Brasil.
SELECT count("Country") AS "numero de clientes en Brasil"
FROM "Customer"  
WHERE "Country" = 'Brazil';   

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
SELECT  sum("Milliseconds") AS "Suma de pistas"
 FROM "Track";
  

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
 SELECT count("Title") AS "Número de empleados con el título 'sales support Agent'"
 FROM "Employee"
 WHERE "Title" = 'Sales Support Agent'

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
 SELECT sum("Total") AS "Cantidades en las facturas"
FROM "Invoice";   

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
 SELECT avg("Milliseconds") AS "Calculo de la media de las pistas" 
FROM "Track";

-- Ejercicio 13: Calcular el precio medio de las pistas.
SELECT avg("UnitPrice") AS "Precio medio de las pistas"
FROM "Track";   

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
SELECT stddev("Milliseconds") AS "desviacion estándar de la duración"
FROM "Track";    

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
SELECT variance("Milliseconds") AS "Varianza de duración pistas" 
FROM "Track"; 

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
SELECT stddev("UnitPrice") AS  "desviación estándar del precio de las pistas" 
FROM "Track";

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
SELECT CONCAT("FirstName", ' ', "LastName") AS "nombre_completo" 
FROM "Customer";


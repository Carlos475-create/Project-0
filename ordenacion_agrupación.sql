
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
SELECT "Title" AS "Nombre de los álbumes"
FROM "Album"  
order by "Title";

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
SELECT "Title" AS "Titulo del album", COUNT(t."TrackId") AS "Numero_de_canciones"
from "Album" a 
join "Track" t  ON a."AlbumId" = t."AlbumId" 
group by  "Title" 
order by "Numero_de_canciones" DESC
limit 1;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
SELECT  "Composer", 
  avg("Milliseconds") AS Duracion_Promedio,
  stddev("Milliseconds") AS Desviacion_Estandar,
  variance("Milliseconds") AS Varianza
FROM "Track" t 
GROUP BY "Composer";

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
SELECT "Name" AS  "Titulo", "UnitPrice" AS "Precio" 
FROM "Track" t 
LIMIT 10;
   

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
SELECT "FirstName", "LastName", "EmployeeId" 
FROM "Employee" e 
ORDER BY "EmployeeId" DESC; 

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
SELECT count("Name") "Distintos numeros de generos"
FROM "Genre" g;
-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
SELECT "FirstName" , "LastName", "Country" 
FROM "Customer" c 
ORDER BY "FirstName"
LIMIT 5;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
SELECT "Country" AS "Paises", COUNT(*) AS  Numero_Clientes
FROM "Customer" c 
GROUP BY "Country" 
ORDER BY Numero_Clientes DESC;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
SELECT "Country" AS "Paises", sum(i."Total") AS "Total_Importe"
FROM "Customer" c 
JOIN "Invoice" i on c."CustomerId" = i."CustomerId" 
GROUP BY "Country" 
HAVING  sum(i."Total") > 10000
ORDER BY"Total_Importe" DESC;	

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
SELECT "Country" AS "País" , count(*) AS Numero_Clientes
FROM "Customer" c 
GROUP BY "Country" 
HAVING count(*) > 5
ORDER BY Numero_Clientes DESC;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
 SELECT mt."Name" AS "Tipo_de_medio", count(t."TrackId") AS "Número de pistas" 
FROM "Track" t
JOIN "MediaType" mt on t."MediaTypeId" = mt."MediaTypeId" 
WHERE t."Milliseconds" > 250000
GROUP BY mt."Name" 
ORDER BY "Cantidad de pistas" DESC;  

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
SELECT c."Country" AS "País", count(c."CustomerId") AS "Número_clientes", "EmployeeId" 
FROM "Customer" c 
JOIN "Employee" e ON c."SupportRepId" = e."EmployeeId" 
WHERE e."EmployeeId" < 5
GROUP BY c."Country" , "EmployeeId" 
ORDER BY "Número_clientes" DESC; 		
  

-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
SELECT DISTINCT i."BillingPostalCode" , c."FirstName" , c."LastName"
FROM "Invoice" i
JOIN  "Customer" c ON  i."CustomerId" = c."CustomerId" 
WHERE c."CustomerId" IN ( 
SELECT "CustomerId" 
FROM  "Invoice" 
GROUP BY "CustomerId" 
HAVING  count(*)> 5); 

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select mt."Name" as "tipo_medio", count(t."TrackId") as "número_pistas"
from "Track" t
join "MediaType" mt on t."MediaTypeId" = mt."MediaTypeId" 
where t."UnitPrice" > 0.99 and t."Milliseconds" > 200000
group by mt."Name" 
order by  "número_pistas" desc;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.

SELECT  c."Country" , c."State", count(c."CustomerId") as "Numero_Clientes"
FROM "Customer" c
JOIN  "Employee" e on c."SupportRepId" = e."EmployeeId" 
WHERE e."EmployeeId" > 3 AND c."Company" IS NOT NULL 
GROUP BY c."Country" , c."State" 
ORDER BY "Numero_Clientes" DESC;

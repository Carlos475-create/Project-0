
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
SELECT t."Name" AS "Pista", ar."Name" AS "Artista"
FROM  "Track" t
JOIN "Album" a  ON t."AlbumId" = a."AlbumId" 
JOIN  "Artist"ar on a."ArtistId" = ar."ArtistId" 
ORDER BY  ar."Name", t."Name";

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
SELECT ar."Name" as Nombre_Artista, a."Title" as Titulo_Album
FROM "Artist" ar
JOIN "Album" a on ar."ArtistId" = a."ArtistId" 
ORDER BY  ar."Name" , a."Title" ;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
SELECT c."FirstName" AS "Nombre_Cliente", sum(i."Total") AS "Total_Facturas"
FROM "Customer" c 
JOIN "Invoice"i ON c."CustomerId" = i."CustomerId" 
GROUP BY  c."CustomerId" , c."FirstName"
ORDER BY "Total_Facturas" DESC 
LIMIT 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
SELECT e."FirstName" AS "Nombre_empleado",c."FirstName" AS "Nombre_cliente"
FROM "Employee" e 
JOIN "Customer" c ON e."EmployeeId" = c."SupportRepId" 
ORDER BY "Nombre_empleado", "Nombre_cliente";

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
SELECT i."InvoiceId" AS "Id_Factura", t."Name" AS "Nombre_pista"
FROM "Invoice" i 
JOIN "InvoiceLine" il on i."InvoiceId" = il."InvoiceId"  
ORDER BY i."InvoiceId", t."Name";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
SELCT ar."Name" AS "Nombre_artista", g."Name" AS "Nombre_género"
FROM "Artist" ar 
JOIN "Album" a ON ar."ArtistId" = a."ArtistId" 
JOIN "Track" t ON a."AlbumId" = t."AlbumId" 
JOIN "Genre" g ON t."GenreId" = g."GenreId"
gGROUP BY ar."Name", g."Name" 
ORDER BY ar."Name" ,g."Name";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
SELECT t."Name" AS "Nombre_pista" , t."MediaTypeId" AS "Tipo_medio" 
FROM "Track" t 
JOIN "MediaType" mt ON t."MediaTypeId" = mt."MediaTypeId" 
ORDER BY 	t."Name" , mt."MediaTypeId";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
SELECT  t."Name" AS "Nombre_pista", g."Name" AS "Nombre_genero"
FROM "Track" t
LEFT JOIN "Genre" g ON t."GenreId" = g."GenreId" 
ORDER BY t."Name";

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).


-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
SELECT g."Name" AS "Nombre_Genero",COUNT(t."TrackId") AS "Numero_Pistas"
FROM "Genre" g 
LEFT "Track" t ON g."GenreId" = t."GenreId" 
GROUP BY g."Name" 
ORDER BY  "Numero_Pistas" DESC;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.


-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.


-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.




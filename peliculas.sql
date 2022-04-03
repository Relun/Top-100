--1. Crear una base de datos llamada películas
CREATE DATABASE peliculas;
--me ubico en la base de datos peliculas con el usuario clau
\c peliculas clau 
--2. Cargar ambos archivos a su tabla correspondiente
--creación de las tablas a través de pgadmin
CREATE TABLE IF NOT EXISTS public.peliculas(
    id_peli serial,
    pelicula character varying(100),
    fecha_estreno integer,
    director character varying(50),
    PRIMARY KEY (id_peli));
CREATE TABLE IF NOT EXISTS public.reparto(
    id_peli integer NOT NULL,
	nombre character varying(50),
	FOREIGN KEY (id_peli) REFERENCES public.peliculas(id_peli));
--carga archivo peliculas
\copy peliculas FROM 'C:\Users\claud\Desktop\EmprendimientoRuby\7. Intro-Bases-Datos\des_evaluado1\peliculas.csv' csv header;
--carga archivo reparto
\copy reparto FROM 'C:\Users\claud\Desktop\EmprendimientoRuby\7. Intro-Bases-Datos\des_evaluado1\reparto.csv' csv;
--3. Obtener el ID de la película “Titanic”
SELECT id_peli FROM peliculas WHERE pelicula='Titanic';
--4. Listar a todos los actores que aparecen en la película "Titanic"
SELECT * FROM reparto WHERE id_peli=2;
--5. Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT count(id_peli) FROM reparto WHERE nombre='Harrison Ford';
--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente
SELECT * FROM peliculas WHERE fecha_estreno BETWEEN 1990 and 1999 ORDER BY pelicula ASC;
--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas GROUP BY pelicula;
--8. Consultar cual es la longitud más grande entre todos los títulos de las películas
SELECT MAX(LENGTH(pelicula)) FROM peliculas;


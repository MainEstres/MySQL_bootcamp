INSERT INTO estudiantes(nombre_estudiante, edad) 
VALUES("Nicolas Aguirre", 25),    
      ("Camila Lepe", 21),       
      ("Roberto Lopez", 24),       
      ("Valeria Silva", 29),       
      ("Sofia Paredes", 22),       
      ("Makarena Reinoso", 30),       
      ("Fabaiola Pezo", 22);

INSERT INTO cursos(nombre_curso, duracion) 
VALUES("Curso de UX/UI", 120),    
      ("Curso de JavaScript", 480),    
      ("Curso de HTML Y CSS", 240),       
      ("Curso de Java", 800),       
      ("Curso de CiberSeguridad", 1000);
      
SELECT * FROM estudiantes;
SELECT * FROM cursos;
SELECT * FROM inscripciones;

INSERT INTO inscripciones(id_estudiante, id_curso) 
VALUES(1,4),    
      (2,4),       
      (6,5),       
      (7,4);

SELECT e.id_estudiante, e.nombre_estudiante AS estudiantes,
       c.id_curso, c.nombre_curso AS cursos
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso;

SELECT c.id_curso, c.nombre_curso AS cursos,
	   e.id_estudiante, e.nombre_estudiante AS estudiante
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso
WHERE c.nombre_curso = 'Curso de Java';

SELECT c.id_curso, c.nombre_curso AS cursos,
	   e.id_estudiante, e.nombre_estudiante AS estudiante
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso
WHERE e.nombre_estudiante = 'Nicolas Aguirre';

SELECT c.nombre_curso AS curso,
       COUNT(i.id_estudiante) AS total_estudiantes
FROM cursos c
LEFT JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre_curso;

SELECT e.id_estudiante, e.nombre_estudiante
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
WHERE i.id_estudiante IS NULL;
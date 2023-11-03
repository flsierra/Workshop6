#SECCION 1, CREACIÓN BASE DE DATOS
CREATE SCHEMA `workshop5` ;
CREATE TABLE IF NOT EXISTS `workshop5`.`usuario` (
  `idUsuario` INT(1) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Nombre_Usuario` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `workshop5`.`amistad` (
  `idAmistad` INT(11) NOT NULL AUTO_INCREMENT,
  `Estado` VARCHAR(20) NOT NULL,
  `Fecha` DATE,
  `fk_id_usuario` INT(11) NOT NULL,
  `fk_id_amigo` INT(11) NOT NULL,
  PRIMARY KEY (`idAmistad`),
  INDEX `fk_id_usuario` (`fk_id_usuario` ASC, `fk_id_amigo` ASC),
  INDEX `fk_id_amigo` (`fk_id_amigo` ASC),
  CONSTRAINT `amistad_ibfk_1`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `workshop5`.`usuario` (`idUsuario`),
  CONSTRAINT `amistad_ibfk_2`
    FOREIGN KEY (`fk_id_amigo`)
    REFERENCES `workshop5`.`usuario` (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `workshop5`.`publicaciones` (
  `idPublicacion` INT(11) NOT NULL AUTO_INCREMENT,
  `Contenido` VARCHAR(45) NOT NULL,
  `fk_id_usuario` INT(11) NOT NULL,
  `fecha_publicacion` DATE,
  PRIMARY KEY (`idPublicacion`),
  INDEX `fk_id_usuario` (`fk_id_usuario` ASC),
  CONSTRAINT `publicaciones_ibfk_1`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `workshop5`.`usuario` (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `workshop5`.`comentarios` (
  `idComentarios` INT(11) NOT NULL AUTO_INCREMENT,
  `Contenido` VARCHAR(50) NOT NULL,
  `fk_id_publicacion` INT(11) NOT NULL,
  `fk_id_usuario` INT(11) NOT NULL,
  `fecha_publicacion` DATE,
  PRIMARY KEY (`idComentarios`),
  INDEX `fk_id_publicacion` (`fk_id_publicacion` ASC, `fk_id_usuario` ASC),
  INDEX `fk_id_usuario` (`fk_id_usuario` ASC),
  CONSTRAINT `comentarios_ibfk_1`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `workshop5`.`usuario` (`idUsuario`),
  CONSTRAINT `comentarios_ibfk_2`
    FOREIGN KEY (`fk_id_publicacion`)
    REFERENCES `workshop5`.`publicaciones` (`idPublicacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS `workshop5`.`mensaje` (
  `idMensaje` INT(11) NOT NULL AUTO_INCREMENT,
  `Mensaje` VARCHAR(50) NOT NULL,
  `EmisorUsuario_id` INT(11) NOT NULL,
  `ReceptorUsuario_id` INT(11) NOT NULL,
  `Fecha` DATE,
  PRIMARY KEY (`idMensaje`),
  INDEX `EmisorUsuario_id` (`EmisorUsuario_id` ASC, `ReceptorUsuario_id` ASC),
  INDEX `ReceptorUsuario_id` (`ReceptorUsuario_id` ASC),
  CONSTRAINT `mensaje_ibfk_1`
    FOREIGN KEY (`EmisorUsuario_id`)
    REFERENCES `workshop5`.`usuario` (`idUsuario`),
  CONSTRAINT `mensaje_ibfk_2`
    FOREIGN KEY (`ReceptorUsuario_id`)
    REFERENCES `workshop5`.`usuario` (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;
#-----------------------------------------------------------
#Seccion 2---
#Inserta por lo menos 5 registros
INSERT INTO Usuario (idUsuario,Nombre, Apellido, Nombre_Usuario, email)
VALUES
    ('1','Brayan', 'Herrera', 'user1', 'user1@example.com'),
    ('2','Carlos', 'Puentes', 'user2', 'user2@example.com'),
    ('3','Fabian', 'Largo', 'user3', 'user3@example.com'),
    ('4','Lugel', 'Franco', 'user4', 'user4@example.com'),
    ('5','Viviana', 'Guzman', 'user5', 'user5@example.com'),
    ('6','Harol', 'Perez', 'user6', 'user6@example.com');
#Registra al menos 5 relaciones de amistad con diferentes estados
insert into amistad (idAmistad,fk_id_usuario,Estado,Fecha, fk_id_amigo)
values('1','1','Pendiente','2023-09-20','3'),
('2','4','Aceptado','2023-09-21','2'),
('3','4','Rechazado','2023-09-02','1'),
('4','4','Aceptado','2023-10-20','5'),
('5','2','Pendiente','2023-09-20','4'),
('6','3','Pendiente','2023-09-20','4');
 #Agregar por lo menos 2 mensajes por cada usuario con amigos diferentes
 INSERT INTO Mensaje (EmisorUsuario_id, ReceptorUsuario_id, Mensaje, Fecha)
VALUES (1, 2, 'Hola, ¿cómo estás?', '2023-10-27'),
	   (2, 5, '¿cuando salimos a parchar?', '2023-07-10');
#Crear una publicación por cada usuario al menos
insert into Publicaciones(idPublicacion, Contenido, fk_id_usuario,fecha_publicacion)
values (1,'Hoy es un buen día','1','2023-10-01'),
	   (2,'¡Hoy es un buen día, para programar!','2','2023-09-30'),
       (3,'¡Hoy es un buen día,para rockear!','3','203-10-25'),
       (4,'¡Hoy es un buen día,para correr!','4','203-10-04'),
	   (5,'¡Hoy es un buen día,para salir!','5','2023-10-27');
#Agregar 2 comentarios en cada publicación creada
INSERT INTO Comentarios (idComentarios,fk_id_publicacion, fk_id_usuario, Contenido, fecha_publicacion)
VALUES (1,1, 2, 'Me alegra escuchar eso.', '2023-10-09'),
	   (2,1,3, 'Genial!!.', '2023-10-30'),
	   (3,2,5,'¿Que lenguaje de programación estas aprendiendo?', '2023-09-01'),
       (4,2,3,'Me alegra saber que te superas','2023-09-14'),
       (5,3,2,'Que pro','2023-10-31'),
       (6,3,1,'Que vacano','2023-11-01'),
       (7,4,3,'Es importante mantener una buena condicion fisica','2023-09-01'),
       (8,4,5,'Que chimba','2023-10-22'),
       (9,5,4,'Que bueno','2023-11-02'),
       (10,5,2,'Que cuca','2023-10-05'),
       (11,2,2,'Estoy aprendiendo Java','2023-09-02');
#-----------------------------------------------------------
# Seccion 3---
#1.Obtener todas las publicaciones de un usuario
select * from publicaciones where fk_id_usuario = '2';
#2.Buscar publicaciones con cierta palabra clave
SELECT * FROM Publicaciones WHERE Contenido LIKE '%día%';
#3.Mostrar los comentarios de una publicación
SELECT * FROM Comentarios WHERE fk_id_publicacion ='4';
#4.	Encontrar los amigos de un usuario
SELECT U.* ,A.Estado
FROM Usuario U
inner join Amistad A on U.idUsuario = A.fk_id_usuario
Where A.fk_id_usuario = '4'  and A.Estado ='Aceptado';
#5.Contar la cantidad de amigos de un usuario
SELECT COUNT(*) 'Número de amigos'
FROM Amistad WHERE fk_id_usuario = '4' AND Estado = 'Aceptado';
#6.Mostrar las publicaciones de los amigos de un usuario
SELECT P.* 
FROM Publicaciones P
INNER JOIN Amistad A ON P.fk_id_usuario = A.fk_id_amigo
WHERE A.fk_id_usuario ='4' AND A.Estado = 'Aceptado';
#7.Listar los usuarios que han comentado una publicación
SELECT U.* 
FROM Usuario U
INNER JOIN Comentarios C ON U.idUsuario = C.fk_id_usuario
Inner Join publicaciones P on P.idPublicacion = C.fk_id_publicacion
WHERE P.idPublicacion = '5';
#8.Listar usuarios que no han aceptado solicitudes.
SELECT U.*, A.Estado,A.fk_id_usuario 'Usuario que envio la solicitud'
FROM Usuario U
INNER JOIN Amistad A ON U.idUsuario = A.fk_id_amigo
WHERE U.idUsuario='4'and A.Estado = 'Pendiente';
#9.	Mostrar las publicaciones más recientes ordenadas por fecha
Select *
from Publicaciones 
order by fecha_publicacion desc;
#10.Mostrar la actividad reciente (publicaciones y comentarios) de un usuario.
SELECT u.nombre AS NombreUsuario, p.Contenido AS Publicacion, p.fecha_publicacion AS FechaPublicacion, NULL AS Comentario
FROM usuario u
INNER JOIN publicaciones p ON u.idUsuario = p.fk_id_usuario
WHERE u.idUsuario = 3
UNION ALL
SELECT u.Nombre, p.Contenido, c.fecha_publicacion, c.Contenido
FROM usuario u
INNER JOIN comentarios c ON u.idUsuario = c.fk_id_usuario
INNER JOIN publicaciones p ON c.fk_id_publicacion = p.idPublicacion
WHERE u.idUsuario = 3
ORDER BY FechaPublicacion DESC;
#11.Encontrar las publicaciones de amigos en un rango de fechas
SELECT P.*
FROM Publicaciones P
INNER JOIN Amistad A ON P.fk_id_usuario = A.fk_id_amigo
WHERE A.fk_id_usuario = '3' AND A.Estado = 'Aceptada'
AND P.fecha_publicacion BETWEEN '2023-09-01' AND '2023-10-01';
#12.Obtener los usuarios que han enviado mensajes a otro usuario
SELECT DISTINCT M.EmisorUsuario_id,M.mensaje, U.Nombre, U.Apellido
FROM Mensaje M
INNER JOIN Usuario U ON M.EmisorUsuario_id = U.idUsuario
WHERE M.ReceptorUsuario_id = '5'; 
#13.Mostrar los mensajes entre dos usuarios
Select *
from mensaje
where EmisorUsuario_id = 1 and ReceptorUsuario_id = 2 or
EmisorUsuario_id = 2 and ReceptorUsuario_id = 5
order by Fecha;
#14.Encontrar usuarios que no tienen amigos
SELECT U.*
FROM Usuario U
LEFT JOIN Amistad A ON U.idUsuario = A.fk_id_usuario
WHERE a.idAmistad is null; 
#15.Mostrar los usuarios que han comentado sus propias publicaciones
select u.Nombre 'El usuario ' , p.Contenido 'Realizo una publicación',c.Contenido 'Y comento sobre su misma publicacion'
from usuario u
inner join publicaciones p on u.idUsuario = p.fk_id_usuario
inner join comentarios c on p.idPublicacion = c.fk_id_publicacion
where c.fk_id_usuario = p.fk_id_usuario;
#16.	Listar las 3 publicaciones más comentadas
SELECT P.*, COUNT(C.idComentarios) AS NumComentarios
FROM Publicaciones P
LEFT JOIN Comentarios C ON P.idPublicacion = C.fk_id_publicacion
GROUP BY P.idPublicacion
ORDER BY NumComentarios DESC
LIMIT 3;
#-----------------------------------------------------------


     

/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.4.8-MariaDB : Database - cineapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cineapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cineapp`;

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `banners` */

insert  into `banners`(`id`,`titulo`,`fecha`,`imagen`,`estado`) values (1,'Estreno - Kong La Isla Calavera','2020-03-08','HY5MFQ2Jslide1.jpg','Activo'),(2,'Proximo Mes - La bella y la bestia','2017-07-27','slide2.jpg','Activo'),(3,'Ya esta aquí - Spider Man, de regreso a casa','2020-03-06','HNY8KI0Hslide3.jpg','Activo'),(6,'Por fin ha llegado el día - Cars 3','2020-03-08','XO15A492slide4.jpg','Activo'),(7,'Un golpe con estilo','2020-03-07','EYGRZZQ8slide5.jpg','Activo');

/*Table structure for table `contacto_generos` */

DROP TABLE IF EXISTS `contacto_generos`;

CREATE TABLE `contacto_generos` (
  `genero` varchar(70) NOT NULL,
  `contacto_id` int(10) NOT NULL,
  PRIMARY KEY (`genero`,`contacto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `contacto_generos` */

insert  into `contacto_generos`(`genero`,`contacto_id`) values ('Acción',20),('Acción',24),('Acción',25),('Aventura',19),('Aventura',21),('Aventura',25),('Ciencia Ficción',20),('Clásica',19),('Clásica',20),('Clásica',22),('Clásica',23),('Clásica',25),('Comedia',21),('Comedia',23),('Comedia',24),('Comedia Romántica',20),('Drama',22),('Terror',23);

/*Table structure for table `contacto_notificaciones` */

DROP TABLE IF EXISTS `contacto_notificaciones`;

CREATE TABLE `contacto_notificaciones` (
  `notificacion` varchar(100) NOT NULL,
  `contacto_id` int(10) NOT NULL,
  PRIMARY KEY (`notificacion`,`contacto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `contacto_notificaciones` */

insert  into `contacto_notificaciones`(`notificacion`,`contacto_id`) values ('Estrenos',19),('Estrenos',23),('Estrenos',24),('Estrenos',25),('Noticias',20),('Noticias',21),('Noticias',23),('Preventas',20),('Promociones',19),('Promociones',20),('Promociones',22),('Promociones',25);

/*Table structure for table `contactos` */

DROP TABLE IF EXISTS `contactos`;

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `experiencia` int(1) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Data for the table `contactos` */

insert  into `contactos`(`id`,`nombre`,`email`,`experiencia`,`comentario`) values (19,'tomas','tomaselfacha@hotmail.com',4,'buena pagina!'),(20,'Pedro','tomasortiz77@hotmail.com',3,'Buena pagina pero tiene que mejorar.'),(21,'martin','xtomiaxeso@hotmail.com',5,'excelente pagina, felicidades!'),(22,'liana','liianarivas77@hotmail.com',3,'nice'),(23,'Agustin','agustin77@hotmail.com',3,'Buena pagina.'),(24,'martin','martintrabajo@hotmail.com',3,'genial la pagina.'),(25,'Enzo','enzotosoni@gmail.com',3,'');

/*Table structure for table `detalles` */

DROP TABLE IF EXISTS `detalles`;

CREATE TABLE `detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director` varchar(100) DEFAULT NULL,
  `actores` varchar(255) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL COMMENT 'URL del video en Youtube\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `detalles` */

insert  into `detalles`(`id`,`director`,`actores`,`sinopsis`,`trailer`) values (1,'Jordan Vogt-Roberts','Samuel L. Jackson,Tom Hiddleston,Brie Larson,Toby Kebbell','Kong: La Isla Calavera reimagina el origen del mítico Kong en una irresistible aventura original del director Jordan Vogt-Roberts. En la película, un diverso equipo de exploradores es reunido para aventurarse en el interior de una isla del Pacífico tan bella como traicionera que no aparece en los mapas, sin saber que están invadiendo los dominios del mítico Kong.','https://www.youtube.com/embed/vq1Q-KiwdZ8'),(2,'Daniel Espinosa','Jake Gyllenhaal, Ryan Reynolds, Rebecca Ferguson','Seis miembros de la tripulación de la Estación Espacial Internacional que están a punto de lograr uno de los descubrimientos más importantes en la historia humana: la primera evidencia de vida extraterrestre en Marte. A medida que el equipo comienza a investigar y sus métodos tienen consecuencias inesperadas, la forma viviente demostrará ser más inteligente de lo que cualquiera esperaba.','https://www.youtube.com/embed/_cq1XIVXdjU'),(3,'Bill Condon','Dan Stevens,Emma Watson,Luke Evans','LA BELLA Y LA BESTIA, de Disney, es una adaptación de acción real de la película animada, que revive a los queridos personajes del clásico cuento de Disney para una audiencia contemporánea, manteniendo la música original e incorporando varias nuevas canciones.','https://www.youtube.com/embed/4D8N06nx9rs'),(4,'Oriol Paulo','Mario Casas, Bárbara Lennie, José Coronado, Ana Wagener','Adrián Doria, un joven y exitoso empresario, despierta en la habitación de un hotel junto al cadáver de su amante. Acusado de asesinato, decide contratar los servicios de Virginia Goodman, la mejor preparadora de testigos del país. En el transcurso de una noche, asesora y cliente trabajarán para encontrar una duda razonable que le libre de la cárcel.','https://www.youtube.com/embed/sOxy2gtPY7A'),(5,'Dean Israelite','Bryan Cranston, Elizabeth Banks, Becky G, Dacre Montgomery','Cinco adolescentes deben convertirse en algo extraordinario al enterarse que su pueblo, Angel Grove, y el mundo están a punto de ser aniquilados por una amenaza extraterrestre. Escogidos por el destino, nuestros héroes pronto descubren que son los únicos que pueden salvar el planetapero para hacerlo, deberán superar sus problemas de la vida real y, antes que sea demasiado tarde, unirse como los PowerRangers.','https://www.youtube.com/embed/gemUEi0XMTg'),(6,'F. Gary Gray','Dwayne Johnson,Michelle Rodriguez,Charlize Theron,Jason Statham,Vin Diesel','Justo cuando Dom y Letty celebran su luna de miel, Brian y Mia se han retirado del juego y el resto del equipo se ha desintegrado en busca de una vida comun y corriente; una misteriosa mujer intentara seducir a Dom para convencerlo de regresar a la vida criminal que tanto lo acecha, traicionando a quienes lo rodean y enfrentandose a retos nunca antes vistos.','https://www.youtube.com/embed/3KuazYQ1JuE'),(7,'James Gunn','Dave Bautista,Bradley Cooper,Zoe Saldana,Vin Diesel,Chris Pratt','Ambientada en el nuevo contexto sonoro de \"Awesome Mixtape #2\", GUARDIANES DE LA GALAXIA VOL. 2, de Marvel, continua las aventuras del equipo en su travesia por los confines del cosmos. Los Guardianes deberan luchar para mantener unida a su nueva familia mientras intentan resolver el misterio del verdadero linaje de Peter Quill. Viejos rivales se convertiran en nuevos aliados y los personajes favoritos de los comics clasicos acudiran en ayuda de nuestros heroes a medida que el Universo Cinematografico de Marvel continua expandiendose.','https://www.youtube.com/embed/bBTtlcJwjSo'),(8,'Sam Raimi','Peter Parker, Mary Jane Watson, Gwen Stacy, Betty Brant','Un tímido estudiante se vuelve en un luchador contra el crimen, desde que la picadura de una araña mutante le da poderes extraordinarios.','https://www.youtube.com/embed/TYMMOjBUPMM');

/*Table structure for table `horarios` */

DROP TABLE IF EXISTS `horarios`;

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `sala` varchar(100) NOT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `idPelicula` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Horarios_Peliculas1_idx` (`idPelicula`),
  CONSTRAINT `fk_Horarios_Peliculas1` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

/*Data for the table `horarios` */

insert  into `horarios`(`id`,`fecha`,`hora`,`sala`,`precio`,`idPelicula`) values (1,'2020-03-12','18:00:00','Premium',235,1),(2,'2020-03-12','18:00:00','Premium',55,3),(3,'2020-03-13','21:00:00','Premium',55,3),(4,'2020-03-12','18:00:00','Premium',65,4),(5,'2020-03-06','21:00:00','Premium',65,4),(6,'2020-03-14','20:00:00','Premium',55,5),(7,'2020-03-13','16:30:00','Premium',60,7),(10,'2020-03-07','16:00:00','Sala 1',55,1),(11,'2020-03-10','14:00:00','Sala 1',60,2),(12,'2020-03-09','16:00:00','Sala 1',60,2),(13,'2020-03-06','14:00:00','Sala 1',55,3),(14,'2020-03-10','16:00:00','Sala 1',55,3),(15,'2020-03-06','14:00:00','Sala 1',65,4),(16,'2020-03-06','16:00:00','Sala 1',65,4),(17,'2020-03-06','17:00:00','Sala 1',55,5),(18,'2020-03-06','19:00:00','Sala 1',55,5),(19,'2020-03-06','21:00:00','Sala 1',55,5),(20,'2020-03-06','18:45:00','Sala 1',55,8),(21,'2020-03-06','21:45:00','Sala 1',55,8),(22,'2020-03-10','17:00:00','Sala 2',55,3),(23,'2020-03-06','17:00:00','Sala 2',65,4),(24,'2020-03-06','16:00:00','Sala 2',55,5),(25,'2020-03-06','18:30:00','Sala 2',60,7),(26,'2020-03-07','16:00:00','Sala 3',55,3),(27,'2020-03-06','16:00:00','Sala 3',65,4),(28,'2020-03-06','22:00:00','Sala 3',55,5),(29,'2020-03-06','20:45:00','Sala 3',60,7),(30,'2020-03-06','22:20:00','Sala 3',55,8),(31,'2020-03-06','18:00:00','Premium',55,1),(32,'2020-03-10','18:00:00','Premium',55,3),(33,'2020-03-08','21:00:00','Premium',55,3),(34,'2020-03-06','18:00:00','Premium',65,4),(35,'2020-03-06','21:00:00','Premium',65,4),(36,'2020-03-06','14:30:00','Premium',55,8),(37,'2020-03-06','17:00:00','Premium',55,8),(38,'2020-03-10','14:35:00','Sala 2',170,1),(39,'2020-03-08','16:00:00','Sala 1',55,1),(40,'2020-03-06','14:00:00','Sala 1',60,2),(41,'2020-03-10','16:00:00','Sala 1',60,2),(42,'2020-03-08','14:00:00','Sala 1',55,3),(43,'2020-03-06','16:00:00','Sala 1',55,3),(44,'2020-03-06','14:00:00','Sala 1',65,4),(45,'2020-03-07','16:00:00','Sala 1',65,4),(47,'2020-03-07','17:00:00','Sala 2',55,3),(48,'2020-03-06','17:00:00','Sala 2',65,4),(49,'2020-03-06','17:00:00','Sala 2',55,8),(50,'2020-03-09','16:00:00','Sala 3',55,3),(51,'2020-03-07','16:00:00','Sala 3',65,4),(52,'2020-03-06','22:10:00','Sala 3',55,8),(53,'2020-03-06','18:00:00','Premium',55,5),(54,'2020-03-06','21:00:00','Premium',55,5),(55,'2020-03-07','20:00:00','Premium',60,2),(56,'2020-03-06','15:30:00','Premium',55,8),(57,'2020-03-06','14:00:00','Sala 1',55,5),(58,'2020-03-06','16:00:00','Sala 1',55,5),(59,'2020-03-06','17:00:00','Sala 1',60,2),(60,'2020-03-09','19:00:00','Sala 1',60,2),(61,'2020-03-06','21:00:00','Sala 1',60,2),(62,'2020-03-06','20:30:00','Sala 1',55,8),(63,'2020-03-06','13:30:00','Sala 1',60,7),(64,'2020-03-06','17:00:00','Sala 2',55,5),(65,'2020-03-07','16:00:00','Sala 2',60,2),(66,'2020-03-06','17:15:00','Sala 2',55,8),(67,'2020-03-06','13:30:00','Sala 2',60,7),(68,'2020-03-06','18:00:00','Sala 2',60,7),(69,'2020-03-06','21:30:00','Sala 2',60,7),(70,'2020-03-06','16:00:00','Sala 3',55,5),(71,'2020-03-08','22:00:00','Sala 3',60,2),(72,'2020-03-06','17:15:00','Sala 3',55,8),(73,'2020-03-06','14:00:00','Sala 3',60,7),(74,'2020-03-06','22:00:00','Sala 3',60,7),(75,'2020-03-06','22:15:00','Premium',55,5),(76,'2020-03-06','14:30:00','Premium',60,7),(77,'2020-03-06','17:00:00','Premium',60,7),(78,'2020-03-06','11:00:00','Premium',55,8),(80,'2020-03-06','21:30:00','Sala 1',60,7),(81,'2020-03-06','15:30:00','Sala 1',55,8),(82,'2020-03-06','15:30:00','Sala 2',55,5),(83,'2020-03-06','21:30:00','Sala 2',60,7),(84,'2020-03-06','11:00:00','Sala 2',55,8),(85,'2020-03-06','17:55:00','Sala 2',55,8),(86,'2020-03-06','16:40:00','Sala 3',55,5),(87,'2020-03-06','14:30:00','Sala 3',60,7),(88,'2020-03-06','17:00:00','Sala 3',60,7),(89,'2020-03-06','21:30:00','Sala 3',60,7),(90,'2020-03-06','11:00:00','Sala 3',55,8),(92,'2020-03-06','13:30:00','Premium',55,8),(94,'2020-03-06','17:30:00','Premium',55,8),(95,'2020-03-06','21:00:00','Premium',55,8),(96,'2020-03-06','17:00:00','Premium',60,7),(97,'2020-03-06','20:45:00','Premium',60,7),(98,'2020-03-06','16:15:00','Sala 1',55,8),(99,'2020-03-06','18:30:00','Sala 1',55,8),(100,'2020-03-06','21:30:00','Sala 1',55,8),(101,'2020-03-06','16:15:00','Sala 2',60,7),(102,'2020-03-06','20:15:00','Sala 2',60,7),(103,'2020-03-06','22:50:00','Sala 2',60,7),(104,'2020-03-06','14:40:00','Sala 3',55,8),(105,'2020-03-06','20:10:00','Sala 3',55,8),(106,'2020-03-09','17:35:00','Premium',300,1),(107,'2020-03-08','21:45:00','Premium',350,5),(108,'2020-03-07','18:00:00','Sala 3',300,8),(109,'2020-03-09','17:35:00','Sala 2',350,8),(110,'2020-03-09','22:35:00','Premium',375,4),(111,'2020-03-10','14:05:00','Sala 1',230,1),(112,'2020-03-10','15:00:00','Sala 1',235,1),(113,'2020-03-11','15:35:00','Premium',250,7),(114,'2020-03-11','18:30:00','Sala 2',200,7),(115,'2020-03-12','13:45:00','Premium',265,9);

/*Table structure for table `noticias` */

DROP TABLE IF EXISTS `noticias`;

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` text NOT NULL,
  `estado` enum('Activa','Inactiva') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `noticias` */

insert  into `noticias`(`id`,`titulo`,`fecha`,`detalle`,`estado`) values (1,'Bob Esponja: tercera pelicula y temporada 12','2017-10-22','<p><strong><span style=\"color: #ff0000;\">Nickelodeon y productor de SpongeBob Square Pants confirman temporada 12 de 52 episodios y tercera pel&iacute;cula pr&oacute;ximamente. </span></strong></p>\r\n<p><strong>&iexcl;Calamardo est&aacute; enojado!Bob Esponja: tercera pel&iacute;cula y temporada 12</strong></p>\r\n<p>Nickelodeon y productor de SpongeBob Square Pants confirman temporada 12 de 52 episodios y tercera pel&iacute;cula pr&oacute;ximamente. &iexcl;Calamardo est&aacute; enojado!.</p>\r\n<p>A lado de cierta Pi&ntilde;a (debajo del mar), Calamardo debe estar de muy mal humor, pues hay Bob Esponja para rato... &iexcl;y por partida doble!. Por un lado, Vincent Waller (The Ren &amp; Stimpy Show), artista, productor, escritor y supervisor creativo de SpongeBob Squarepants anunci&oacute; con un divertido dibujo desde su cuenta de Twitter que, antes de que se estrene siquiera la temporada 11 de la serie animada, se ha confirmado ya la n&uacute;mero 12, &iexcl;que constar&aacute; de 52 episodios (recuerden que cada emisi&oacute;n consta de 2 aventuras)!</p>','Activa'),(2,'Julia Roberts protagonizara. The Bookseller','2017-10-23','<p>La novela de Cynthia Swanson <span style=\"color: #0000ff;\"><strong>The Bookseller</strong></span> ser&aacute; llevada al cine con <span style=\"color: #0000ff;\">Julia Roberts (Los Pitufos: La aldea Escondida)</span> como protagonista.<br /><br />La historia est&aacute; ambientada en los sesenta y su protagonista es una mujer soltera, Kitty Miller, que lleva una librer&iacute;a. Sue&ntilde;a con una vida alternativa en la que ha encontrado el amor y est&aacute; casada y con hijos, pero la l&iacute;nea que separa realidad y ficci&oacute;n comienza a estar demasiado dispersa para que la distinga.<br /><br />Seg&uacute;n informa <span style=\"color: #ff0000;\"><strong>Moviehole</strong></span> Roberts tambi&eacute;n producir&aacute; la pel&iacute;cula junto a Lisa Gillan y Marisa Yeres Hill.</p>','Activa'),(3,'Rosamund Pike sera Marie Curie','2020-03-08','<p><strong>Rosamund Pike</strong> (<span style=\"color: #008000;\">Un Reino Unido</span>) dar&aacute; vida a la famosa cient&iacute;fica Marie Curie en la pel&iacute;cula de Studiocanal <strong>Radioactiv</strong>. Se trata de una adaptaci&oacute;n de la biograf&iacute;a escrita por Lauren Redniss, que se centra en el romance entre Marie y Pierre Curie y en el descubrimiento de la radiactividad.<br /><br />Seg&uacute;n informa <span style=\"color: #008000;\"><strong>Premiere</strong></span> el proceso de casting para los papeles de Pierre y de Paul Langevin, su joven amante, ya ha comenzado.<br /><br />Marjane Satrapi dirigir&aacute; a partir de un gui&oacute;n de Jack Thorne. Tim Bevan, Eric Fellner y Paul Webster producir&aacute;n la pel&iacute;cula.</p>','Activa'),(4,'Julianne Moore será Gloria','2020-03-07','<p><strong><span style=\"color: #0000ff;\">Julianne Moore</span></strong> <span style=\"color: #808080;\">(Kingsman: El C&iacute;rculo de Oro)</span> protagonizar&aacute; el remake de FilmNation de la pel&iacute;cula chilena <em><strong>Gloria</strong></em>.<br /><br />Sebastian Lelio, director de la pel&iacute;cula original, escribir&aacute; el gui&oacute;n del remake, que todav&iacute;a no tiene t&iacute;tulo.<br /><br />Moore ser&aacute; Gloria, una mujer de 58 a&ntilde;os que est&aacute; sola en la vida. Para compensar el vac&iacute;o, llena sus d&iacute;as de actividades y por las noches busca el amor en el mundo de las fiestas para solteros adultos, donde solo consigue perderse en una serie de aventuras sin sentido. Esta fr&aacute;gil felicidad en la que vive se altera cuando conoce a Rodolfo, un hombre de 65 a&ntilde;os, recientemente separado, que se obsesiona con ella. Gloria comienza un romance, pero &eacute;ste se complica por la enfermiza dependencia de Rodolfo hacia sus hijos y su ex mujer. Esta relaci&oacute;n, a la que Gloria se entrega porque intuye que podr&iacute;a ser la &uacute;ltima, acabar&aacute; por hacerla estrellarse contra la cruel realidad del mundo. Gloria deber&aacute; reconstruirse para enfrentar con nuevas fuerzas su definitiva entrada a la vejez.&nbsp;<br /><br />Seg&uacute;n <span style=\"color: #008000;\"><strong>The Hollywood Reporter</strong> </span>Juan de Dios Larrain y Pablo Larrain producir&aacute;n la cinta, que comenzar&aacute; a rodarse a finales de mes.</p>','Activa'),(10,'\"Parasite\" triunfa en los Oscar: Bong Joon-ho, de director \"vetado\" en Corea del Sur a conquistar Hollywood','2020-03-08','<h5 class=\"story-body__introduction\" style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; font-weight: bold; line-height: 1.375; margin: 28px 0px 0px; padding: 0px; vertical-align: baseline; text-align: justify;\">&nbsp;</h5>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 16px;\"><span style=\"font-family: Helmet, Freesans, Helvetica, Arial, sans-serif;\">De pronto, el nombre de <strong>Bong Joon-ho</strong> est&aacute; en la boca de los amantes del cine gracias al hist&oacute;rico triunfo de Parasite (\"Par&aacute;sitos\") en los <span style=\"color: #ffcc00;\">Oscar 2020</span>: se llev&oacute; cuatro galardones, incluyendo el de mejor pel&iacute;cula. Pese a que el &eacute;xito de su &uacute;ltima pel&iacute;cula lo catapult&oacute; a la fama internacional, Bong, de 50 a&ntilde;os, lleva una trayectoria de m&aacute;s de dos d&eacute;cadas en el arte cinematogr&aacute;fico y no todas escondido en las pantallas del lejano oriente. Desde comienzos de los 2000, empez&oacute; a proyectarse internacionalmente, ganando cr&iacute;tica favorable y acumulando premios en festivales fuera de su pa&iacute;s, en los que ahora es frecuentemente un respetado miembro del jurado. Con \"Parasite\", son siete los largometrajes que ha dirigido.</span></span></p>','Activa');

/*Table structure for table `peliculas` */

DROP TABLE IF EXISTS `peliculas`;

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `duracion` int(11) NOT NULL,
  `clasificacion` enum('A','B','C') NOT NULL,
  `genero` varchar(45) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `fechaEstreno` date NOT NULL,
  `estado` enum('Activa','Inactiva') NOT NULL DEFAULT 'Activa',
  `idDetalle` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Peliculas_Detalles1_idx` (`idDetalle`),
  CONSTRAINT `fk_Peliculas_Detalles1` FOREIGN KEY (`idDetalle`) REFERENCES `detalles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `peliculas` */

insert  into `peliculas`(`id`,`titulo`,`duracion`,`clasificacion`,`genero`,`imagen`,`fechaEstreno`,`estado`,`idDetalle`) values (1,'Kong La Isla Calavera',118,'B','Acción','kong.png','2017-10-20','Activa',1),(2,'Life: Vida Inteligente',104,'B','Drama','life.png','2017-10-20','Activa',2),(3,'La Bella y La Bestia',132,'A','Infantil','bella.png','2017-10-20','Activa',3),(4,'Contratiempo',106,'B','Thriller','contratiempo.png','2017-10-22','Activa',4),(5,'Power Rangers',120,'B','Aventura','power-rangers.png','2017-10-22','Activa',5),(7,'Rapidos y Furiosos 8',145,'B','Acción','rapidos-furiosos.png','2017-10-24','Inactiva',6),(8,'Guardianes de la Galaxia Vol 2',136,'B','Acción','guardianes-galaxia.png','2017-10-24','Activa',7),(9,'Spiderman',129,'B','Acción y Aventura','ZCQ0A2A7spider-man.jpg','2020-03-09','Activa',8);

/*Table structure for table `perfiles` */

DROP TABLE IF EXISTS `perfiles`;

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `perfil` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorities_idx_2` (`username`,`perfil`),
  UNIQUE KEY `username_perfil_UNIQUE` (`username`,`perfil`),
  CONSTRAINT `authorities_ibfk_2` FOREIGN KEY (`username`) REFERENCES `usuarios` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `perfiles` */

insert  into `perfiles`(`id`,`username`,`perfil`) values (1,'agus','EDITOR'),(5,'martin','EDITOR'),(2,'tomas','GERENTE');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`username`,`password`,`activo`,`email`,`telefono`) values (1,'agus','{noop}agus123',1,'agus@test.com','9856523'),(2,'tomas','$2a$10$T1qIYb6DC3JLMgvLw4DtWOAk6FFHZ7EC75PnBa3tOzlYMou.I4Z0m',1,'tomas@example.com','9856482'),(3,'martin','$2a$10$PzIQ7Cn6IlnanF4sdS7u2uxT06tb4oRVn.FgeDNvFv2zrBUpPQ1fy',1,'martintrabajo@hotmail.com','312314');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

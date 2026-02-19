-- 1. Creamos la base de datos y la seleccionamos
CREATE DATABASE IF NOT EXISTS TiendaEcommerce;
USE TiendaEcommerce;

-- 2. Borramos tablas si existen (para evitar errores al re-ejecutar)
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Facturas;
DROP TABLE IF EXISTS Articulos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Almacenes;

-- 3. Creacion de tablas (Sin 'dbo.')
CREATE TABLE Clientes (
	IDCliente INT NOT NULL PRIMARY KEY,
	Tipo VARCHAR(100),
	Nombre VARCHAR(100),
	NIF INT,
	CIF VARCHAR(100),
	SedeSocial VARCHAR(100),
	FechaAlta DATE
);

CREATE TABLE Articulos (
	IDArticulo INT NOT NULL PRIMARY KEY,
	Tipo VARCHAR(100),
	Subtipo VARCHAR(100),
	Color VARCHAR(100),
	Talla VARCHAR(100),
	PrecioUnitario DECIMAL(10,2),
	Impuesto DECIMAL(3,2)
);

CREATE TABLE Almacenes (
	IDAlmacen INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Ciudad VARCHAR(100),
	CCAA VARCHAR(100),
	NTrabajadores INT,
	Metros INT
);

CREATE TABLE Facturas (
	Factura INT NOT NULL PRIMARY KEY,
	Estado VARCHAR(100),
	FechaPedido DATE,
	FechaEntregaEstimada DATE,
	FechaEntrega DATE,
	IDCliente INT,
	IDAlmacen INT
);

CREATE TABLE Pedidos(
	IDTransaccion INT NOT NULL PRIMARY KEY,
	Factura INT,
	IDArticulo INT,
	Cantidad INT
);

-- 4. Insertamos valores (Formato de fecha YYYY-MM-DD es más seguro en MySQL)
INSERT INTO Clientes VALUES 
(3658,'Empresa','YTR SL',NULL,'1335S','Madrid','2002-01-12'),
(2482,'Empresa','PBR SA',NULL,'5789D','Barcelona','2005-07-06'),
(3569,'Persona','Jose Gomez',4587921,NULL,'Sevilla','2011-02-25'),
(7895,'Empresa','12TTE SA',NULL,'3578P','Navarra','2007-04-09'),
(2351,'Persona','Raul Jimenez',1256874,NULL,'Malaga','2015-08-15'),
(4589,'Persona','Pedro Vazquez',9658742,NULL,'Asturias','2017-05-03'),
(3652,'Empresa','Trend SA',NULL,'7569M','Galicia','2000-02-01'),
(1125,'Empresa','ECOM SL',NULL,'5648Q','Valencia','2013-09-19'),
(4689, 'Persona', 'Ramon Rodriguez', 2589645, NULL, 'Sevilla', '2016-07-22'),
(4695, 'Empresa', '67RS SL', NULL, '2345K', 'Malaga', '2017-11-12');

INSERT INTO Articulos VALUES 
(112,'Zapatilla','Futbol','Verde','36-40',112.00,0.21),
(335,'Botin','Alto','Marron','40-45',56.50,0.21),
(339,'Botin','Medio','Negro','40-45',48.56,0.21),
(341,'Botin','Entretiempo','Gris','40-45',70.50,0.21),
(121,'Zapatilla','Baloncesto','Rojo','42-49',99.5,0.21),
(126,'Zapatilla','Running','Rosa','32-40',150.00,0.21),
(128,'Zapatilla','Casual','Negro','32-45',45.00,0.21),
(136,'Zapatilla','Tenis','Blanco','32-42',66.5,0.21);

INSERT INTO Almacenes VALUES 
(98,'ALM 98','Mijas','Andalucia',75,1000),
(52,'ALM 52','Getafe','Madrid',260,5000),
(36,'ALM 36','Girona','Cataluna',300,6000),
(48,'ALM 48','Bilbao','Pais Vasco',155,3500),
(96,'ALM 96','Castellon','Comunidad Valenciana',95,1200),
(100, 'ALM 100', 'Algeciras', 'Andalucia', 50, 750);

INSERT INTO Facturas VALUES 
(56354,'Enviado','2019-01-15','2019-01-25','2019-01-23',3569,52),
(25647,'Enviado','2018-06-12','2018-06-14','2019-06-17',3652,48),
(32569,'Cancelado','2018-03-03','2018-03-23',NULL,3658,96),
(87952,'Enviado','2019-09-26','2019-10-10','2019-10-05',2482,36),
(32567,'Enviado','2018-09-17','2018-09-27','2018-09-30',2351,52),
(25489,'Enviado','2019-11-11','2019-11-21','2019-11-25',4589,48),
(96523,'Cancelado','2019-03-23','2019-04-01',NULL,4589,96),
(23548,'Enviado','2019-04-09','2019-04-29','2019-04-20',2482,98),
(65896,'Cancelado','2019-06-13','2019-06-25',NULL,7895,36),
(75423,'Enviado','2018-12-24','2019-01-05','2019-01-08',1125,98),
(76324, 'Enviado', '2018-04-15', '2018-05-01', '2018-04-26', 3569, 36),
(24536, 'Enviado', '2019-06-22','2019-07-06','2019-07-01',2482, 48),
(41256, 'Cancelado', '2019-11-17','2018-11-27',NULL,4589,52),
(96542, 'Enviado', '2019-03-02','2019-04-09','2019-04-15',1125,48);

INSERT INTO Pedidos VALUES 
(12458963,56354,112,5),
(12458964,56354,121,6),
(12458965,56354,136,13),
(12458966,25647,335,45),
(12458967,25647,126,32),
(12458968,25647,128,21),
(12458969,25647,339,96),
(12458970,32569,341,100),
(12458971,32569,121,2),
(12458972,87952,112,34),
(12458973,87952,136,56),
(12458974,87952,339,78),
(12458975,32567,341,36),
(12458976,32567,112,14),
(12458977,32567,339,33),
(12458978,32567,121,55),
(12458979,25489,126,90),
(12458980,25489,136,23),
(12458981,25489,335,16),
(12458982,96523,339,32),
(12458983,96523,126,29),
(12458984,96523,128,10),
(12458985,23548,112,5),
(12458986,23548,341,63),
(12458987,65896,121,15),
(12458988,65896,136,46),
(12458989,65896,335,36),
(12458990,75423,339,12),
(12458991,75423,126,53),
(12458992,75423,128,26),
(12458993,76324,126,20),
(12458994,76324,136,20),
(12458995,76324,339,30),
(12458996,76324,341,50),
(12458997,76324,126,40),
(12458998,24536,121,55),
(12458999,24536,126,55),
(12459000,24536,128,55),
(12459001,24536,136,55),
(12459002,41256,112,100),
(12459003,41256,121,100),
(12459004,96542,339,15),
(12459005,96542,341,20),
(12459006,96542,335,35);

USE AdventureWorks2017;
-- Actividad Consultas SQL

-- DROP TABLE Pedidos
-- DROP TABLE Clientes
-- DROP TABLE Articulos
-- DROP TABLE Almacenes
-- DROP TABLE Facturas

-- Creacion de tablas

CREATE TABLE Clientes (
	IDCliente INT NOT NULL PRIMARY KEY,
	Tipo VARCHAR(100),
	Nombre VARCHAR(100),
	NIF INT,
	CIF VARCHAR(100),
	SedeSocial VARCHAR(100),
	FechaAlta DATE);

CREATE TABLE Articulos (
		IDArticulo INT NOT NULL PRIMARY KEY,
		Tipo VARCHAR(100),
		Subtipo VARCHAR(100),
		Color VARCHAR(100),
		Talla VARCHAR(100),
		PrecioUnitario DECIMAL(10,2),
		Impuesto DECIMAL(3,2));

CREATE TABLE Almacenes (
	IDAlmacen INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Ciudad VARCHAR(100),
	CCAA VARCHAR(100),
	NTrabajadores INT,
	Metros INT);


CREATE TABLE Facturas (
	Factura INT NOT NULL PRIMARY KEY,
	Estado VARCHAR(100),
	FechaPedido DATE,
	FechaEntregaEstimada DATE,
	FechaEntrega DATE,
	IDCliente INT,
	IDAlmacen INT);


CREATE TABLE Pedidos(
	IDTransaccion INT NOT NULL PRIMARY KEY,
	Factura INT,
	IDArticulo INT,
	Cantidad INT);

-- Insertamos valores

INSERT INTO Clientes (IDCliente, Tipo, Nombre, NIF, CIF, SedeSocial, FechaAlta)
VALUES (3658,'Empresa','YTR SL',NULL,'1335S','Madrid','20020112'),
(2482,'Empresa','PBR SA',NULL,'5789D','Barcelona','20050706'),
(3569,'Persona','Jose Gomez',4587921,NULL,'Sevilla','20110225'),
(7895,'Empresa','12TTE SA',NULL,'3578P','Navarra','20070409'),
(2351,'Persona','Raul Jimenez',1256874,NULL,'Malaga','20150815'),
(4589,'Persona','Pedro Vazquez',9658742,NULL,'Asturias','20170503'),
(3652,'Empresa','Trend SA',NULL,'7569M','Galicia','20000201'),
(1125,'Empresa','ECOM SL',NULL,'5648Q','Valencia','20130919'),
(4689, 'Persona', 'Ramon Rodriguez', 2589645, NULL, 'Sevilla', '20160722'),
(4695, 'Empresa', '67RS SL', NULL, '2345K', 'Malaga', '20171112');

INSERT INTO Articulos (IDArticulo, Tipo, Subtipo, Color, Talla, PrecioUnitario, Impuesto)
VALUES (112,'Zapatilla','Futbol','Verde','36-40',112.00,0.21),
(335,'Botin','Alto','Marron','40-45',56.50,0.21),
(339,'Botin','Medio','Negro','40-45',48.56,0.21),
(341,'Botin','Entretiempo','Gris','40-45',70.50,0.21),
(121,'Zapatilla','Baloncesto','Rojo','42-49',99.5,0.21),
(126,'Zapatilla','Running','Rosa','32-40',150.00,0.21),
(128,'Zapatilla','Casual','Negro','32-45',45.00,0.21),
(136,'Zapatilla','Tenis','Blanco','32-42',66.5,0.21);

INSERT INTO Almacenes (IDAlmacen, Nombre, Ciudad, CCAA, NTrabajadores, Metros)
VALUES (98,'ALM 98','Mijas','Andalucia',75,1000),
(52,'ALM 52','Getafe','Madrid',260,5000),
(36,'ALM 36','Girona','Cataluna',300,6000),
(48,'ALM 48','Bilbao','Pais Vasco',155,3500),
(96,'ALM 96','Castellon','Comunidad Valenciana',95,1200),
(100, 'ALM 100', 'Algeciras', 'Andalucia', 50, 750);

INSERT INTO Facturas (Factura, Estado, FechaPedido, FechaEntregaEstimada, FechaEntrega, IDCliente, IDAlmacen)
VALUES 
(56354,'Enviado','20190115','20190125','20190123',3569,52),
(25647,'Enviado','20180612','20180614','20190617',3652,48),
(32569,'Cancelado','20180303','20180323',NULL,3658,96),
(87952,'Enviado','20190926','20191010','20191005',2482,36),
(32567,'Enviado','20180917','20180927','20180930',2351,52),
(25489,'Enviado','20191111','20191121','20191125',4589,48),
(96523,'Cancelado','20190323','20190401',NULL,4589,96),
(23548,'Enviado','20190409','20190429','20190420',2482,98),
(65896,'Cancelado','20190613','20190625',NULL,7895,36),
(75423,'Enviado','20181224','20190105','20190108',1125,98),
(76324, 'Enviado', '20180415', '20180501', '20180426', 3569, 36),
(24536, 'Enviado', '20190622','20190706','20190701',2482, 48),
(41256, 'Cancelado', '20191117','20181127',NULL,4589,52),
(96542, 'Enviado', '20190302','20190409','20190415',1125,48);


INSERT INTO Pedidos (IDTransaccion, Factura, IDArticulo, Cantidad)
VALUES (12458963,56354,112,5),
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
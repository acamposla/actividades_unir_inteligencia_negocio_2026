USE AdventureWorks2017		


/*
DROP TABLE Tienda_Clientes;
DROP TABLE Tienda_Territorio;
DROP TABLE Tienda_Tiendas;
DROP TABLE Tienda_Categoria_Productos;
DROP TABLE Tienda_Productos;
DROP TABLE Tienda_Empleados;
DROP TABLE Tienda_Detalles_Facturas;
DROP TABLE Tienda_Facturas;
*/
;
-- Eliminación de la tabla si existe
DROP TABLE IF EXISTS Tienda_Clientes;

-- Creación de la tabla
CREATE TABLE Tienda_Clientes (
    IDCliente VARCHAR(10) PRIMARY KEY,
    Tipo VARCHAR(20),
    Denominacion VARCHAR(100),
    FechaAlta DATE,
    CodigoPostal VARCHAR(10),
    Provincia VARCHAR(50),
    GastoAcumulado DECIMAL(15, 2)
);

-- Inserción de datos
INSERT INTO Tienda_Clientes (IDCliente, Tipo, Denominacion, FechaAlta, CodigoPostal, Provincia, GastoAcumulado) VALUES
('C45698', 'Particular', 'Ramon Sanchez', '2001-06-07', '28901', 'Madrid', 685.00),
('C45699', 'Empresa', 'Tiendas Sport', '2002-05-06', '80012', 'Cataluña', 12352.50),
('C45700', 'Empresa', 'Tiendas DD', '2003-06-22', '48001', 'Pais Vasco', 25698.99),
('C45701', 'Particular', 'Juan Vazquez', '2004-05-12', '21001', 'Andalucia', 50.50),
('C45702', 'Empresa', 'Pentathlon', '2004-03-17', '28001', 'Madrid', 356481.00),
('C45703', 'Empresa', 'Sprunk', '2006-07-29', '8001', 'Barcelona', 503254.00),
('C45704', 'Particular', 'Domingo Celeste', '2005-11-12', '41001', 'Sevilla', 2000.00),
('C45705', 'Particular', 'Rocio Rodriguez', '2007-01-08', '46001', 'Valencia', 5500.00),
('C45706', 'Empresa', 'KD Shoes', '2004-05-23', '29001', 'Málaga', 636547.00),
('C45707', 'Particular', 'Miguel Oliveira', '2006-09-04', '50001', 'Zaragoza', 15000.00),
('C45708', 'Empresa', 'Red Dog', '2005-10-30', '35001', 'Las Palmas de Gran Canaria', 1254352.00),
('C45709', 'Empresa', 'Imperial Trooper', '2007-02-14', '33001', 'Oviedo', 803654.00),
('C45710', 'Particular', 'Obi Two Jimenez', '2004-06-07', '20001', 'San Sebastián', 6635.00),
('C45711', 'Particular', 'Alex Marquez', '2005-12-21', '7001', 'Palma', 7456.00),
('C45712', 'Particular', 'Marc Marquez', '2006-08-03', '3001', 'Alicante', 9999.00),
('C45713', 'Empresa', 'Umbrella Corporation', '2007-04-25', '15001', 'A Coruña', 666666.00),
('C45714', 'Empresa', 'Acliclas', '2004-10-16', '24001', 'León', 1236547.00),
('C45715', 'Particular', 'Jorge Salvaje', '2005-01-01', '31001', 'Pamplona', 15.00);


-- Eliminación de la tabla si existe
DROP TABLE IF EXISTS Tienda_Territorio;

-- Creación de la tabla
CREATE TABLE Tienda_Territorio (
    IDTerritorio VARCHAR(10) PRIMARY KEY,
    Ciudad VARCHAR(50),
    Comunidad VARCHAR(50)
);

-- Inserción de datos
INSERT INTO Tienda_Territorio (IDTerritorio, Ciudad, Comunidad) VALUES
('T15', 'Madrid', 'Comunidad de Madrid'),
('T16', 'Barcelona', 'Cataluña'),
('T17', 'Bilbao', 'Pais Vasco'),
('T18', 'Málaga', 'Andalucia'),
('T19', 'Sevilla', 'Andalucia'),
('T20', 'Badajoz', 'Extremadura'),
('T21', 'Almeria', 'Andalucia'),
('T22', 'Murcia', 'Region de Murcia'),
('T23', 'Leon', 'Castilla y Leon'),
('T24', 'Logroño', 'Navarra'),
('T25', 'Pontevedra', 'Galicia'),
('T26', 'Santander', 'Asturias'),
('T27', 'Lleida', 'Cataluña');


-- Eliminación de la tabla si existe
DROP TABLE IF EXISTS Tienda_Tiendas;

-- Creación de la tabla
CREATE TABLE Tienda_Tiendas (
    IDTienda VARCHAR(10) PRIMARY KEY,
    RazonSocial VARCHAR(100),
    FechaApertura DATE,
    IDTerritorio VARCHAR(10)
);

-- Inserción de datos
INSERT INTO Tienda_Tiendas (IDTienda, RazonSocial, FechaApertura, IDTerritorio) VALUES
('T_457', 'Ventas_45 SL', '1985-02-15', 'T16'),
('T_458', 'Ramirez e hijos SA', '1994-02-25', 'T17'),
('T_459', 'VS_1989 SAU', '1995-07-01', 'T18'),
('T_460', 'Lopez SL', '1996-08-03', 'T17'),
('T_461', 'Tamayo SL', '2014-08-10', 'T27'),
('T_462', 'Oblivion SA', '2015-07-01', 'T26'),
('T_463', 'Raqueto SA', '2012-02-25', 'T25'),
('T_464', 'Kike SLU', '2003-06-08', 'T24'),
('T_465', 'Pachuru SLU', '2003-01-09', 'T23'),
('T_466', 'Tatooine SLU', '2004-10-05', 'T22'),
('T_467', 'Sunk SAU', '2014-10-07', 'T21'),
('T_468', 'Tras SA', '2002-03-26', 'T20'),
('T_469', 'Trekking SL', '2011-08-03', 'T19');


-- Eliminación de la tabla si existe
DROP TABLE IF EXISTS Tienda_Categoria_Productos;

-- Creación de la tabla
CREATE TABLE Tienda_Categoria_Productos (
    IDCategoria VARCHAR(10) PRIMARY KEY,
    Nombre_Categoria VARCHAR(100)
);

-- Inserción de datos
INSERT INTO Tienda_Categoria_Productos (IDCategoria, Nombre_Categoria) VALUES
('C1', 'Ropa'),
('C2', 'Equipamiento Tecnico'),
('C3', 'Bicicletas'),
('C4', 'Suplementos Alimenticios'),
('C5', 'Merchandising'),
('C6', NULL);


-- Eliminar tabla si existe
DROP TABLE IF EXISTS Tienda_Productos;

-- Crear tabla
CREATE TABLE Tienda_Productos (
    IDProducto VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Intervalo_Precio VARCHAR(20),
    Color VARCHAR(30),
    Precio_Compra DECIMAL(10,4),
    Precio_Venta DECIMAL(10,4),
    IDCategoria VARCHAR(10),
    Descripcion TEXT,
    Fecha_Alta_Producto DATE
);

-- Insertar datos
INSERT INTO Tienda_Productos (IDProducto, Nombre, Intervalo_Precio, Color, Precio_Compra, Precio_Venta, IDCategoria, Descripcion, Fecha_Alta_Producto)
VALUES 
('P4578', 'Kit Mancuernas', 'Medio', 'Negro', 15.95, 30.99, 'C2', 'Kit Mancuernas básico para usuarios principiantes', '2021-11-11'),
('P4579', 'Bicicleta Estatica', 'Alto', 'Gris', 568.86, 744.95, 'C2', 'Dimensiones: 2 x 4 metros. Garantía extensible a 3 años.', '2021-12-20'),
('P4580', 'Bicicleta Montaña', 'Alto', 'Azul', 950.23, 1500.50, 'C3', 'Bicicleta de fibra de carbono 25 pulgadas. Color Azul.', '2022-01-08'),
('P4581', 'Pantalon Corto', 'Bajo', 'Verde', 15.55, 39.99, 'C1', 'Pantalón corto de verano hombre/mujer.', '2022-01-09'),
('P4582', 'Maillot Pro Team Hombre', 'Medio', 'Gris', 69.48, 86.85, 'C1', 'Ropa técnica de alto rendimiento con tejidos transpirables y ajuste aerodinámico para largas rutas en carretera.', '2023-10-06'),
('P4583', 'Culotte Largo Invierno Mujer', 'Medio', 'Gris', 45.27, 52.04, 'C1', 'Pantalón térmico con badana ergonómica, ideal para pedalear en climas fríos.', '2023-08-02'),
('P4584', 'Guantes Gel Verano', 'Medio', 'Rojo', 41.38, 51.72, NULL, 'Guantes ligeros y transpirables con inserciones de gel para mayor comodidad en rutas largas.', '2023-03-10'),
('P4585', 'Chaqueta Corta Viento Ultraligera', 'Medio', 'Rojo', 72.91, 83.80, 'C1', 'Prenda compacta y repelente al agua, perfecta para cambios bruscos de clima en montaña.', '2022-03-10'),
('P4586', 'Calcetines Compresión Ciclismo', 'Bajo', 'Azul', 21.82, 25.08, 'C1', 'Calcetines técnicos con soporte muscular y tejido que reduce la fatiga en largas sesiones.', '2020-08-22'),
('P4587', 'Casco MTB Trail Pro', 'Bajo', 'Rojo', 12.10, 15.13, 'C2', 'Casco con ventilación avanzada, visera ajustable y sistema de ajuste BOA para rutas de montaña.', '2008-02-24'),
('P4588', 'Luces LED Delanteras y Traseras', 'Medio', NULL, 54.09, 72.12, 'C2', 'Kit recargable con alta visibilidad para mayor seguridad en rutas nocturnas.', '2006-11-24'),
('P4589', 'Pedales Automáticos SPD-Pro', 'Medio', 'Gris', 49.94, 62.42, NULL, 'Pedales ligeros y duraderos compatibles con calas Shimano, perfectos para ciclismo de carretera.', '2010-05-01'),
('P4590', 'Gafas Fotocromáticas Alta Visibilidad', 'Alto', NULL, 104.33, 119.92, 'C2', 'Lentes que se adaptan a la luz solar con protección UV y diseño envolvente.', '2007-08-18'),
('P4591', 'Multiherramienta Compacta 15 funciones', 'Medio', 'Azul', 57.64, 72.05, 'C2', 'Herramienta todo-en-uno de bolsillo con llaves allen, destornillador, tronchacadenas y más.', '2020-02-14'),
('P4592', 'Bicicleta Ruta Carbono Ultralight', 'Alto', NULL, 2055.32, 2740.43, 'C3', 'Bici de carretera con cuadro de carbono y grupo Shimano Ultegra para máxima eficiencia y ligereza.', '2017-12-21'),
('P4593', 'Bicicleta Gravel Aluminio 700C', 'Alto', 'Gris', 1600.84, 2001.05, 'C3', 'Bici versátil para aventura y asfalto, con cuadro resistente y cubiertas todo terreno.', '2018-02-22'),
('P4594', 'Bicicleta MTB Doble Suspensión 29”', 'Alto', NULL, 1030.20, 1184.14, NULL, 'Modelo ideal para senderos técnicos con suspensión total y componentes Shimano Deore.', '2016-05-09'),
('P4595', 'Bicicleta Infantil 20” Ciclismo Urbano', 'Medio', NULL, 272.74, 363.65, 'C3', 'Bici segura y ligera para niños, con frenos V-Brake y protector de cadena.', '2016-09-09'),
('P4596', 'E-Bike Trekking Motor Bosch', 'Alto', 'Gris', 985.08, 1082.51, 'C3', 'Bicicleta eléctrica equipada con batería de larga duración y asistencia inteligente para recorridos urbanos o rurales.', '2014-08-26'),
('P4597', 'Barritas Energéticas Natural Mix', 'Bajo', 'Azul', 23.78, 29.73, 'C4', 'Paquete de barritas con frutas, avena y nueces, perfectas para consumir durante la ruta.', '2024-08-31'),
('P4598', 'Gel Energético Cafeína Citrus', 'Bajo', NULL, 16.88, 19.40, 'C4', 'Gel de rápida absorción con cafeína y electrolitos para mantener el rendimiento en subidas intensas.', '2012-03-04'),
('P4599', 'Proteína Vegetal Post-Entreno', 'Bajo', 'Gris', 23.52, 25.85, NULL, 'Suplemento de recuperación a base de guisante y arroz, ideal para veganos y vegetarianos.', '2007-10-20'),
('P4600', 'Sales Minerales Rehidratación Plus', 'Bajo', 'Gris', 3.95, 5.26, 'C4', 'Comprimidos efervescentes con electrolitos para evitar calambres y fatiga muscular.', '2017-10-21'),
('P4601', 'Bebida Isotónica Cítricos', 'Bajo', NULL, 22.54, 28.18, 'C4', 'Polvo para preparar bebida rehidratante con sodio, potasio y magnesio.', '1996-04-20'),
('P4602', 'Botella Aluminio Edición Especial', 'Bajo', 'Azul', 16.61, 22.14, 'C5', 'Bidón metálico de 750ml con diseño exclusivo y tapón antiderrame.', '1996-09-12'),
('P4603', 'Gorra Oficial del Club', 'Bajo', NULL, 18.19, 24.25, 'C5', 'Casual y con visera curva, ideal para antes o después de la carrera.', '1998-06-28'),
('P4604', 'Taza Ciclismo Retro', 'Bajo', 'Azul', 16.00, 18.39, 'C5', 'De cerámica con diseño vintage inspirado en carreras clásicas de los años 70.', '1985-12-30'),
('P4605', 'Llavero Cadena Bicicleta', 'Bajo', NULL, 16.38, 20.48, NULL, 'Accesorio original hecho con eslabones reales de cadena reciclada.', '2020-05-07'),
('P4606', 'Camiseta Algodón “Ride Fast”', 'Bajo', 'Azul', 4.74, 5.93, 'C5', 'Diseño urbano con mensaje ciclista y tejido 100% algodón orgánico.', '2020-09-09');


-- Eliminar tabla si existe (opcional para evitar errores)
DROP TABLE IF EXISTS Tienda_Empleados;

-- Crear tabla
CREATE TABLE Tienda_Empleados (
    IDEmpleado VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellidos VARCHAR(100),
    FechaNacimiento DATE,
    FechaIncorporacion DATE,
    EquipoDeVentas INT,
    ComisionPorVenta DECIMAL(5,4),
    SalarioBase DECIMAL(10,2),
    Jornada VARCHAR(20),
    SupervisorIDEmpleado VARCHAR(10),
    IDTienda VARCHAR(10)
);

-- Insertar datos
INSERT INTO Tienda_Empleados (IDEmpleado, Nombre, Apellidos, FechaNacimiento, FechaIncorporacion, EquipoDeVentas, ComisionPorVenta, SalarioBase, Jornada, SupervisorIDEmpleado, IDTienda)
VALUES
    ('E125', 'Juan', 'Gonzalez', '1955-02-02', '1996-02-27', 2, 0.0300, 25000.00, 'Completa', 'E100', 'T_458'),
    ('E126', 'Rocio', 'Millan', '1981-08-15', '2001-08-19', 5, 0.0250, 23500.00, 'Completa', 'E100', 'T_459'),
    ('E127', 'María', 'Santos', '1991-07-06', '2004-05-15', 2, 0.0250, 22000.00, 'Media Jornada', 'E101', 'T_457'),
    ('E128', 'Sara', 'Martinez', '1993-09-05', '2008-06-23', 1, 0.0150, 21500.00, 'Media Jornada', 'E101', 'T_457'),
    ('E100', 'Abel', 'Garcia', '1990-12-12', '2009-08-03', 4, 0.0150, 50000.00, 'Completa', 'E102', 'T_457'),
    ('E101', 'Claudia', 'Serrano', '1993-03-28', '2011-02-14', 3, 0.0150, 52350.00, 'Completa', 'E100', 'T_458'),
    ('E102', 'Alba', 'Pimienta', '1988-10-10', '2011-10-06', 2, 0.0150, 48500.00, 'Completa', 'E101', 'T_459'),
    ('E129', 'Victor', 'Sal', '1989-09-20', '2005-05-05', 4, 0.0250, 30000.00, 'Completa', 'E102', 'T_460'),
    ('E130', 'Gema', 'Jimenez', '1991-03-17', '2007-06-12', 1, 0.0250, 28500.00, 'Completa', 'E101', 'T_461'),
    ('E131', 'Custodio', 'Gago', '1989-05-08', '2007-07-16', 5, 0.0300, 14000.00, 'Media Jornada', 'E100', 'T_462'),
    ('E132', 'Cesar', 'Lopez', '1992-01-20', '2020-05-06', 5, 0.0250, 36555.00, 'Completa', 'E102', 'T_463'),
    ('E133', 'Oscar', 'Solar', '1993-07-16', '2018-07-22', 3, 0.0300, 17500.00, 'Media Jornada', 'E100', 'T_460'),
    ('E134', 'Samuel', 'Cremades', '1993-06-14', '2019-07-24', 2, 0.0250, 29000.00, 'Completa', 'E101', 'T_461'),
    ('E135', 'Tania', 'Gutierrez', '1993-10-15', '2019-09-26', 2, 0.0250, 29005.00, 'Completa', 'E100', 'T_462'),
    ('E136', 'Pedro', 'Roman', '1995-08-24', '2017-08-22', 1, 0.0250, 27650.00, 'Completa', 'E102', 'T_463'),
    ('E137', 'Nadia', 'Dos Santos', '1996-12-27', '2016-02-02', 1, 0.0300, 15000.00, 'Media Jornada', 'E100', 'T_465'),
    ('E138', 'Carmen', 'Garcia', '1993-04-22', '2018-06-27', 3, 0.0250, 33000.00, 'Completa', 'E102', 'T_466'),
    ('E139', 'Julia', 'Serrano', '1986-10-29', '2015-02-09', 1, 0.0300, 17500.00, 'Media Jornada', 'E101', 'T_467'),
    ('E140', 'Carlos', 'Benitez', '1987-01-28', '2012-09-16', 3, 0.0300, 13500.00, 'Media Jornada', 'E101', 'T_468'),
    ('E141', 'Jose', 'Lopez', '1989-01-26', '2012-10-31', 5, 0.0250, 31000.00, 'Completa', 'E102', 'T_469');


-- Eliminar la tabla si ya existe
DROP TABLE IF EXISTS Tienda_Detalles_Facturas;

-- Crear la tabla
CREATE TABLE Tienda_Detalles_Facturas (
    IDTransaccion BIGINT PRIMARY KEY,
    IDFactura VARCHAR(10),
    Cantidad INT,
    IDProducto VARCHAR(10)
);

-- Insertar los datos
INSERT INTO Tienda_Detalles_Facturas (IDTransaccion, IDFactura, Cantidad, IDProducto)
VALUES
    (25648752, 'F7896', 5, 'P4581'),
    (25648753, 'F7896', 2, 'P4579'),
    (25648754, 'F7897', 10, 'P4578'),
    (25648755, 'F7897', 100, 'P4595'),
    (25648756, 'F7890', 12, 'P4583'),
    (25648757, 'F7891', 7, 'P4584'),
    (25648758, 'F7892', 6, 'P4585'),
    (25648759, 'F7893', 13, 'P4586'),
    (25648760, 'F7894', 14, 'P4587'),
    (25648761, 'F7895', 14, 'P4588'),
    (25648762, 'F7896', 11, 'P4591'),
    (25648763, 'F7897', 9, 'P4592'),
    (25648764, 'F7898', 14, 'P4593'),
    (25648765, 'F7899', 12, 'P4594'),
    (25648766, 'F7900', 15, 'P4595'),
    (25648767, 'F7901', 14, 'P4601'),
    (25648768, 'F7902', 9, 'P4602'),
    (25648769, 'F7903', 11, 'P4603'),
    (25648770, 'F7904', 8, 'P4604'),
    (25648771, 'F7905', 12, 'P4605'),
    (25648772, 'F7906', 15, 'P4606'),
    (25648773, 'F7907', 5, 'P4592'),
    (25648774, 'F7908', 11, 'P4593'),
    (25648775, 'F7909', 13, 'P4594'),
    (25648776, 'F7910', 8, 'P4595'),
    (25648777, 'F7939', 5, 'P4596'),
    (25648778, 'F7940', 14, 'P4597'),
    (25648779, 'F7941', 9, 'P4598'),
    (25648780, 'F7942', 12, 'P4578'),
    (25648781, 'F7943', 13, 'P4579'),
    (25648782, 'F7944', 9, 'P4580'),
    (25648783, 'F7945', 12, 'P4581'),
    (25648784, 'F7946', 8, 'P4582'),
    (25648785, 'F7947', 9, 'P4583'),
    (25648786, 'F7927', 13, 'P4584'),
    (25648787, 'F7890', 7, 'P4585'),
    (25648788, 'F7891', 7, 'P4585'),
    (25648789, 'F7892', 9, 'P4586'),
    (25648790, 'F7893', 12, 'P4587'),
    (25648791, 'F7894', 15, 'P4588'),
    (25648792, 'F7895', 9, 'P4589'),
    (25648793, 'F7896', 12, 'P4590'),
    (25648794, 'F7897', 5, 'P4591'),
    (25648795, 'F7898', 11, 'P4592'),
    (25648796, 'F7923', 6, 'P4590'),
    (25648797, 'F7924', 6, 'P4591'),
    (25648798, 'F7925', 11, 'P4592'),
    (25648799, 'F7926', 10, 'P4593'),
    (25648800, 'F7927', 10, 'P4594'),
    (25648801, 'F7928', 8, 'P4595'),
    (25648802, 'F7929', 7, 'P4596'),
    (25648803, 'F7930', 5, 'P4597'),
    (25648804, 'F7931', 14, 'P4598'),
    (25648805, 'F7932', 11, 'P4584'),
    (25648806, 'F7933', 12, 'P4585'),
    (25648807, 'F7934', 6, 'P4586'),
    (25648808, 'F7935', 8, 'P4587'),
    (25648809, 'F7936', 8, 'P4588'),
    (25648810, 'F7937', 8, 'P4589'),
    (25648811, 'F7938', 10, 'P4590'),
    (25648812, 'F7912', 13, 'P4591'),
    (25648813, 'F7913', 6, 'P4592'),
    (25648814, 'F7914', 11, 'P4593'),
    (25648815, 'F7915', 5, 'P4594'),
    (25648816, 'F7916', 6, 'P4578'),
    (25648817, 'F7917', 10, 'P4579'),
    (25648818, 'F7918', 10, 'P4580'),
    (25648819, 'F7919', 14, 'P4581'),
    (25648820, 'F7920', 12, 'P4582'),
    (25648821, 'F7921', 7, 'P4583'),
    (25648822, 'F7922', 11, 'P4584'),
    (25648823, 'F7948', 5, 'P4585'),
    (25648824, 'F7949', 12, 'P4586'),
    (25648825, 'F7950', 12, 'P4596'),
    (25648826, 'F7951', 6, 'P4597'),
    (25648827, 'F7952', 12, 'P4598'),
    (25648828, 'F7912', 11, 'P4599'),
    (25648829, 'F7913', 5, 'P4600'),
    (25648830, 'F7914', 9, 'P4602'),
    (25648831, 'F7915', 11, 'P4603'),
    (25648832, 'F7916', 10, 'P4604'),
    (25648833, 'F7917', 13, 'P4606'),
    (25648834, 'F7918', 10, 'P4587'),
    (25648835, 'F7935', 5, 'P4588'),
    (25648836, 'F7936', 11, 'P4589'),
    (25648837, 'F7937', 14, 'P4590'),
    (25648838, 'F7938', 7, 'P4591'),
    (25648839, 'F7939', 8, 'P4592'),
    (25648840, 'F7940', 6, 'P4593'),
    (25648841, 'F7941', 14, 'P4594'),
    (25648842, 'F7942', 7, 'P4595'),
    (25648843, 'F7943', 11, 'P4582'),
    (25648844, 'F7944', 14, 'P4583'),
    (25648845, 'F7945', 6, 'P4584'),
    (25648846, 'F7946', 9, 'P4585'),
    (25648847, 'F7905', 10, 'P4586'),
    (25648848, 'F7906', 21, 'P4587'),
    (25648849, 'F7907', 45, 'P4588');

 DROP TABLE IF EXISTS Tienda_Facturas;
CREATE TABLE Tienda_Facturas (
    IDFactura VARCHAR(10) PRIMARY KEY,
    Fecha_Compra DATE,
    Fecha_Envio_Estimada DATE,
    Fecha_Entrega DATE,
    Estado VARCHAR(20),
    Total_sin_impuestos DECIMAL(10, 2),
    Impuestos DECIMAL(10, 4),
    Comentarios TEXT,
    IDCliente VARCHAR(10),
    IDTienda VARCHAR(10),
    IDEmpleado VARCHAR(10)
);

INSERT INTO Tienda_Facturas 
(IDFactura, Fecha_Compra, Fecha_Envio_Estimada, Fecha_Entrega, Estado, Total_sin_impuestos, Impuestos, Comentarios, IDCliente, IDTienda, IDEmpleado)
VALUES
('F7890', '2022-07-01', '2022-11-01', NULL, 'Enviado', 1211.08, 254.3268, 'El cliente necesita recibir la llamada a la hora de la entrega', 'C45698', 'T_459', 'E125'),
('F7891', '2022-09-01', '2022-10-01', '2022-10-13', 'Entregado', 948.64, 199.2144, 'Entrega sin contacto', 'C45699', 'T_459', 'E126'),
('F7892', '2022-01-14', '2022-01-21', '2022-01-22', 'Entregado', 728.52, 152.9892, NULL, 'C45700', 'T_458', 'E127'),
('F7893', '2022-01-16', '2022-01-23', NULL, 'Cancelado', 507.60, 106.5960, 'Cancelacion: El cliente necesita un cheque regalo', 'C45701', 'T_457', 'E127'),
('F7894', '2022-01-23', '2022-01-30', '2022-01-31', 'Enviado', 1478.95, 310.6200, 'Entrega programada para el 31/01', 'C45702', 'T_457', 'E128'),
('F7895', '2022-01-31', '2022-02-07', NULL, 'Cancelado', 674.05, 141.5420, 'Cancelacion: El cliente cambio de opinion', 'C45703', 'T_456', 'E129'),
('F7896', '2022-02-01', '2022-02-08', NULL, 'Enviado', 1009.85, 212.0182, 'El paquete ha sido enviado con éxito', 'C45704', 'T_456', 'E130'),
('F7897', '2022-02-08', '2022-02-15', '2022-02-14', 'Entregado', 593.33, 124.0308, NULL, 'C45705', 'T_455', 'E131'),
('F7898', '2022-02-15', '2022-02-22', '2022-02-21', 'Entregado', 1102.75, 231.1650, 'Cliente satisfecho con la entrega', 'C45706', 'T_455', 'E132'),
('F7899', '2022-02-22', '2022-03-01', '2022-03-03', 'Entregado', 838.13, 175.9912, 'Cliente recibió el paquete el día 3', 'C45707', 'T_454', 'E133'),
('F7900', '2022-03-01', '2022-03-08', NULL, 'Enviado', 1293.54, 272.6820, 'El envío está en proceso de entrega', 'C45708', 'T_454', 'E134'),
('F7901', '2022-03-08', '2022-03-15', '2022-03-14', 'Entregado', 1176.40, 246.5760, 'El paquete ha sido entregado correctamente', 'C45709', 'T_453', 'E135'),
('F7902', '2022-03-15', '2022-03-22', NULL, 'Cancelado', 972.90, 204.3210, 'Cancelacion solicitada por el cliente', 'C45710', 'T_453', 'E136'),
('F7903', '2022-03-22', '2022-03-29', '2022-03-28', 'Entregado', 645.12, 135.4584, 'La entrega se realizó sin problemas', 'C45711', 'T_452', 'E137'),
('F7904', '2022-03-29', '2022-04-05', NULL, 'Enviado', 1589.55, 334.7790, 'La fecha estimada de entrega es el 5 de abril', 'C45712', 'T_452', 'E138'),
('F7905', '2022-04-05', '2022-04-12', '2022-04-11', 'Entregado', 1035.99, 216.7198, NULL, 'C45713', 'T_451', 'E139'),
('F7906', '2022-04-12', '2022-04-19', NULL, 'Enviado', 1232.77, 258.8706, 'Enviado a través de servicio express', 'C45714', 'T_451', 'E140'),
('F7907', '2022-04-19', '2022-04-26', '2022-04-25', 'Entregado', 803.42, 168.7152, 'El cliente ya recibió su paquete', 'C45715', 'T_450', 'E141'),
('F7908', '2022-04-26', '2022-05-03', NULL, 'Enviado', 973.98, 204.4776, 'Entrega en proceso', 'C45716', 'T_450', 'E142'),
('F7909', '2022-05-03', '2022-05-10', '2022-05-09', 'Entregado', 1190.65, 249.0516, NULL, 'C45717', 'T_449', 'E143'),
('F7910', '2022-05-10', '2022-05-17', '2022-05-16', 'Entregado', 972.90, 204.3210, 'Entregado el 16 de mayo', 'C45718', 'T_449', 'E144'),
('F7911', '2022-05-17', '2022-05-24', NULL, 'Enviado', 1035.99, 216.7198, 'El paquete está en camino', 'C45719', 'T_448', 'E145'),
('F7912', '2022-05-24', '2022-05-31', NULL, 'Enviado', 1191.78, 249.4684, 'Entrega programada para fin de mes', 'C45720', 'T_448', 'E146'),
('F7913', '2019-08-17', '2019-08-24', '2019-08-23', 'Enviado', 16468.88, 3458.4648, 'El correo de seguimiento nunca llegó.', 'C45709', 'T_466', 'E131'),
('F7914', '2021-05-24', '2021-05-31', '2021-05-30', 'Entregado', 22210.81, 4664.2701, 'No hubo opción para modificar el pedido después de pagarlo.', 'C45710', 'T_467', 'E136'),
('F7915', '2020-12-06', '2020-12-13', '2020-12-12', 'Enviado', 6187.45, 1299.3645, 'El embalaje no era ecológico, a pesar de lo anunciado.', 'C45711', 'T_468', 'E137'),
('F7916', '2022-02-20', '2022-03-06', NULL, 'Cancelado', 369.84, 77.6664, 'El mensajero no quiso subir el paquete al piso.', 'C45712', 'T_469', 'E138'),
('F7917', '2019-07-01', '2019-07-08', '2019-07-07', 'Entregado', 7526.59, 1580.5839, 'Falta claridad en las políticas de devolución.', 'C45713', 'T_458', 'E126'),
('F7918', '2020-09-19', '2020-10-03', '2020-10-02', 'Entregado', 15156.30, 3182.8230, 'El pedido se canceló sin dar una razón clara.', 'C45714', 'T_459', 'E127'),
('F7919', '2022-06-13', '2022-06-20', NULL, 'Cancelado', 559.86, 117.5706, 'Tuve problemas para cambiar la dirección una vez hecho el pedido. Necesito un cheque', 'C45715', 'T_460', 'E128'),
('F7920', '2019-10-31', '2019-11-14', '2019-11-13', 'Enviado', 1042.20, 218.8620, 'La atención al cliente tardó días en responder.', 'C45698', 'T_461', 'E100'),
('F7921', '2020-04-28', '2020-05-05', '2020-05-04', 'Enviado', 364.28, 76.4988, 'Me cobraron dos veces por el mismo pedido.', 'C45699', 'T_466', 'E134'),
('F7922', '2021-03-25', '2021-04-08', NULL, 'Cancelado', 568.92, 119.4732, 'El sistema no guardó mi carrito correctamente. Quiero un bono o cheque', 'C45700', 'T_467', 'E135'),
('F7923', '2022-08-16', '2022-08-30', '2022-08-29', 'Enviado', 719.52, 151.0992, 'Se agotó el producto mientras lo estaba comprando.', 'C45701', 'T_468', 'E136'),
('F7924', '2020-11-07', '2020-11-14', NULL, 'Cancelado', 432.30, 90.7830, 'No hay opción de entrega en puntos de recogida.', 'C45702', 'T_458', 'E137'),
('F7925', '2021-12-12', '2021-12-19', '2021-12-18', 'Enviado', 30144.73, 6330.3933, 'El tiempo estimado de entrega fue incorrecto.', 'C45698', 'T_459', 'E138'),
('F7926', '2019-07-09', '2019-07-23', '2019-07-25', 'Enviado', 20010.50, 4202.2050, 'No hay confirmación del reembolso.', 'C45699', 'T_460', 'E139'),
('F7927', '2021-08-23', '2021-08-30', '2021-08-29', 'Entregado', 12513.76, 2627.8896, 'Me llegó un email con el nombre equivocado.', 'C45700', 'T_461', 'E140'),
('F7928', '2022-01-15', '2022-01-29', '2022-01-31', 'Entregado', 2909.20, 610.9320, 'El producto fue entregado a un vecino sin notificación.', 'C45701', 'T_464', 'E141'),
('F7929', '2020-05-04', '2020-05-11', '2020-05-10', 'Enviado', 7577.57, 1591.2897, 'No había instrucciones de montaje en el paquete.', 'C45702', 'T_465', 'E129'),
('F7930', '2020-10-10', '2020-10-24', NULL, 'Cancelado', 148.65, 31.2165, 'El sistema no permitía finalizar la compra desde el móvil.', 'C45703', 'T_466', 'E130'),
('F7931', '2022-06-30', '2022-07-07', '2022-07-06', 'Enviado', 271.60, 57.0360, 'Recibí varios emails con fechas de entrega contradictorias.', 'C45704', 'T_467', 'E131'),
('F7932', '2019-09-22', '2019-09-29', '2019-10-01', 'Entregado', 568.92, 119.4732, 'El precio cambió durante el proceso de compra.', 'C45705', 'T_459', 'E126'),
('F7933', '2021-11-03', '2021-11-17', '2021-11-16', 'Enviado', 1005.60, 211.1760, 'El seguimiento indicaba entregado pero no lo recibí.', 'C45708', 'T_460', 'E129'),
('F7934', '2020-02-18', '2020-02-25', '2020-02-24', 'Entregado', 150.48, 31.6008, 'El paquete llegó con días de antelación sin aviso.', 'C45709', 'T_461', 'E130'),
('F7935', '2021-01-05', '2021-01-12', NULL, 'Cancelado', 481.64, 101.1444, 'No hay opción para facturar a nombre de empresa.', 'C45710', 'T_462', 'E131'),
('F7936', '2022-08-20', '2022-09-03', '2022-09-02', 'Entregado', 1263.58, 265.3518, 'El producto no coincide con la foto en la web.', 'C45711', 'T_457', 'E131'),
('F7937', '2022-04-06', '2022-04-20', '2022-04-19', 'Enviado', 2178.24, 457.4304, 'Me llegó el paquete de otra persona.', 'C45705', 'T_458', 'E135'),
('F7938', '2021-09-25', '2021-10-02', '2021-10-01', 'Enviado', 1703.55, 357.7455, 'El sistema cobró un envío express sin seleccionarlo.', 'C45712', 'T_459', 'E126'),
('F7939', '2020-07-08', '2020-07-15', '2020-07-17', 'Entregado', 27335.99, 5740.5579, 'Tuve que contactar varias veces para resolver un error.', 'C45713', 'T_466', 'E127'),
('F7940', '2019-12-13', '2019-12-20', '2019-12-19', 'Entregado', 12422.52, 2608.7292, 'La devolución me costó más de lo que esperaba.', 'C45714', 'T_467', 'E135'),
('F7941', '2020-03-02', '2020-03-16', '2020-03-15', 'Enviado', 16752.56, 3518.0376, 'El pedido fue dividido sin avisarme.', 'C45715', 'T_468', 'E134'),
('F7942', '2021-06-29', '2021-07-06', NULL, 'Cancelado', 2917.43, 612.6603, 'No recibí factura con el paquete.', 'C45712', 'T_469', 'E127'),
('F7943', '2019-10-17', '2019-10-31', '2019-11-02', 'Enviado', 10639.70, 2234.3370, 'El producto no venía sellado.', 'C45713', 'T_462', 'E127'),
('F7944', '2021-01-19', '2021-02-02', '2021-02-04', 'Enviado', 14233.06, 2988.9426, 'No había opción de envoltorio para regalo.', 'C45714', 'T_463', 'E135'),
('F7945', '2022-07-31', '2022-08-07', '2022-08-06', 'Entregado', 790.20, 165.9420, 'El botón de “finalizar compra” no funcionaba.', 'C45702', 'T_464', 'E136'),
('F7946', '2020-08-11', '2020-08-18', '2020-08-17', 'Enviado', 1449.00, 304.2900, 'Faltó confirmación de disponibilidad antes de pagar.', 'C45703', 'T_465', 'E132'),
('F7947', '2022-04-26', '2022-05-10', NULL, 'Cancelado', 468.36, 98.3556, 'El pedido no fue registrado aunque lo pagué. Me vale con un cheque', 'C45698', 'T_466', 'E140'),
('F7948', '2019-02-07', '2019-02-14', '2019-02-16', 'Enviado', 419.00, 87.9900, 'Se cambió la fecha de entrega sin mi aprobación.', 'C45699', 'T_467', 'E135'),
('F7949', '2021-09-14', '2021-09-28', '2021-09-30', 'Enviado', 300.96, 63.2016, 'La web no funcionaba correctamente en ciertos navegadores.', 'C45703', 'T_468', 'E138'),
('F7950', '2020-11-16', '2020-11-23', NULL, 'Cancelado', 12990.12, 2727.9252, 'El producto estaba usado o abierto.', 'C45704', 'T_469', 'E139'),
('F7951', '2022-08-03', '2022-08-17', '2022-08-19', 'Entregado', 178.38, 37.4598, 'El chat no resolvió mi problema.', 'C45705', 'T_458', 'E140'),
('F7952', '2021-03-21', '2021-03-28', NULL, 'Entregado', 232.80, 48.8880, 'Se aplicaron cargos adicionales sin explicación.', 'C45714', 'T_459', 'E141');

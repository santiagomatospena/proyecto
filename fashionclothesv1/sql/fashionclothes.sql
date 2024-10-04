drop database if exists fashionclothes;
create database if not exists fashionclothes;
use fashionclothes;
drop table if exists empresa;
create table empresa(
idempresa TINYINT(10) not null primary key auto_increment,
    nombre varchar(20) not null unique,
    direccion varchar(20) not null unique,
    celular bigint(10) not null unique
);
create table cliente(
idcliente int not null primary key auto_increment,
    nombre varchar(20) not null,
    correo varchar(40) not null,
    cedula bigint(15) not null,
    celular bigint(15) not null,
    direccion varchar(50)not null,
    usuario varchar(50)not null,
    pass varchar(50)not null,
    tipo varchar(50)not null
);
create table catalogo(
idcatalogo tinyint(10) not null primary key auto_increment,
    nombre_catalogo varchar(20) not null
);
CREATE TABLE producto(
    idproducto int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    precio DECIMAL(7,2),
    idcatalogo TINYINT(10) NOT NULL,
    stock INT(100) NOT NULL,
    FOREIGN KEY (idcatalogo) REFERENCES catalogo(idcatalogo)
);
CREATE TABLE factura (
    idfactura SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idcliente INT NOT NULL,
    cantidad VARCHAR(30) NOT NULL,
    valor bigint(15) not null,
    referencia int(50) NOT NULL,
    FOREIGN KEY(idcliente) REFERENCES cliente(idcliente)
);
CREATE TABLE ganancia (
    idganancia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idproducto INT UNSIGNED NOT NULL,
    cantidad VARCHAR(20) NOT NULL,
    valor bigint(15) not null,
    fecha TIME NOT NULL,
    FOREIGN KEY(idproducto) REFERENCES producto(idproducto)
);
CREATE TABLE tipago (
idtipago INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idcliente int NOT NULL,
    medio VARCHAR(20) NOT NULL,
    valor VARCHAR(20) NOT NULL,
    FOREIGN KEY(idcliente) REFERENCES cliente(idcliente)
);
CREATE TABLE credito (
idcredito INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valtotal bigint NOT NULL,
    valcuotas bigint NOT NULL,
    fechainicio time,
    fechafinal time
);
CREATE TABLE historial (
idhistorial INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idcliente int NOT NULL,
    idcredito int NOT NULL,
    cuototal bigint NOT NULL,
    cuorestantes bigint NOT NULL,
    cuopagadas bigint NOT NULL,
    cantcreditos bigint NOT NULL,
    FOREIGN KEY(idcliente) REFERENCES cliente(idcliente),
    FOREIGN KEY(idcredito) REFERENCES credito(idcredito)
);
create table proveedores(
idproveeedores int not null primary key auto_increment,
    idproducto int UNSIGNED not null,
    nombre varchar(20) not null,
    direccion varchar(20) not null,
    cedula int(15) not null,
    correo int(40) not null,
FOREIGN KEY(idproducto) REFERENCES producto(idproducto)
    );
create table almacen(
idalmacen int not null primary key auto_increment,
    idproducto int UNSIGNED not null,
    productosrestantes int(100) not null,
FOREIGN KEY(idproducto) REFERENCES producto(idproducto)
    );
 create table administrador(
idadministrador int not null primary key auto_increment,
    nombre varchar(20) not null,
    cedula bigint(100) not null,
    celular bigint(100) not null,
    direccion varchar(50)not null,
    correo varchar(50)not null,
    usuario varchar(20) not null unique,
    contraseña varchar(20) not null unique
);  
 create table compras(
idcompra int not null primary key auto_increment,
    idcliente int not null,
    idhistorial INT NOT NULL,
    n_compras varchar(20) not null,
    fecha time not null,
   FOREIGN KEY(idcliente) REFERENCES cliente(idcliente),
   FOREIGN KEY(idhistorial) REFERENCES historial(idhistorial)
);  
 create table ventas(
idventa int not null primary key auto_increment,
    n_ventas int not null,
	fecha time not null,
    idproducto int UNSIGNED NOT NULL,
    idalmacen int not null,
   FOREIGN KEY(idproducto) REFERENCES producto(idproducto),
   FOREIGN KEY(idalmacen) REFERENCES almacen(idalmacen)
);   
INSERT INTO empresa (nombre, direccion, celular) VALUES ('Fashion Clothes', 'campo valdes', '3005443215');
INSERT INTO cliente (nombre, correo, cedula, celular, direccion, usuario, pass, tipo) VALUES ('Danny', 'dannycanuu8@gmail.com', '1063678906', '3156837955','Campo valdes cl84 cr49','Danny','Dannycanu8', 'user');
INSERT INTO catalogo (nombre_catalogo) VALUES ('hombre');
INSERT INTO producto (nombre, marca, descripcion, precio, idcatalogo, stock) VALUES ('Camisa Casual', 'coste', 'camisa azul casual', '50000', LAST_INSERT_ID(), 100);
INSERT INTO factura (cantidad, valor, referencia, idcliente) VALUES ('3', '200000', '3568', LAST_INSERT_ID());
INSERT INTO ganancia (cantidad, valor, fecha, idproducto) VALUES ('2', '200000', '20000', LAST_INSERT_ID());
INSERT INTO tipago (medio, valor, idcliente) VALUES ('6', '200000', LAST_INSERT_ID());
INSERT INTO credito (valtotal, valcuotas, fechainicio, fechafinal) VALUES ('200000', '2000', '3000', '10');
INSERT INTO historial (cuototal, cuorestantes, cuopagadas, cantcreditos, idcliente, idcredito) VALUES ('200000', '8', '14', '22', LAST_INSERT_ID(), LAST_INSERT_ID());
INSERT INTO proveedores (nombre, direccion, cedula, correo, idproducto) VALUES ('200000', '2000', '3000', '10', LAST_INSERT_ID());
INSERT INTO almacen (productosrestantes, idproducto) VALUES ('80', LAST_INSERT_ID());
INSERT INTO administrador (nombre, cedula, celular, direccion, correo, usuario, contraseña) VALUES ('Danny', '1063678906', '3156837954', 'Campo valdes cl84 cr49', 'dannycanuu8@gmail.com','JuandaDanny','JuanDanny8');
INSERT INTO compras (n_compras, fecha, idcliente, idhistorial) VALUES ('80', '20000', LAST_INSERT_ID(), LAST_INSERT_ID());
INSERT INTO ventas (n_ventas, fecha, idproducto, idalmacen) VALUES ('80', '20000', LAST_INSERT_ID(), LAST_INSERT_ID());

CREATE DATABASE [AcuerdoCTP]
GO

USE [AcuerdoCTP]
GO

-- Propósito: Almacenar los roles del sistema
CREATE TABLE Rol
(ID_Rol INT NOT NULL,
NOMBRE VARCHAR(30) NOT NULL,
PRIMARY KEY(ID_Rol))

-- Propósito: Almacenar los usuarios del sistema
CREATE TABLE Usuario
(Id_Usuario INT NOT NULL,
Correo VARCHAR(50) NOT NULL,
Clave VARCHAR(30) NOT NULL,
ID_Rol INT NOT NULL,
PRIMARY KEY(ID_Usuario))

-- Propósito: Almacenar los estados de los acuerdos
CREATE TABLE Estado
(Id_Estado INT NOT NULL,
Estado VARCHAR(30) NOT NULL,
PRIMARY KEY(Id_Estado))

-- Propósito: Almacenar los miembros de la comision 
CREATE TABLE Miembros
(idMiembros SMALLINT  IDENTITY (1, 1) NOT NULL ,
Nombres VARCHAR(70) NOT NULL,
PRIMARY KEY(idMiembros))

-- Propósito: Almacenar las sesiones de la comision 
CREATE TABLE Sesion
(IdSesion INT NOT NULL,
TipoSesion VARCHAR(30) NOT NULL,
PRIMARY KEY(IdSesion))

-- Propósito: Almacenar las comisiones 
CREATE TABLE Comisiones
(idComisiones INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
PRIMARY KEY(idComisiones))

-- Propósito: Almacenar los acuerdos
CREATE TABLE Acuerdo
(IdAcuerdo SMALLINT IDENTITY (1, 1) NOT NULL ,
Nombre VARCHAR(100) NOT NULL,
FechaInicio Date NOT NULL,
Id_Estado INT NOT NULL,
idMiembros SMALLINT NOT NULL,
FechaEntrega Date NOT NULL,

PRIMARY KEY(IdAcuerdo),
)


-- Propósito: Almacenar la informacion de cada comision realizada
CREATE TABLE Comision
(IdComision SMALLINT IDENTITY (1, 1) NOT NULL ,
FechaRealizacion Date NOT NULL,
IdSesion INT NOT NULL,
idComisiones INT NOT NULL,
idMiembros SMALLINT NOT NULL,
IdAcuerdo SMALLINT NOT NULL,
PRIMARY KEY(IdComision),
)

alter table Usuario add foreign key(ID_Rol) references Rol(ID_Rol)

alter table Acuerdo add foreign key(Id_Estado) references Estado(Id_Estado)
alter table Acuerdo add foreign key(idMiembros) references Miembros(idMiembros)

alter table Comision add foreign key(IdSesion) references Sesion(IdSesion)
alter table Comision add foreign key(idComisiones) references Comisiones(idComisiones)
alter table Comision add foreign key(idMiembros) references Miembros(idMiembros)
alter table Comision add foreign key(IdAcuerdo) references Acuerdo(IdAcuerdo)


-- Propósito: Insertar los datos que se almacenaran en las tablas   
INSERT INTO [Rol] VALUES(1,'Coordinador/Presidente'); 
INSERT INTO [Rol] VALUES(2,'Secretario'); 
INSERT INTO [Rol] VALUES(3,'Participante'); 

INSERT INTO [Usuario] VALUES(1,'coordinador@gmail.com', 'Coordinador@34',1);
INSERT INTO [Usuario] VALUES(2,'secretario@gmail.com', 'Secretario*01',2); 
INSERT INTO [Usuario] VALUES(3,'usuario@gmail.com', 'Usuario123',3);

INSERT INTO [Comisiones] VALUES(1,'CIAD'); 
INSERT INTO [Comisiones] VALUES(2,'SALUD OCUPACIONAL'); 
INSERT INTO [Comisiones] VALUES(3,'TRANSPARENCIA'); 
INSERT INTO [Comisiones] VALUES(4,'CONTROL INTERNO'); 
INSERT INTO [Comisiones] VALUES(5,'GESTION AMBIENTAL'); 
INSERT INTO [Comisiones] VALUES(6,'BRIGADA'); 
INSERT INTO [Comisiones] VALUES(7,'DATOS ABIERTOS'); 

INSERT INTO [Sesion] VALUES(1,'Ordinaria'); 
INSERT INTO [Sesion] VALUES(2,'Extraordinaria'); 

INSERT INTO [Estado] VALUES(1,'Asignado'); 
INSERT INTO [Estado] VALUES(2,'En proceso'); 
INSERT INTO [Estado] VALUES(3,'Finalizado'); 





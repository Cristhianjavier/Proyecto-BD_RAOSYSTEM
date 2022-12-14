USE [master]
GO
/****** Object:  Database [Raosystem]    Script Date: 19/09/2022 12:59:45 p. m. ******/
CREATE DATABASE [Raosystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Raosystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Raosystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Raosystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Raosystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Raosystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Raosystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Raosystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Raosystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Raosystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Raosystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Raosystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [Raosystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Raosystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Raosystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Raosystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Raosystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Raosystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Raosystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Raosystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Raosystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Raosystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Raosystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Raosystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Raosystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Raosystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Raosystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Raosystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Raosystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Raosystem] SET RECOVERY FULL 
GO
ALTER DATABASE [Raosystem] SET  MULTI_USER 
GO
ALTER DATABASE [Raosystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Raosystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Raosystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Raosystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Raosystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Raosystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Raosystem', N'ON'
GO
ALTER DATABASE [Raosystem] SET QUERY_STORE = OFF
GO
USE [Raosystem]
GO
/****** Object:  User [V_OMAR]    Script Date: 19/09/2022 12:59:45 p. m. ******/
CREATE USER [V_OMAR] FOR LOGIN [V_OMAR] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [E_MARCELO]    Script Date: 19/09/2022 12:59:45 p. m. ******/
CREATE USER [E_MARCELO] FOR LOGIN [E_MARCELO] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [V_OMAR]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [V_OMAR]
GO
ALTER ROLE [db_datareader] ADD MEMBER [E_MARCELO]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [E_MARCELO]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 19/09/2022 12:59:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[id_registro] [int] IDENTITY(1,1) NOT NULL,
	[id_almacen] [char](6) NULL,
	[nombre_almacen] [varchar](50) NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria_Producto]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_Producto](
	[id_categoria] [int] IDENTITY(101,1) NOT NULL,
	[categoria_producto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(50001,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[apellido_cliente] [varchar](50) NULL,
	[documento_indentidad] [varchar](20) NULL,
	[id_tipo_documento] [int] NOT NULL,
	[correo_electronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobante_Pago]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante_Pago](
	[id_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_comprobante] [char](2) NOT NULL,
	[numero_comprobante]  AS (concat([id_tipo_comprobante],'-',[id_comprobante])) PERSISTED NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha_comprobante] [datetime] NULL,
	[id_empleado] [varchar](20) NOT NULL,
	[id_producto] [int] NOT NULL,
	[precio_unitario] [numeric](25, 2) NULL,
	[cantidad] [int] NULL,
	[detalle] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [varchar](20) NOT NULL,
	[nombre_empleado] [varchar](50) NOT NULL,
	[apellido_empleado] [varchar](50) NOT NULL,
	[telefono_empleado] [int] NULL,
	[id_rol] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_marca] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento_Almacen]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento_Almacen](
	[id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[id_operacion] [char](6) NOT NULL,
	[id_empleado] [varchar](20) NOT NULL,
	[id_producto] [int] NOT NULL,
	[fecha_movimiento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] IDENTITY(10001,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
	[nombre_producto] [varchar](50) NOT NULL,
	[descripcion_producto] [varchar](200) NULL,
	[precio] [numeric](25, 2) NULL,
	[modelo] [varchar](50) NULL,
	[numero_serie] [varchar](50) NULL,
	[part_number] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol_Empleado]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol_Empleado](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Comprobante]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Comprobante](
	[id_tipo_comprobante] [char](2) NOT NULL,
	[nombre_tipo_comprobante] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Documento]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Documento](
	[id_tipo_documento] [int] NOT NULL,
	[nombre_tipo_documento] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Operacion]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Operacion](
	[id_operacion] [char](6) NOT NULL,
	[nombre_operacion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Almacen] ON 

INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1, N'LIM001', N'Principal', 10001, 10)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (2, N'LIM001', N'Principal', 10002, 20)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (3, N'LIM001', N'Principal', 10003, 13)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (4, N'LIM001', N'Principal', 10004, 21)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (5, N'LIM001', N'Principal', 10005, 9)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (6, N'LIM001', N'Principal', 10006, 16)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (7, N'LIM001', N'Principal', 10007, 8)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (8, N'LIM001', N'Principal', 10008, 6)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (9, N'LIM001', N'Principal', 10009, 8)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (10, N'LIM001', N'Principal', 10010, 10)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (11, N'LIM001', N'Principal', 10011, 31)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (12, N'LIM001', N'Principal', 10012, 4)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (13, N'LIM001', N'Principal', 10013, 14)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (14, N'LIM001', N'Principal', 10014, 22)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (15, N'LIM001', N'Principal', 10015, 16)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (16, N'LIM001', N'Principal', 10016, 10)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (17, N'LIM001', N'Principal', 10017, 4)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (18, N'LIM001', N'Principal', 10018, 11)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (19, N'LIM001', N'Principal', 10019, 3)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (20, N'LIM001', N'Principal', 10020, 18)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (21, N'LIM001', N'Principal', 10021, 17)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (22, N'LIM001', N'Principal', 10022, 15)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (23, N'LIM001', N'Principal', 10023, 22)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (24, N'LIM001', N'Principal', 10024, 3)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (25, N'LIM001', N'Principal', 10025, 19)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (26, N'LIM001', N'Principal', 10026, 1)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (27, N'LIM001', N'Principal', 10027, 24)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (28, N'LIM001', N'Principal', 10028, 33)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (29, N'LIM001', N'Principal', 10029, 150)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (30, N'LIM001', N'Principal', 10030, 20)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (31, N'LIM001', N'Principal', 10031, 50)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (32, N'LIM001', N'Principal', 10032, 33)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1033, N'LIM001', N'Principal', 11030, 11)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1034, N'LIM001', N'Principal', 11031, 10)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1035, N'LIM001', N'Principal', 11032, 15)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1036, N'LIM001', N'Principal', 11033, 56)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1037, N'LIM001', N'Principal', 11034, 35)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1038, N'LIM001', N'Principal', 11035, 25)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1039, N'LIM001', N'Principal', 11036, 5)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1040, N'LIM001', N'Principal', 11037, 9)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1041, N'LIM001', N'Principal', 11038, 58)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1042, N'LIM001', N'Principal', 11039, 18)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1043, N'LIM001', N'Principal', 11040, 1)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1044, N'LIM001', N'Principal', 11041, 0)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1045, N'LIM001', N'Principal', 11042, 86)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1046, N'LIM001', N'Principal', 11043, 36)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1047, N'LIM001', N'Principal', 11044, 26)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1048, N'LIM001', N'Principal', 11045, 6)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1049, N'LIM001', N'Principal', 11046, 7)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (1050, N'LIM001', N'Principal', 11047, 36)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (2033, N'LIM001', N'Principal', 11048, 12)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (2034, N'LIM001', N'Principal', 11049, 0)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (2035, N'LIM001', N'Principal', 11050, 2)
INSERT [dbo].[Almacen] ([id_registro], [id_almacen], [nombre_almacen], [id_producto], [cantidad]) VALUES (2036, N'LIM001', N'Principal', 11051, 34)
SET IDENTITY_INSERT [dbo].[Almacen] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria_Producto] ON 

INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (101, N'SW-SISTEMA OPERATIVO')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (102, N'SW-HERRAMIENTAS DE USUARIO')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (103, N'SW-HERRAMIENTAS DE DISEÑO')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (104, N'HW-PERIFERICOS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (105, N'HW-PORTATILES')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (106, N'HW-PC DE ESCRITORIO')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (107, N'HW-ALL IN ONE')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (108, N'HW-PIEZAS DE COMPUTADORAS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (109, N'HW-IMPRESORAS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (110, N'OTROS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (111, N'HW-PERIFERICOS LAPTOPS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (112, N'HW-ALMACENAMIENTO')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (113, N'HW-SERVIDORES')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (114, N'HW-SUMINISTROS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (115, N'HW-REFRIGERAMIENTO')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (116, N'HW-ESTABILIZADORES')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (117, N'HW-UPS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (118, N'HW-MONITORES')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (119, N'HW-PROYECTORES')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (120, N'HW-REDES')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (121, N'HW-CELULARES')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (122, N'HW-TABLETS')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (123, N'HW-SILLAS GAMER')
INSERT [dbo].[Categoria_Producto] ([id_categoria], [categoria_producto]) VALUES (124, N'HW-BAREBONE')
SET IDENTITY_INSERT [dbo].[Categoria_Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50001, N'CARLOS', N'RAMIREZ', N'45663328', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50002, N'CYBER TEC S.A.C.', N'', N'20826084655', 6, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50003, N'lUIS', N'GONZALES', N'20596348', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50004, N'ARTHURO', N'GOMEZ', N'10326872', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50005, N'ERNESTO', N'PALOMINO', N'08369573', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50006, N'VIOLEA', N'SALAS', N'10867532', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50007, N'PATRICIA', N'HERNNDEZ', N'10367582', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50008, N'JORGUE', N'PIMENTEL', N'20358465', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50009, N'PILAR', N'FUENTES', N'08526975', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50010, N'FELIPE', N'TIRADO', N'10598476', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50011, N'CLAUDIA', N'DIAZ', N'10526984', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50012, N'MARTIN', N'FERNANDINI', N'20597563', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50013, N'EDUARDO', N'CHAVEZ', N'10258569', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50014, N'IVAN', N'ECSUDERO', N'08526594', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50015, N'COCO', N'SILVA', N'102587887', 1, NULL)
INSERT [dbo].[Cliente] ([id_cliente], [nombre_cliente], [apellido_cliente], [documento_indentidad], [id_tipo_documento], [correo_electronico]) VALUES (50016, N'RENATO', N'CORDOVA', N'20312573', 1, NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Comprobante_Pago] ON 

INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (1, N'03', 50001, CAST(N'2022-08-25T00:00:00.000' AS DateTime), N'47550098', 10001, CAST(35.00 AS Numeric(25, 2)), 1, N'MOUSE RETRÁCTIL ÓPTICO')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (2, N'12', 50002, CAST(N'2022-08-24T00:00:00.000' AS DateTime), N'42996621', 10011, CAST(829.00 AS Numeric(25, 2)), 1, N'IMPRESORA MULTIFUNCIONAL')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (3, N'00', 50003, CAST(N'2022-08-23T00:00:00.000' AS DateTime), N'09526874', 10003, CAST(1320.00 AS Numeric(25, 2)), 1, N'SISTEMA OPERATIVO')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (4, N'01', 50004, CAST(N'2022-08-22T00:00:00.000' AS DateTime), N'47002296', 10020, CAST(1199.90 AS Numeric(25, 2)), 1, N'MONITOR CURVO LG')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (5, N'00', 50005, CAST(N'2022-08-21T00:00:00.000' AS DateTime), N'41550095', 10006, CAST(4499.00 AS Numeric(25, 2)), 1, N'LAPTOP ASUS TUF GAMING')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (6, N'03', 50006, CAST(N'2022-08-20T00:00:00.000' AS DateTime), N'09526874', 10026, CAST(109.90 AS Numeric(25, 2)), 1, N'PARLANTE BLUETOOTH ')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (7, N'12', 50007, CAST(N'2022-08-19T00:00:00.000' AS DateTime), N'47550098', 10015, CAST(649.90 AS Numeric(25, 2)), 1, N'CASE GIGABYTE')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (8, N'03', 50008, CAST(N'2022-08-18T00:00:00.000' AS DateTime), N'41550095', 10009, CAST(2590.00 AS Numeric(25, 2)), 1, N'INTEL PC CORE I5')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (9, N'03', 50009, CAST(N'2022-08-17T00:00:00.000' AS DateTime), N'47002296', 10022, CAST(120.90 AS Numeric(25, 2)), 1, N'TECLADO INALÁMBRICO MICROSOFT')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (10, N'03', 50010, CAST(N'2022-08-16T00:00:00.000' AS DateTime), N'09526874', 10007, CAST(3699.00 AS Numeric(25, 2)), 1, N'LAPTOP 2 EN 1')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (11, N'03', 50001, CAST(N'1905-06-14T00:00:00.000' AS DateTime), N'09526874', 10001, CAST(35.00 AS Numeric(25, 2)), 10, N'MOUSE MICROSOFT RETRÁCTIL ÓPTICO')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (12, N'03', 50001, CAST(N'2022-07-25T00:00:00.000' AS DateTime), N'09526874', 10002, CAST(415.00 AS Numeric(25, 2)), 2, N'CAMARA WEB MICROSOFT HD 720P')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (13, N'03', 50001, CAST(N'2022-07-25T00:00:00.000' AS DateTime), N'09526874', 10003, CAST(1320.00 AS Numeric(25, 2)), 1, N'SISTEMA OPERATIVO MICROSOFT WINDOWS 10 PRO 64 BITS-ESPAÑOL')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (14, N'03', 50001, CAST(N'2022-07-25T00:00:00.000' AS DateTime), N'09526874', 10011, CAST(829.00 AS Numeric(25, 2)), 1, N'IMPRESORA EPSON MULTIFUNCIONAL ECOTANK L3110')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (15, N'03', 50003, CAST(N'2022-07-25T00:00:00.000' AS DateTime), N'09623423', 10016, CAST(1099.90 AS Numeric(25, 2)), 1, N'PROCESADOR AMD RYZEN 5 3600')
INSERT [dbo].[Comprobante_Pago] ([id_comprobante], [id_tipo_comprobante], [id_cliente], [fecha_comprobante], [id_empleado], [id_producto], [precio_unitario], [cantidad], [detalle]) VALUES (16, N'01', 50002, CAST(N'2022-09-10T00:00:00.000' AS DateTime), N'47550098', 10003, CAST(1320.00 AS Numeric(25, 2)), 10, N'SISTEMA OPERATIVO MICROSOFT WINDOWS 10 PRO 64 BITS-ESPAÑOL')
SET IDENTITY_INSERT [dbo].[Comprobante_Pago] OFF
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'09526874', N'LUIS', N'GARCÍA', 951753852, 3)
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'09623423', N'CHRISTHIAN', N'RAMIREZ', 945234545, 3)
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'41550095', N'EDUARDO', N'CARBAJAL', 985236985, 1)
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'42996621', N'CECILIA', N'PEREZ', 999357415, 1)
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'43324496', N'JUAN', N'IZAGUIRRE', 932456345, 1)
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'47002296', N'JHORDAN', N'ESPINOZA', 995345875, 2)
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'47550098', N'ALBERTO', N'ALVA', 987456321, 1)
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellido_empleado], [telefono_empleado], [id_rol]) VALUES (N'47752094', N'FABRIZZIO', N'MIGUEL', 975432234, 1)
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (1, N'ACER')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (2, N'ADATA')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (3, N'AMD')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (4, N'APPLE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (5, N'ASUS')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (6, N'DELL')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (7, N'ESET')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (8, N'EPSON')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (9, N'GENÉRICO')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (10, N'GIGABYTE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (11, N'HP')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (12, N'HUAWEI')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (13, N'INTEL')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (14, N'LENOVO')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (15, N'LG')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (16, N'LOGITECH')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (17, N'MICROSOFT')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (18, N'NVIDIA')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (19, N'RAZER')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (20, N'SAMSUNG')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (21, N'SONY')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (22, N'TOSHIBA')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (23, N'CANON')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (24, N'ADVANCE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (25, N'AOC')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (26, N'BROTHER')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (27, N'CDP')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (28, N'CORSAIR')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (29, N'CREATIVE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (30, N'CRUCIAL')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (31, N'ELISE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (32, N'D-LINK')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (33, N'EVGA')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (34, N'GENIUS')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (35, N'KASPERSKY')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (36, N'KINGSTON')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (37, N'GAMEMAX')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (38, N'HALION')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (39, N'GOOGLE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (40, N'TEROS')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (41, N'MCAFEE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (42, N'MOTOROLA')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (43, N'MSI')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (44, N'NORTON')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (45, N'PANDA')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (46, N'PIONEER')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (47, N'SANDISK')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (48, N'SEAGATE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (49, N'TEAMGROUP')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (50, N'THERMALTAKE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (51, N'TP-LINK')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (52, N'TRIPP-LITE')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (53, N'WESTERN DIGITAL')
INSERT [dbo].[Marca] ([id_marca], [nombre_marca]) VALUES (54, N'XIAOMI')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Movimiento_Almacen] ON 

INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (1, N'OP0001', N'09526874', 10001, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (2, N'OP0001', N'09623423', 10002, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (3, N'OP0001', N'09526874', 10003, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (4, N'OP0001', N'09526874', 10004, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (5, N'OP0001', N'09526874', 10005, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (6, N'OP0001', N'09526874', 10006, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (7, N'OP0001', N'09623423', 10007, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (8, N'OP0001', N'09526874', 10008, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (9, N'OP0001', N'09526874', 10009, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (10, N'OP0001', N'09526874', 10010, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (11, N'OP0001', N'09526874', 10011, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (12, N'OP0001', N'09623423', 10012, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (13, N'OP0001', N'09623423', 10013, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (14, N'OP0001', N'09526874', 10014, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (15, N'OP0001', N'09526874', 10015, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (16, N'OP0001', N'09623423', 10016, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (17, N'OP0001', N'09526874', 10017, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (18, N'OP0001', N'09623423', 10018, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (19, N'OP0001', N'09526874', 10019, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (20, N'OP0001', N'09623423', 10020, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (21, N'OP0001', N'09526874', 10021, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (22, N'OP0001', N'09623423', 10022, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (23, N'OP0001', N'09526874', 10023, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (24, N'OP0001', N'09623423', 10024, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (25, N'OP0001', N'09526874', 10025, NULL)
INSERT [dbo].[Movimiento_Almacen] ([id_movimiento], [id_operacion], [id_empleado], [id_producto], [fecha_movimiento]) VALUES (26, N'OP0001', N'09526874', 10026, NULL)
SET IDENTITY_INSERT [dbo].[Movimiento_Almacen] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10001, 17, 104, N'MOUSE', N'MOUSE RETRÁCTIL ÓPTICO', CAST(35.00 AS Numeric(25, 2)), N'MS-MICROSOFT-OP', N'M12345678', N'MMO-1234')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10002, 17, 104, N'CAMARA WEB', N'MICRÓFONO INTEGRADO | HD 720P | 30FPS', CAST(415.00 AS Numeric(25, 2)), N'LIFECAM STUDIO', N'C12345678', N'5WH-00002')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10003, 17, 101, N'SISTEMA OPERATIVO', N'SISTEMA OPERATIVO MICROSOFT WINDOWS 10 PRO 64 BITS-ESPAÑOL', CAST(1320.00 AS Numeric(25, 2)), N'FQC-08981', N'SOW56789', N'FQC-08981')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10004, 11, 105, N'LAPTOP HP PAVILION', N'LAPTOP HP PAVILION GAMING 15-EC1037LA AMD RYZEN5 4600H 8GB 512GB SSD', CAST(4699.00 AS Numeric(25, 2)), N'3Y799LA', N'LPHP56789', N'LP-Y799LA')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10005, 14, 105, N'LAPTOP IDEAPAD', N'LAPTOP IDEAPAD IDEAPAD 3I INTEL CORE I5 14" HD 256GB SSD 8GB RAM PLATINUM GREY', CAST(2599.00 AS Numeric(25, 2)), N'IDEAPAD 3I', N'LPLV56789', N'LP-IDEAPAD 3I')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10006, 5, 105, N'LAPTOP ASUS TUF GAMING', N'TUF GAMING F15 FX506 CORE I5 15.6'' FHD IPS 512GB SSD 8GB RAM 4GB GTX1650', CAST(4499.00 AS Numeric(25, 2)), N'ASUS GXF', N'LPAS56789', N'ASUS GXF')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10007, 1, 105, N'LAPTOP 2 EN 1', N'SPIN 3 SP314-54N-53BF 14" FHD CORE I5 1035G1 8GB 256GB TECLADO INGLES, WINDOWS PRO', CAST(3699.00 AS Numeric(25, 2)), N'SP314-54N-53BF', N'LPAC56789', N'LP-SP314-54N-53BF')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10008, 4, 105, N'APPLE MACBOOK AIR', N'MACBOOK AIR 13 PULGADAS - CHIP M1 - RAM 8GB - 512 GB - ORO', CAST(6399.00 AS Numeric(25, 2)), N'MGNE3E/A', N'AMB456789', N'AMB-MGNE3E/A')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10009, 13, 106, N'INTEL PC CORE I5', N'PC CORE I5 MONITOR 24¨ FHD RAM 16GB DISCO 1TB', CAST(2590.00 AS Numeric(25, 2)), N'GENÉRICO', N'GEN456789', N'GENÉRICO')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10010, 11, 107, N'HP ALL-IN-ONE', N'HP ALL-IN-ONE - 22-DD0010LA', CAST(1599.00 AS Numeric(25, 2)), N'7WS25AA#ABM', N'ALOHP56789', N'ALO-7WS25AA#ABM')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10011, 8, 109, N'IMPRESORA MULTIFUNCIONAL', N'IMPRESORA EPSON MULTIFUNCIONAL ECOTANK L3110', CAST(829.00 AS Numeric(25, 2)), N'L3110', N'IME-456789', N'IME-L3110')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10012, 11, 109, N'IMPRESORA HP', N'IMPRESORA HP NEVERSTOP LASER 1000W', CAST(1118.00 AS Numeric(25, 2)), N'HP NEVERSTOP LASER 1000W', N'H12893039', N'IP-2423-12')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10013, 11, 109, N'IMPRESORA HP', N'IMPRESORA TODO-EN-UNO HP DESKJET INK ADVANTAGE', CAST(1118.00 AS Numeric(25, 2)), N'HP DESKJET INK ADVANTAGE 2775', N'H15854739', N'IP-4655-07')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10014, 10, 108, N'CASE GIGABYTE', N'GIGABYTE ATX C200G RGB MID TOWER', CAST(349.90 AS Numeric(25, 2)), N'ATX C200G RGB', N'G5433443', N'GY-342352')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10015, 10, 108, N'CASE GIGABYTE', N'GIGABYTE ATX C500G RGB MID TOWER', CAST(649.90 AS Numeric(25, 2)), N'ATX C300G RGB', N'G5435673', N'GY-454565')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10016, 19, 108, N'PROCESADOR AMD RYZEN 5', N'AMD RYZEN 5 3600', CAST(1099.90 AS Numeric(25, 2)), N'CPAT4R53600', N'R43657', N'RY-R534534')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10017, 13, 108, N'PROCESADOR INTEL CORE I5', N'INTEL CORE I5-10600K 4.1 GHZ', CAST(1049.90 AS Numeric(25, 2)), N'CPILI510600KF', N'I4543557', N'I-46534534')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10018, 16, 104, N'MOUSE INALÁMBRICO LOGITECH ', N'MOUSE INALÁMBRICO LOGITECH M185', CAST(59.90 AS Numeric(25, 2)), N'M185', N'L423423', N'LO-423646534534')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10019, 15, 104, N'MONITOR PLANO LG', N'MONITOR PLANO LG 29WP60G-B 29', CAST(1249.00 AS Numeric(25, 2)), N'29WP60G-B', N'34563342', N'LG-242390534')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10020, 15, 104, N'MONITOR CURVO LG', N'MONITOR CURVO LG GAMER G241VC 23.6', CAST(1199.90 AS Numeric(25, 2)), N'OPTIXG241VC', N'5478796785', N'MS-356543')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10021, 16, 104, N'TECLADO INALÁMBRICO LOGITECH', N'TECLADO INALÁMBRICO LOGITECH K480 ', CAST(249.90 AS Numeric(25, 2)), N'920-006346', N'35990112', N'LG-3650143')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10022, 17, 104, N'TECLADO INALÁMBRICO MICROSOFT', N'TECLADO INALÁMBRICO H342 ', CAST(120.90 AS Numeric(25, 2)), N'EK780T-BK', N'12909241', N'MR-1065017')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10023, 17, 104, N'CAMARA WEB', N'CÁMARA WEB MICROSOFT LIFECAM', CAST(200.00 AS Numeric(25, 2)), N'HD-3000', N'1901343', N'MI-53437')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10024, 14, 105, N'LAPTOP LENOVO IDEAPAD 14', N'LAPTOP LENOVO IDEAPAD 14", RYZEN 5 4500U, 512GB SSD, 8GB RAM, GRÁFICA RADEON', CAST(3199.90 AS Numeric(25, 2)), N'81W3006VLM', N'464577856', N'LE-345225XF')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10025, 10, 108, N'PLACA GIGABYTE', N'GIGABYTE B560M AORUS PRO AX ASR', CAST(949.90 AS Numeric(25, 2)), N'B560M AORUS PRO', N'3565787543', N'GY-223355')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10026, 21, 104, N'PARLANTE BLUETOOTH ', N'SONY EXTRA BASS XB01 IPX5', CAST(109.90 AS Numeric(25, 2)), N'SRS-XB01WCLA', N'32467881', N'SO-2353564')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10027, 16, 111, N'MOUSE RETRACTIL', N'MOUSE LOGITECH MICRO TRAVELER V2 USB SILVER', CAST(15.00 AS Numeric(25, 2)), N'TRAVELER V2', N'MLR000254', N'31010125102')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10028, 11, 111, N'MOCHILA', N'MOCHILA PRELUDE HP PARA LAPTOP DE 15.6" PLOMO', CAST(65.00 AS Numeric(25, 2)), N'PRELUDE', N'MHP660223', N'BUS89107G')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10029, 9, 110, N'CABLE USB PARA IMPRESORA', N'CABLE USB PARA IMPRESORA DE 1.5 METROS', CAST(3.00 AS Numeric(25, 2)), N'CUSB1568', N'GUSB25631', N'259874631')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10030, 54, 121, N'CELULAR XIAOMI REDMI', N'CELULAR XIAOMI REDMI NOTE 11 128GB/4GBRAM, CÁMARA PRINCIPAL 50MP, FRONTAL 13MP, SNAPDRAGON', CAST(1099.00 AS Numeric(25, 2)), N'REDMI NOTE 11', N'CXI345500', N'CXR-15833')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10031, 54, 121, N'CELULAR XIAOMI REDMI', N'XIAOMI REDMI NOTE 11 PRO 128GB/6GBRAM  LIBRE -STAR BLUE', CAST(1199.00 AS Numeric(25, 2)), N'REDMI NOTE 11 PRO', N'CXI125901', N'CXR-36980')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (10032, 51, 120, N'TP-LINK ROUTER', N'TP-LINK ROUTER INALAMBRICO WIFI N 450MBPS', CAST(125.90 AS Numeric(25, 2)), N'TL-WR940N', N'RTP369145', N'RTP-33691')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11030, 11, 107, N'ALL-IN-ONE HP 200 G4', N'ALL-IN-ONE HP 200 G4 21.5" LCD WLED FHD CORE I3-10110U 2.1 / 4.1GHZ 8GB DDR4 1TB HDD', CAST(2033.00 AS Numeric(25, 2)), N'HP 200 G4', N'AIO125963', N'4D053LT#ABM')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11031, 14, 106, N'COMPUTADORA LENOVO THINKCENTRE', N'COMPUTADORA LENOVO THINKCENTRE NEO 50S CORE I3-12100 3.30 / 4.30GHZ 8GB-DDR4 3200MHZ 256GB-SSD', CAST(2140.00 AS Numeric(25, 2)), N'THINKCENTRE NEO 50S', N'PCL002363', N'11SWS05P00')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11032, 14, 107, N'ALL-IN-ONE LENOVO IDEACENTRE AIO 3', N'ALL-IN-ONE LENOVO IDEACENTRE AIO 3 24ITL6 23.8" FHD CORE I3-1115G4 3.0 / 4.1GHZ 8GB SO-DIMM DDR4 256GB SSD WINDOWS 11 HOME 64-BITS EN ESPAÑOL', CAST(2730.00 AS Numeric(25, 2)), N'IDEACENTRE AIO 3', N'AHP099321', N'F0G000TVLD')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11033, 48, 112, N'DISCO DURO SEAGATE', N'DISCO DURO SEAGATE SKYHAWK SURVEILLANCE ST2000VX015 2TB SATA 6.0 GBPS', CAST(266.00 AS Numeric(25, 2)), N'SKYHAWK SURVEILLANCE', N'HSS100077', N'ST2000VX015')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11034, 6, 106, N'COMPUTADORA DELL OPTIPLEX', N'COMPUTADORA DELL OPTIPLEX 7090 SFF CORE I7-11700 2.50 / 3.20GHZ 16GB DDR4 512GB SSD WINDOWS 10 PRO 64BITS EN ESPAÑOL', CAST(4832.00 AS Numeric(25, 2)), N'OPTIPLEX 7090 SFF', N'COS222074', N'3000121810')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11035, 43, 108, N'CASE MSI', N'CASE MSI ATX MAG FORGE 111R SIN FUENTE DE PODER', CAST(260.00 AS Numeric(25, 2)), N'MAG FORGE 111R', N'CMS278891', N'SFORGE001')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11036, 3, 108, N'PROCESADOR AMD', N'PROCESADOR AMD RYZEN 3 4100 3.80 / 4.0GHZ AM4', CAST(645.00 AS Numeric(25, 2)), N'RYZEN 3 4100', N'PAM045840', N'CPAM4R341')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11037, 3, 108, N'PROCESADOR AMD', N'PROCESADOR AMD RYZEN 7 5700G, 3.80 / 4.60GHZ, 16MB L3, 8-CORE, AM4', CAST(1659.00 AS Numeric(25, 2)), N'RYZEN 7 5700G', N'PAR741349', N'CPAM4R757')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11038, 13, 108, N'PROCESADOR INTEL', N'PROCESADOR INTEL CELERON G6900 3.40GHZ 4MB INTEL SMART CACHÉ LGA1700', CAST(408.00 AS Numeric(25, 2)), N'Celeron G6900', N'PIN555007', N'CPILG6900')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11039, 13, 108, N'PROCESADOR INTEL', N'PROCESADOR INTEL CORE I7-10700F 2.90 GHZ 16 MB CACHÉ L3 LGA1200', CAST(1545.00 AS Numeric(25, 2)), N'CORE I7-10700F', N'PII715900', N'ILI710700F')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11040, 48, 112, N'DISCO DURO EXTERNO PORTATIL', N'DISCO DURO EXTERNO PORTATIL SEAGATE EXPANSION STKM1000400 1 TB USB 3.0', CAST(205.00 AS Numeric(25, 2)), N'STKM1000400', N'DDS236001', N'JL1000400')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11041, 11, 112, N'DISCO DURO EXTERNO', N'DISCO DURO EXTERNO EN ESTADO SÓLIDO HP P500 PORTABLE SSD 120GB USB 3.1 GEN 2 TIPO-C', CAST(169.00 AS Numeric(25, 2)), N'HP P500', N'DHP123990', N'SSDHP7PD4')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11042, 53, 112, N'DISCO DURO EXTERNO', N'DISCO DURO EXTERNO WESTERN DIGITAL ELEMENTS PORTABLE 5 TB USB 3.0/2.0 NEGRO', CAST(566.00 AS Numeric(25, 2)), N'ELEMENTS', N'DWD169781', N' HDEWDBU6Y')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11043, 40, 104, N'KIT TECLADO Y MOUSE', N'KIT TECLADO Y MOUSE TEROS TE4062N USB ACABADO ELEGANTE NEGRO ESPAÑOL ÓPTICO', CAST(45.00 AS Numeric(25, 2)), N'TE4062N', N'TTM069330', N'KBMSTE406')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11044, 8, 114, N'TINTA EPSON L200', N'TINTA EPSON L200 AMARILLO BOTELLA DE TINTA EPSON T664420', CAST(48.00 AS Numeric(25, 2)), N'T664420', N'TEL117700', N'STEPT6644')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11045, 8, 114, N'TINTA EPSON L200', N'TINTA EPSON L200 NEGRO BOTELLA DE TINTA EPSON T664120', CAST(48.00 AS Numeric(25, 2)), N'T664120', N'TEL669781', N'STEPT6641')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11046, 8, 114, N'TINTA EPSON L200', N'TINTA EPSON L200 MAGENTA BOTELLA DE TINTA EPSON T664320', CAST(48.00 AS Numeric(25, 2)), N'T664320', N'TEL165890', N'STEPT6643')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11047, 51, 120, N'EXTENSOR WIRELESS', N'EXTENSOR WIRELESS UNIVERSAL TP-LINK TL-WA850RE INDOOR 2.4 GHZ 802.11 B/G/N', CAST(86.00 AS Numeric(25, 2)), N'TL-WA850RE', N'TPL006678', N'NWTLWA850')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11048, 51, 120, N'ROUTER', N'ROUTER ETHERNET WIRELESS TP-LINK TL-W8961N 300 MBPS 2.4 GHZ 802.11 B/G/N 2 ANTENAS', CAST(135.00 AS Numeric(25, 2)), N'TL-W8961N', N'TPL055257', N'NWTDW8961')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11049, 51, 120, N'ACCESS POINT', N'ACCESS POINT TP-LINK 300M WIRELESS N TL-WA901N 3 ANTENAS', CAST(164.00 AS Numeric(25, 2)), N'TL-WA901N', N'TPL098001', N'NWTLWA901')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11050, 36, 112, N'MEMORIA FLASH USB', N'MEMORIA FLASH USB KINGSTON DATATRAVELER EXODIA 32GB, USB 3.2', CAST(29.00 AS Numeric(25, 2)), N'EXODIA', N'UFB056909', N'ACKTDTX32')
INSERT [dbo].[Producto] ([id_producto], [id_marca], [id_categoria], [nombre_producto], [descripcion_producto], [precio], [modelo], [numero_serie], [part_number]) VALUES (11051, 36, 112, N'MEMORIA FLASH USB', N'MEMORIA FLASH USB KINGSTON DATATRAVELER EXODIA M 64GB USB 3.2 GEN 1 AZUL', CAST(45.00 AS Numeric(25, 2)), N'EXODIA M', N'UFK051178', N'ACKTDTXM64')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol_Empleado] ON 

INSERT [dbo].[Rol_Empleado] ([id_rol], [nombre_rol]) VALUES (1, N'VENDEDOR')
INSERT [dbo].[Rol_Empleado] ([id_rol], [nombre_rol]) VALUES (2, N'SUPERVISOR')
INSERT [dbo].[Rol_Empleado] ([id_rol], [nombre_rol]) VALUES (3, N'ALMACENERO')
SET IDENTITY_INSERT [dbo].[Rol_Empleado] OFF
GO
INSERT [dbo].[Tipo_Comprobante] ([id_tipo_comprobante], [nombre_tipo_comprobante]) VALUES (N'00', N'OTROS')
INSERT [dbo].[Tipo_Comprobante] ([id_tipo_comprobante], [nombre_tipo_comprobante]) VALUES (N'01', N'FACTURA')
INSERT [dbo].[Tipo_Comprobante] ([id_tipo_comprobante], [nombre_tipo_comprobante]) VALUES (N'03', N'BOLETA DE VENTA')
INSERT [dbo].[Tipo_Comprobante] ([id_tipo_comprobante], [nombre_tipo_comprobante]) VALUES (N'12', N'TICKET')
GO
INSERT [dbo].[Tipo_Documento] ([id_tipo_documento], [nombre_tipo_documento]) VALUES (0, N'OTROS TIPOS DE DOCUMENTOS')
INSERT [dbo].[Tipo_Documento] ([id_tipo_documento], [nombre_tipo_documento]) VALUES (1, N'DOCUMENTO NACIONAL DE IDENTIDAD (DNI)')
INSERT [dbo].[Tipo_Documento] ([id_tipo_documento], [nombre_tipo_documento]) VALUES (4, N'CARNET DE EXTRANJERIA')
INSERT [dbo].[Tipo_Documento] ([id_tipo_documento], [nombre_tipo_documento]) VALUES (6, N'REGISTRO ÚNICO DE CONTRIBUYENTES')
INSERT [dbo].[Tipo_Documento] ([id_tipo_documento], [nombre_tipo_documento]) VALUES (7, N'PASAPORTE')
GO
INSERT [dbo].[Tipo_Operacion] ([id_operacion], [nombre_operacion]) VALUES (N'OP0001', N'ENTRADA')
INSERT [dbo].[Tipo_Operacion] ([id_operacion], [nombre_operacion]) VALUES (N'OP0002', N'SALIDA')
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [fk_Producto]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fk_Cliente_Tipo_Documento] FOREIGN KEY([id_tipo_documento])
REFERENCES [dbo].[Tipo_Documento] ([id_tipo_documento])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fk_Cliente_Tipo_Documento]
GO
ALTER TABLE [dbo].[Comprobante_Pago]  WITH CHECK ADD  CONSTRAINT [fk_Cliente_Comprobante_Pago] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Comprobante_Pago] CHECK CONSTRAINT [fk_Cliente_Comprobante_Pago]
GO
ALTER TABLE [dbo].[Comprobante_Pago]  WITH CHECK ADD  CONSTRAINT [fk_Empleado_Comprobante_Pago] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Comprobante_Pago] CHECK CONSTRAINT [fk_Empleado_Comprobante_Pago]
GO
ALTER TABLE [dbo].[Comprobante_Pago]  WITH CHECK ADD  CONSTRAINT [fk_Tipo_Comprobante_Comprobante_Pago] FOREIGN KEY([id_tipo_comprobante])
REFERENCES [dbo].[Tipo_Comprobante] ([id_tipo_comprobante])
GO
ALTER TABLE [dbo].[Comprobante_Pago] CHECK CONSTRAINT [fk_Tipo_Comprobante_Comprobante_Pago]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [fk_Rol_Empleado] FOREIGN KEY([id_rol])
REFERENCES [dbo].[Rol_Empleado] ([id_rol])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [fk_Rol_Empleado]
GO
ALTER TABLE [dbo].[Movimiento_Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Empleado_Movimiento_Almacen] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Movimiento_Almacen] CHECK CONSTRAINT [fk_Empleado_Movimiento_Almacen]
GO
ALTER TABLE [dbo].[Movimiento_Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Producto_Movimento_Almacen] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Movimiento_Almacen] CHECK CONSTRAINT [fk_Producto_Movimento_Almacen]
GO
ALTER TABLE [dbo].[Movimiento_Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Tipo_Operacio_Movimiento_Almacen] FOREIGN KEY([id_operacion])
REFERENCES [dbo].[Tipo_Operacion] ([id_operacion])
GO
ALTER TABLE [dbo].[Movimiento_Almacen] CHECK CONSTRAINT [fk_Tipo_Operacio_Movimiento_Almacen]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fk_Categoria_Producto] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categoria_Producto] ([id_categoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fk_Categoria_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fk_Producto_Marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id_marca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fk_Producto_Marca]
GO
/****** Object:  StoredProcedure [dbo].[SP_ModelosxMarca]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ModelosxMarca]
	@busca VARCHAR(15)
AS
BEGIN
	SELECT nombre_marca, modelo, precio FROM Marca M INNER JOIN Producto P 
	ON M.id_marca=P.id_marca
	WHERE M.nombre_marca LIKE @busca
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ReposicionStock]    Script Date: 19/09/2022 12:59:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ReposicionStock]
	@IDProdcuto AS VARCHAR(5),
	@Cantidad AS INT
AS
UPDATE Almacen SET cantidad = cantidad + @Cantidad
WHERE id_producto = @IDProdcuto
GO
USE [master]
GO
ALTER DATABASE [Raosystem] SET  READ_WRITE 
GO

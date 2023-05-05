USE [master]
GO
/****** Object:  Database [app-reportes]    Script Date: 5/5/2023 11:36:30 ******/
CREATE DATABASE [app-reportes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'app-reportes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\app-reportes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'app-reportes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\app-reportes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [app-reportes] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [app-reportes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [app-reportes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [app-reportes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [app-reportes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [app-reportes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [app-reportes] SET ARITHABORT OFF 
GO
ALTER DATABASE [app-reportes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [app-reportes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [app-reportes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [app-reportes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [app-reportes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [app-reportes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [app-reportes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [app-reportes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [app-reportes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [app-reportes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [app-reportes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [app-reportes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [app-reportes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [app-reportes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [app-reportes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [app-reportes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [app-reportes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [app-reportes] SET RECOVERY FULL 
GO
ALTER DATABASE [app-reportes] SET  MULTI_USER 
GO
ALTER DATABASE [app-reportes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [app-reportes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [app-reportes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [app-reportes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [app-reportes] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'app-reportes', N'ON'
GO
ALTER DATABASE [app-reportes] SET QUERY_STORE = OFF
GO
USE [app-reportes]
GO
/****** Object:  User [alumno]    Script Date: 5/5/2023 11:36:30 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Aulas]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aulas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Aulas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Edificios]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edificios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Edificios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Edificios_Pisos]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edificios_Pisos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Edificio] [int] NOT NULL,
	[Id_Piso] [int] NOT NULL,
 CONSTRAINT [PK_Edificios_Pisos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incidentes]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidentes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NULL,
	[Id_Usuario] [int] NULL,
	[Id_Piso_Aula] [int] NULL,
	[Fecha] [date] NULL,
	[Nivel] [int] NULL,
 CONSTRAINT [PK_Incidentes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Niveles_Importancia]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Niveles_Importancia](
	[Id] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Niveles_Importancia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pisos]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pisos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pisos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pisos_Aulas]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pisos_Aulas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Piso_Edificio] [int] NOT NULL,
	[Id_Aula] [int] NOT NULL,
 CONSTRAINT [PK_Pisos_Aulas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios_Aulas]    Script Date: 5/5/2023 11:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios_Aulas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Usuario] [int] NOT NULL,
	[Id_Aula] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios_Aulas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Niveles_Importancia] ([Id], [Descripcion]) VALUES (1, N'Bajo')
INSERT [dbo].[Niveles_Importancia] ([Id], [Descripcion]) VALUES (2, N'Medio')
INSERT [dbo].[Niveles_Importancia] ([Id], [Descripcion]) VALUES (3, N'Alto')
GO
ALTER TABLE [dbo].[Edificios_Pisos]  WITH CHECK ADD  CONSTRAINT [FK_Edificios_Pisos_Edificios] FOREIGN KEY([Id_Edificio])
REFERENCES [dbo].[Edificios] ([Id])
GO
ALTER TABLE [dbo].[Edificios_Pisos] CHECK CONSTRAINT [FK_Edificios_Pisos_Edificios]
GO
ALTER TABLE [dbo].[Edificios_Pisos]  WITH CHECK ADD  CONSTRAINT [FK_Edificios_Pisos_Pisos] FOREIGN KEY([Id_Piso])
REFERENCES [dbo].[Pisos] ([Id])
GO
ALTER TABLE [dbo].[Edificios_Pisos] CHECK CONSTRAINT [FK_Edificios_Pisos_Pisos]
GO
ALTER TABLE [dbo].[Incidentes]  WITH CHECK ADD  CONSTRAINT [FK_Incidentes_Niveles_Importancia] FOREIGN KEY([Nivel])
REFERENCES [dbo].[Niveles_Importancia] ([Id])
GO
ALTER TABLE [dbo].[Incidentes] CHECK CONSTRAINT [FK_Incidentes_Niveles_Importancia]
GO
ALTER TABLE [dbo].[Incidentes]  WITH CHECK ADD  CONSTRAINT [FK_Incidentes_Pisos_Aulas] FOREIGN KEY([Id_Piso_Aula])
REFERENCES [dbo].[Pisos_Aulas] ([Id])
GO
ALTER TABLE [dbo].[Incidentes] CHECK CONSTRAINT [FK_Incidentes_Pisos_Aulas]
GO
ALTER TABLE [dbo].[Incidentes]  WITH CHECK ADD  CONSTRAINT [FK_Incidentes_Usuarios] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Incidentes] CHECK CONSTRAINT [FK_Incidentes_Usuarios]
GO
ALTER TABLE [dbo].[Pisos_Aulas]  WITH CHECK ADD  CONSTRAINT [FK_Pisos_Aulas_Aulas] FOREIGN KEY([Id_Aula])
REFERENCES [dbo].[Aulas] ([Id])
GO
ALTER TABLE [dbo].[Pisos_Aulas] CHECK CONSTRAINT [FK_Pisos_Aulas_Aulas]
GO
ALTER TABLE [dbo].[Pisos_Aulas]  WITH CHECK ADD  CONSTRAINT [FK_Pisos_Aulas_Edificios_Pisos] FOREIGN KEY([Id_Piso_Edificio])
REFERENCES [dbo].[Edificios_Pisos] ([Id])
GO
ALTER TABLE [dbo].[Pisos_Aulas] CHECK CONSTRAINT [FK_Pisos_Aulas_Edificios_Pisos]
GO
ALTER TABLE [dbo].[Usuarios_Aulas]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Aulas_Aulas] FOREIGN KEY([Id_Aula])
REFERENCES [dbo].[Aulas] ([Id])
GO
ALTER TABLE [dbo].[Usuarios_Aulas] CHECK CONSTRAINT [FK_Usuarios_Aulas_Aulas]
GO
ALTER TABLE [dbo].[Usuarios_Aulas]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Aulas_Usuarios] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Usuarios_Aulas] CHECK CONSTRAINT [FK_Usuarios_Aulas_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [app-reportes] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Puntualidad]    Script Date: 07/02/2023 03:49:39 p. m. ******/
CREATE DATABASE [Puntualidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Puntualidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Puntualidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Puntualidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Puntualidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Puntualidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Puntualidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Puntualidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Puntualidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Puntualidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Puntualidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Puntualidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Puntualidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Puntualidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Puntualidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Puntualidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Puntualidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Puntualidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Puntualidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Puntualidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Puntualidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Puntualidad] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Puntualidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Puntualidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Puntualidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Puntualidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Puntualidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Puntualidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Puntualidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Puntualidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Puntualidad] SET  MULTI_USER 
GO
ALTER DATABASE [Puntualidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Puntualidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Puntualidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Puntualidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Puntualidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Puntualidad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Puntualidad', N'ON'
GO
ALTER DATABASE [Puntualidad] SET QUERY_STORE = OFF
GO
USE [Puntualidad]
GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[EmpleadoId] [int] NOT NULL,
	[FechaEntrada] [datetime] NULL,
	[FechaSalida] [datetime] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[TurnoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Turno] [varchar](20) NOT NULL,
	[Entrada] [datetime] NULL,
	[Salida] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD FOREIGN KEY([EmpleadoId])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([TurnoId])
REFERENCES [dbo].[Turnos] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[EmpleadosHorario]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadosHorario]
AS
SELECT Empleado.Id, Empleado.Nombre, Empleado.Apellidos, Turnos.Turno,  RIGHT( CONVERT(DATETIME, Turnos.Entrada, 108),8) as HoraEntrada, RIGHT( CONVERT(DATETIME, Turnos.Salida, 108),8) as HoraSalida
FROM Empleado
INNER JOIN Turnos ON
Empleado.TurnoId=Turnos.Id;
GO
/****** Object:  StoredProcedure [dbo].[EntradasSalidasPorFecha]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntradasSalidasPorFecha] @FechaInicial date, @FechaFinal date
as
select E.Id, E.Nombre, E.Apellidos, A.FechaEntrada, A.FechaSalida 
from Empleado as E
inner join Asistencia as A
on E.Id=A.EmpleadoId
where A.FechaEntrada between @FechaInicial and @FechaFinal;
GO
/****** Object:  StoredProcedure [dbo].[RegistroEntrada]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistroEntrada] @EmpleadoId int
AS 
INSERT INTO Asistencia (EmpleadoId, FechaEntrada) VALUES (@EmpleadoId, GETDATE());
GO
/****** Object:  StoredProcedure [dbo].[RegistroSalida]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistroSalida] @EmpleadoId int
AS 
UPDATE Asistencia SET FechaSalida=GETDATE() 
where EmpleadoId=@EmpleadoId 
and CONVERT(date, FechaEntrada)=CONVERT(date, GETDATE());
GO
/****** Object:  StoredProcedure [dbo].[ValidarAsistencia]    Script Date: 07/02/2023 03:49:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidarAsistencia]
as
SELECT 
e.Id, CONCAT(e.Nombre, ' ', e.Apellidos) as Nombre, a.FechaEntrada, a.FechaSalida
FROM
Empleado e
left join
Asistencia a
on
e.Id = a.EmpleadoId
and CONVERT(date, a.FechaEntrada)=CONVERT(date, GETDATE());
GO
USE [master]
GO
ALTER DATABASE [Puntualidad] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [IEFI_Nicolas_Barrionuevo]    Script Date: 13/11/2023 17:58:23 ******/
CREATE DATABASE [IEFI_Nicolas_Barrionuevo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IEFI_Nicolas_Barrionuevo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IEFI_Nicolas_Barrionuevo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IEFI_Nicolas_Barrionuevo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\IEFI_Nicolas_Barrionuevo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IEFI_Nicolas_Barrionuevo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET ARITHABORT OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET RECOVERY FULL 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET  MULTI_USER 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IEFI_Nicolas_Barrionuevo', N'ON'
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET QUERY_STORE = ON
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IEFI_Nicolas_Barrionuevo]
GO
/****** Object:  Table [dbo].[Animales]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animales](
	[Id_Animal] [int] NOT NULL,
	[Nombre] [varchar](250) NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Razas]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Razas](
	[Id_Raza] [int] NOT NULL,
	[Nombre] [varchar](250) NULL,
	[Id_Animal] [int] NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Raza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaAnimalesConRazas]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaAnimalesConRazas] AS
SELECT A.Id_Animal, A.Nombre, R.Nombre AS Raza, A.FechaBaja
FROM Animales A
JOIN Razas R ON A.Id_Animal = R.Id_Animal;
GO
/****** Object:  Table [dbo].[Mascotas]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascotas](
	[Id_Mascota] [int] NOT NULL,
	[Nombre] [varchar](250) NULL,
	[Apodo] [varchar](250) NULL,
	[NombreDueño] [varchar](250) NULL,
	[Id_Raza] [int] NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaMascotasConRazas]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VistaMascotasConRazas] AS
SELECT M.Id_Mascota, M.Nombre, M.Apodo, M.NombreDueño, R.Nombre AS Raza, M.FechaBaja
FROM Mascotas M
JOIN Razas R ON M.Id_Raza = R.Id_Raza;
GO
ALTER TABLE [dbo].[Mascotas]  WITH CHECK ADD FOREIGN KEY([Id_Raza])
REFERENCES [dbo].[Razas] ([Id_Raza])
GO
ALTER TABLE [dbo].[Razas]  WITH CHECK ADD FOREIGN KEY([Id_Animal])
REFERENCES [dbo].[Animales] ([Id_Animal])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarAnimal]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizarAnimal]
    @Id_Animal INT,
    @Nombre VARCHAR(250),
    @FechaBaja DATETIME
AS
BEGIN
    UPDATE Animales
    SET Nombre = @Nombre, FechaBaja = @FechaBaja
    WHERE Id_Animal = @Id_Animal;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarAnimal]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarAnimal]
    @Id_Animal INT
AS
BEGIN
    DELETE FROM Animales
    WHERE Id_Animal = @Id_Animal;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarAnimal]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarAnimal]
    @Id_Animal INT,
    @Nombre VARCHAR(250),
    @FechaBaja DATETIME
AS
BEGIN
    INSERT INTO Animales (Id_Animal, Nombre, FechaBaja)
    VALUES (@Id_Animal, @Nombre, @FechaBaja);
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarAnimales]    Script Date: 13/11/2023 17:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarAnimales]
AS
BEGIN
    SELECT * FROM Animales;
END
GO
USE [master]
GO
ALTER DATABASE [IEFI_Nicolas_Barrionuevo] SET  READ_WRITE 
GO

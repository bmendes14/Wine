USE [master]
GO
/****** Object:  Database [p8g6]    Script Date: 07/06/2019 19:31:24 ******/
CREATE DATABASE [p8g6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'p8g6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p8g6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'p8g6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\p8g6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [p8g6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [p8g6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [p8g6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [p8g6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [p8g6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [p8g6] SET ARITHABORT OFF 
GO
ALTER DATABASE [p8g6] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [p8g6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [p8g6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [p8g6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [p8g6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [p8g6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [p8g6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [p8g6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [p8g6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [p8g6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [p8g6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [p8g6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [p8g6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [p8g6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [p8g6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [p8g6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [p8g6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [p8g6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [p8g6] SET  MULTI_USER 
GO
ALTER DATABASE [p8g6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [p8g6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [p8g6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [p8g6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [p8g6] SET DELAYED_DURABILITY = DISABLED 
GO
USE [p8g6]
GO
/****** Object:  User [p8g6]    Script Date: 07/06/2019 19:31:24 ******/
CREATE USER [p8g6] FOR LOGIN [p8g6] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [p8g6]
GO
/****** Object:  Schema [Rent_a_Car]    Script Date: 07/06/2019 19:31:24 ******/
CREATE SCHEMA [Rent_a_Car]
GO
/****** Object:  Schema [Vinhos]    Script Date: 07/06/2019 19:31:24 ******/
CREATE SCHEMA [Vinhos]
GO
/****** Object:  UserDefinedDataType [dbo].[validint]    Script Date: 07/06/2019 19:31:24 ******/
CREATE TYPE [dbo].[validint] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[validname]    Script Date: 07/06/2019 19:31:24 ******/
CREATE TYPE [dbo].[validname] FROM [varchar](60) NOT NULL
GO
/****** Object:  Table [Vinhos].[Castas]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Castas](
	[Aroma] [dbo].[validname] NOT NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](800) NULL,
	[Nome] [dbo].[validname] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[Concursos]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Concursos](
	[Premiacoes] [varchar](20) NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
	[CodigoConcurso] [dbo].[validname] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[Derivados]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Derivados](
	[Nome] [dbo].[validname] NOT NULL,
	[Descricao] [varchar](60) NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
	[QuintaID] [dbo].[validint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[Distribui]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vinhos].[Distribui](
	[QuintaID] [dbo].[validint] NOT NULL,
	[DistribuiID] [dbo].[validint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Vinhos].[Distribuidor]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Distribuidor](
	[Nome] [varchar](200) NOT NULL,
	[Adress] [varchar](20) NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[Enologos]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Enologos](
	[Nome] [dbo].[validname] NOT NULL,
	[Nparticipacoes] [int] NULL,
	[NSocioEnologo] [dbo].[validint] NOT NULL,
	[UserId] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NSocioEnologo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[Owner]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Owner](
	[Nome] [dbo].[validname] NOT NULL,
	[Grupo] [dbo].[validname] NOT NULL,
	[Telefone] [varchar](15) NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[OwnerShip]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vinhos].[OwnerShip](
	[Owner_ID] [dbo].[validint] NOT NULL,
	[Quinta_ID] [dbo].[validint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Vinhos].[Participa]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vinhos].[Participa](
	[CodigoConcurso] [dbo].[validint] NOT NULL,
	[VinhoId] [dbo].[validint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Vinhos].[Posicoes]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vinhos].[Posicoes](
	[PosicoesNu] [dbo].[validint] NOT NULL,
	[CodigoConcurso] [dbo].[validint] NOT NULL,
	[VinhoID] [dbo].[validint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Vinhos].[Quinta]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Quinta](
	[Nome] [dbo].[validname] NOT NULL,
	[Morada] [varchar](9) NOT NULL,
	[TamanhoProducao] [int] NULL,
	[Descricao] [varchar](1000) NULL,
	[Telefone] [varchar](9) NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
	[RegiaoID] [dbo].[validint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[Regiao]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Regiao](
	[Solo] [dbo].[validname] NOT NULL,
	[Clima] [dbo].[validname] NOT NULL,
	[Nome] [dbo].[validname] NOT NULL,
	[Codigo] [varchar](9) NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[SaoJuri]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vinhos].[SaoJuri](
	[SocioEnologo] [dbo].[validint] NOT NULL,
	[ConcursoID] [dbo].[validint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Vinhos].[Tem]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vinhos].[Tem](
	[VinhoId] [dbo].[validint] NOT NULL,
	[CastasID] [dbo].[validint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Vinhos].[Users]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Users](
	[Nome] [dbo].[validname] NOT NULL,
	[DataNascimento] [date] NULL,
	[Pass] [dbo].[validname] NOT NULL,
	[Salt] [varchar](15) NULL,
	[NIF] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[Vinho]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vinhos].[Vinho](
	[Nome] [dbo].[validname] NOT NULL,
	[PercentagemAlcool] [dbo].[validint] NOT NULL,
	[Preco] [decimal](5, 2) NULL,
	[Avaliacao] [int] NULL,
	[Descricao] [varchar](500) NULL,
	[InfoNutricional] [varchar](200) NULL,
	[ID] [dbo].[validint] IDENTITY(1,1) NOT NULL,
	[TemperaturaServir] [varchar](7) NULL,
	[RegiaoID] [dbo].[validint] NOT NULL,
	[QuintaID] [dbo].[validint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Vinhos].[VinhosAssociados]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vinhos].[VinhosAssociados](
	[Enologo_ID] [dbo].[validint] NOT NULL,
	[Vinho_ID] [dbo].[validint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [Vinhos].[ALLCastas]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[ALLCastas]() returns table
as
	return(select Vinhos.Castas.Nome,Vinhos.Castas.ID from Vinhos.Castas);

GO
/****** Object:  UserDefinedFunction [Vinhos].[CastasAssociadaVinho]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[CastasAssociadaVinho](@ID int) returns table
as
	return(select Vinhos.Castas.Nome,Vinhos.Castas.ID from Vinhos.Tem, Vinhos.Castas Where Vinhos.Tem.VinhoId=@ID and Vinhos.Castas.ID=Vinhos.Tem.CastasID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[ConcursoName]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[ConcursoName]() returns table
as 
	return(select * from Vinhos.Concursos );

GO
/****** Object:  UserDefinedFunction [Vinhos].[CountQuintas]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[CountQuintas]() returns table
as
    return (Select count(*) as counts from Vinhos.Quinta);

GO
/****** Object:  UserDefinedFunction [Vinhos].[CountWines]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[CountWines]() returns table
as 
	return(Select count(*) as counts from Vinhos.Vinho);

GO
/****** Object:  UserDefinedFunction [Vinhos].[Enologo]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[Enologo]() returns table
as
	return(select Vinhos.Enologos.Nome,Vinhos.Enologos.NSocioEnologo from Vinhos.Enologos);

GO
/****** Object:  UserDefinedFunction [Vinhos].[EnologoAssociatioWine]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[EnologoAssociatioWine](@ID int) returns table
as
	return(select  Vinhos.Vinho.Nome as VinhoNome, Vinhos.Vinho.ID AS Vinhoid from Vinhos.Enologos join Vinhos.VinhosAssociados on Vinhos.Enologos.NSocioEnologo=Vinhos.VinhosAssociados.Enologo_ID JOIN Vinhos.Vinho on Vinhos.VinhosAssociados.Vinho_ID=Vinhos.Vinho.ID where Vinhos.Enologos.NSocioEnologo=@ID );

GO
/****** Object:  UserDefinedFunction [Vinhos].[EnologoNames]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[EnologoNames](@ID int) returns table
as
	return(select Vinhos.Enologos.Nparticipacoes, Vinhos.Enologos.NSocioEnologo,Vinhos.Users.Nome,Vinhos.Users.DataNascimento,Vinhos.Users.NIF from Vinhos.Enologos join Vinhos.Users on Vinhos.Enologos.UserId=Vinhos.Users.NIF where Vinhos.Enologos.NSocioEnologo=@ID );

GO
/****** Object:  UserDefinedFunction [Vinhos].[GetDis]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[GetDis](@ID int) returns table
as 
	return(select * from Vinhos.Distribuidor where Vinhos.Distribuidor.ID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[GetDistQuinta]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [Vinhos].[GetDistQuinta](@ID int) returns table
as 
	return(select Vinhos.Distribui.DistribuiID, Vinhos.Distribuidor.Nome 
			from Vinhos.Distribui,Vinhos.Distribuidor 
			 where Vinhos.Distribui.DistribuiID=Vinhos.Distribuidor.ID and Vinhos.Distribui.QuintaID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[getQuintaByReg]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[getQuintaByReg] (@ID int) returns table 
as 
    return (Select Vinhos.Quinta.Nome, Vinhos.Quinta.ID from Vinhos.Quinta where Vinhos.Quinta.RegiaoID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[getRandom]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[getRandom](@ID int) returns table
as 
	return(Select Vinhos.Vinho.Nome from Vinhos.Vinho where Vinhos.Vinho.ID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[getRandomQuinta]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[getRandomQuinta](@ID int) returns table
as
    return (Select Nome,ID from Vinhos.Quinta where ID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[OwnerInfo]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[OwnerInfo](@ID INT) returns table
as 
	return(select * from Vinhos.Owner where Vinhos.Owner.ID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[QuintaInfo]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--################################################
-- Get all info from Quintas
--################################################
-- GO
-- CREATE PROCEDURE Vinhos.QuintaInfo(@ID int)
-- as
-- select Vinhos.Quinta.*,Vinhos.Regiao.Nome,Vinhos.Owner.Nome,Vinhos.Owner.ID from ((Vinhos.Quinta join Vinhos.Regiao on Vinhos.Quinta.RegiaoID=Vinhos.Regiao.ID) join Vinhos.OwnerShip on Vinhos.Quinta.ID = Vinhos.OwnerShip.Quinta_ID)
-- join Vinhos.Owner on Vinhos.OwnerShip.Owner_ID = Vinhos.Owner.ID
--  where Vinhos.Quinta.ID=@ID;
-- go

-- exec Vinhos.QuintaInfo 'ID';
create function [Vinhos].[QuintaInfo](@ID int) returns table
as 
	return(select Vinhos.Quinta.*,Vinhos.Regiao.Nome as RegiaoNome,Vinhos.Owner.Nome as OnwerNome,Vinhos.Owner.ID as OwnerID from ((Vinhos.Quinta join Vinhos.Regiao on Vinhos.Quinta.RegiaoID=Vinhos.Regiao.ID) join Vinhos.OwnerShip on Vinhos.Quinta.ID = Vinhos.OwnerShip.Quinta_ID)
join Vinhos.Owner on Vinhos.OwnerShip.Owner_ID = Vinhos.Owner.ID
 where Vinhos.Quinta.ID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[QuintaName]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[QuintaName]() returns table
as 
	return(select Nome,ID from Vinhos.Quinta);

GO
/****** Object:  UserDefinedFunction [Vinhos].[QuintasName]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[QuintasName]() returns table
as
    return (Select Nome,ID from Vinhos.Quinta);

GO
/****** Object:  UserDefinedFunction [Vinhos].[RegiaoInfo]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[RegiaoInfo](@ID INT) returns table
as 
	return(select * from Vinhos.Regiao where Vinhos.Regiao.ID=@ID);

GO
/****** Object:  UserDefinedFunction [Vinhos].[RegiaoName]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[RegiaoName]() returns table
as 
	return(select Nome,ID from Vinhos.Regiao);

GO
/****** Object:  UserDefinedFunction [Vinhos].[WineCaracteristics]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[WineCaracteristics]( @ID int) returns table
as 
	return(Select Vinhos.Vinho.*,Vinhos.Quinta.Nome as QuintaNome, Vinhos.Regiao.Nome as RegiaoNome from (Vinhos.Vinho join Vinhos.Quinta on Vinhos.Vinho.QuintaID = Vinhos.Quinta.ID) join Vinhos.Regiao on Vinhos.Vinho.RegiaoID = Vinhos.Regiao.ID  where Vinhos.Vinho.ID = @ID) ;

GO
/****** Object:  UserDefinedFunction [Vinhos].[WineList]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[WineList]() returns table 
as
	return(select Nome from Vinhos.Vinho);


GO
/****** Object:  UserDefinedFunction [Vinhos].[WineName]    Script Date: 07/06/2019 19:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [Vinhos].[WineName]() returns table
as 
	return(select Nome,ID from Vinhos.Vinho);

GO
SET IDENTITY_INSERT [Vinhos].[Castas] ON 

INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 1, N'Chardonnay é uma uva da família da Vitis vinifera, a partir da qual é fabricado vinho branco de qualidade.', N'Chardonnay')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 2, N'Uma casta de uva branca da família das vitis vinifera cultivada, de maneira geral, em todas as regiões', N'Arinto')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 3, N'Touriga Nacional é uma casta de uva tinta da família das Vitis Viniferas originária de Portugal.', N'Touriga Nacional')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 4, N'A Touriga Francesa é uma das principais castas utilizadas na produção de vinho do Porto.', N' TourigaFranca')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 5, N'Tempranillo é uma casta de uva tinta da família da Vitis vinifera, uma das castas mais conhecidas da Península Ibérica.', N'Tinta Roriz')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 6, N'Alvarinho é uma casta branca da espécie da Vitis vinifera originária de norte de Portugal. É a mais nobre das castas brancas portuguesas e produz um vinho de elevadíssima qualidade', N'Alvarinho')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 7, N'Cabernet sauvignon é uma casta de uvas da espécie Vitis vinifera a partir da qual é fabricado vinho. Originária da região de Bordeaux, no sudoeste da França, ela é a uva vinífera mais difundida no mundo, encontrando-se em todas as zonas temperadas e quentes.', N'Cabernet Sauvignon')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 8, N'Proporciona vinhos vibrantes e de acidez viva, refrescantes e com forte pendência mineral, e elevado potencial de guarda. A acidez firme será o principal cartão-de-visita da casta Arinto, garantindo-lhe a adjectivação de casta “melhorante” em muitas regiões portuguesas.', N'Loureiro')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 9, N'Fernão-Pires é uma casta de uva branca da família das vitis vinifera cultivada em diversas regiões de Portugal, nomeadamente na Bairrada, Estremadura, Ribatejo e Terras do Sado. Outras designações São Amaral, Gaeiro, Fernão Pirão', N'Fernao Pires')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 10, N'Origina vinhos macios, muito encorpados, ricos de cor e geralmente muito alcoólicos. Tem fraca acidez e aromas podendo conduzir a vinhos um tanto rústicos (Loureiro, 2005). O aroma é horizontal, ou seja, tem um acesso ao nariz lento, aveludado, delicado, como que pedindo que se mergulhe no seu interior. Esta sua característica aromática aberta e feminina contrasta bem com a da casta Roriz. O aroma floral aparece com mais frequência nos sítios mais húmidos e o aroma a frutos vermelhos em regiões mais quentes. O ataque na boca é aveludado, cheio, quente e terno (Almeida, 1990).', N'Tinta Barroca')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 11, N'A verdelho é uma variedade de uvas brancas, casta cultivada em todo o Portugal', N'Gouveio')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 12, N'É particularmente sensível ao oídio e moderadamente à podridão, míldio e desavinho, proporcionando rendimentos extremamente variáveis e inconsistentes. Os vinhos anunciam, por regra, sintomas melados, no nariz e boca, vagas notas de cera e noz-moscada, aliados a sensações fumadas, mesmo quando o vinho não sofre qualquer estágio em madeira', N'Malvasia Fina')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 13, NULL, N'Codega')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Branco', 14, N'Casta de vigor e produtividade médios, sendo sensível ao míldio e pouco sensível ao oídio e à podridão cinzenta. O cacho é grande e compacto, com bago de tamanho médio, arredondado, de cor amarelada, com película medianamente espessa, polpa suculenta.', N'Larinho')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 15, N'Vinhas velhas são responsáveis por produzir vinhos que expressam muito bem o terroir local, já que suas raízes atingem maior profundidade, uma diversidade maior de camadas do solo e carregam complexidade de compostos para as folhas e cachos e uvas. Mas isso não está ligado necessariamente a uma maior qualidade do produto final, de forma alguma.', N'Vinhas Velhas')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 16, N'Muito bem adaptada ao clima quente e seco do vale do Douro, a Tinto Cão é uma uva reconhecida por sua qualidade e pelo caráter apimentado. Seus cachos pequenos, o seu amadurecimento tardio, a cor verde-pálida das folhas da sua videira, a cor negra-azul dos seus bagos espessos, e sua película grossa e densa, que lhe garante alta resistência a ataques de doenças e podridão, são as características principais dessa nativa portuguesa.', N'Tinto Cão')
INSERT [Vinhos].[Castas] ([Aroma], [ID], [Descricao], [Nome]) VALUES (N'Tinto', 17, N'É a cor que singulariza e diferencia o Vinhão, de cachos de tamanho médio com bagos médios e uniformes de cor negro-azulada, produzindo vinhos pretos, escuros e opacos, fechados e quase impenetráveis à luz. Foram estas características tão peculiares que a tornaram tão apetecível no Douro, graças à necessidade de extrair rapidamente a cor para o Vinho do Porto. É a casta tinta mais cultivada na região do Vinho Verde, oferecendo vinhos rústicos, de acidez muito elevada, notórios pela acidez inquieta.', N'Vinhão')
SET IDENTITY_INSERT [Vinhos].[Castas] OFF
SET IDENTITY_INSERT [Vinhos].[Concursos] ON 

INSERT [Vinhos].[Concursos] ([Premiacoes], [ID], [CodigoConcurso]) VALUES (N'melhor tinto', 1, N'BACCHUS 2015')
INSERT [Vinhos].[Concursos] ([Premiacoes], [ID], [CodigoConcurso]) VALUES (N'melhor branco', 2, N'Berliner Wein Trophy 2015')
INSERT [Vinhos].[Concursos] ([Premiacoes], [ID], [CodigoConcurso]) VALUES (N'melhor rose', 3, N'Catavinum World Wine and Spirits Competition 2015')
INSERT [Vinhos].[Concursos] ([Premiacoes], [ID], [CodigoConcurso]) VALUES (N'melhor vinho', 4, N'Challenge International du Vin 2015')
INSERT [Vinhos].[Concursos] ([Premiacoes], [ID], [CodigoConcurso]) VALUES (N'melhor vinho', 5, N'Concours International des Vins Monde')
SET IDENTITY_INSERT [Vinhos].[Concursos] OFF
SET IDENTITY_INSERT [Vinhos].[Derivados] ON 

INSERT [Vinhos].[Derivados] ([Nome], [Descricao], [ID], [QuintaID]) VALUES (N'BACELO NOVO', N'Volume: 0,70L,Grau de álcool: 40º', 1, 1)
INSERT [Vinhos].[Derivados] ([Nome], [Descricao], [ID], [QuintaID]) VALUES (N'aguaArdente', N'Volume: 0,70L,Grau de álcool: 40º', 2, 2)
SET IDENTITY_INSERT [Vinhos].[Derivados] OFF
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (1, 1)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (2, 2)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (3, 3)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (4, 4)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (5, 5)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (6, 6)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (7, 7)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (8, 8)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (9, 9)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (10, 10)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (2, 11)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (3, 6)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (4, 7)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (1, 8)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (2, 9)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (10, 1)
INSERT [Vinhos].[Distribui] ([QuintaID], [DistribuiID]) VALUES (3, 2)
SET IDENTITY_INSERT [Vinhos].[Distribuidor] ON 

INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'HERITAGE WINES - DISTRIBUIÇÃO DE BEBIDAS, LDA', N'4400-088', 1)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'DECANTE - VINHOS, LDA', N'8365-307', 2)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'DECOV - DESTILAÇÃO E COMERCIO DE VINHOS, S.A.', N'4700-133', 3)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'DAVID DELAFORCE - VINHOS, LDA', N'4405-853', 4)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'ROTA VERDE - ASSOCIAÇÃO PARA O DESENVOLVIMENTO DA ROTA DOS VINHOS VERDES', N'4050-501', 5)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'RE - VINHOS E DERIVADOS, UNIPESSOAL, LDA', N'4960-341', 6)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'DGM ORGANOLEPTICS - COMÉRCIO E DISTRIBUIÇÃO DE VINHOS E DERIVADOS, UNIPESSOAL, LDA', N'4580-156', 7)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'CORAL DO DEUS MENINO DE FIGUEIRO DOS VINHOS', N'3260-407', 8)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'ESSÊNCIAS & DESEJOS - COMÉRCIO DE VINHOS, UNIPESSOAL, LDA', N'2630-380', 9)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'ASSOCIAÇÃO DESPORTIVA DE FIGUEIRÓ DOS VINHOS', N'3260-419', 10)
INSERT [Vinhos].[Distribuidor] ([Nome], [Adress], [ID]) VALUES (N'CAVES SANTA MARTA - VINHOS E DERIVADOS, C.R.L.', N'5030-477', 11)
SET IDENTITY_INSERT [Vinhos].[Distribuidor] OFF
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'José Gaspar              ', 5, 11111, N'12345678')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'João Silva e Sousa       ', 3, 11112, N'50114523')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Francisco Baptista       ', 6, 11113, N'11235204')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Patrícia Peixoto         ', 2, 11114, N'13453212')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Anselmo Mendes           ', 12, 11115, N'10022021')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Francisco Marques Leandro', 7, 11116, N'10022033')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Rui Walter Cunha         ', 15, 11117, N'10022044')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Ana Rola                 ', 12, 11118, N'12341421')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Hélder Cunha             ', 4, 11119, N'10022055')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Manuel Vieira            ', 3, 11120, N'12465123')
INSERT [Vinhos].[Enologos] ([Nome], [Nparticipacoes], [NSocioEnologo], [UserId]) VALUES (N'Luís Cabral de Almeida   ', 5, 11121, N'32132132')
SET IDENTITY_INSERT [Vinhos].[Owner] ON 

INSERT [Vinhos].[Owner] ([Nome], [Grupo], [Telefone], [ID], [UserID]) VALUES (N'Pedro Barreiro', N'Quinta da Barreira-Vitivinicultura', N'21757401', 1, N'50240197')
INSERT [Vinhos].[Owner] ([Nome], [Grupo], [Telefone], [ID], [UserID]) VALUES (N'João Silva e Sousa', N'Lua Cheia em Vinhas Velhas', N'21444455', 2, N'50114523')
INSERT [Vinhos].[Owner] ([Nome], [Grupo], [Telefone], [ID], [UserID]) VALUES (N'Anselmo Mendes', N'Anselmo Mendes Vinhos', N'21444466', 3, N'10022021')
INSERT [Vinhos].[Owner] ([Nome], [Grupo], [Telefone], [ID], [UserID]) VALUES (N'Francisco Marques Leandro', N'Casa Santa Eulália', N'21444477', 4, N'10022033')
INSERT [Vinhos].[Owner] ([Nome], [Grupo], [Telefone], [ID], [UserID]) VALUES (N'Rui Walter Cunha', N'Quinta de Paços', N'21444488', 5, N'10022044')
INSERT [Vinhos].[Owner] ([Nome], [Grupo], [Telefone], [ID], [UserID]) VALUES (N'Hélder Cunha', N'Casca Wines', N'21444499', 6, N'10022055')
SET IDENTITY_INSERT [Vinhos].[Owner] OFF
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (1, 1)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (2, 2)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (1, 3)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (3, 4)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (4, 5)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (5, 7)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (6, 8)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (2, 6)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (3, 9)
INSERT [Vinhos].[OwnerShip] ([Owner_ID], [Quinta_ID]) VALUES (5, 10)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 1)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 2)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 3)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 4)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 5)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 6)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 7)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 7)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 8)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 9)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 10)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 11)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 12)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 13)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 14)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 15)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 3)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (5, 4)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 9)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (4, 10)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (1, 2)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (1, 5)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (1, 15)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (1, 12)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (1, 8)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (2, 10)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (2, 14)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (2, 3)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (3, 4)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (3, 5)
INSERT [Vinhos].[Participa] ([CodigoConcurso], [VinhoId]) VALUES (3, 6)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (1, 1, 2)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (2, 1, 15)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (3, 1, 5)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (1, 2, 10)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (2, 2, 14)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (3, 2, 3)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (1, 3, 5)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (2, 3, 4)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (3, 3, 6)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (1, 4, 3)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (2, 4, 5)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (3, 4, 7)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (1, 5, 10)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (2, 5, 8)
INSERT [Vinhos].[Posicoes] ([PosicoesNu], [CodigoConcurso], [VinhoID]) VALUES (3, 5, 15)
SET IDENTITY_INSERT [Vinhos].[Quinta] ON 

INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Quinta da Barreira', N'casa123', 200, N'Fundada nos finais do século XIX, esta empresa de cariz familiar foi adquirida em 1954, mantendo-se a partir dessa data na posse da atual família', N'255111111', 1, 1)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Lua Cheia em Vinhas Velhas', N'cas231', 260, N'Lua Cheia em Vinhas Velhas is a result of the passion to display the individuality and character that the creators of this project have with the Douro region for more than two decades. After so many years of being surprised by this unique wine region, in 2009 the time arrived to show what they have been seeing in Douro wines. The company history began in that year with the production of white wines from Murça, an area forgotten by progress, but that produces unique wines with full identity. In 2010, work began on an investment in the winery in Martim, Douro, and in 2012, in the cradle of Alvarinho, Monção region. In 2013, a partnership was started in Alentejo, vinifying, in third party facilities, the grapes chosen and acquired in the region of Estremoz. In 2017, Lua Cheia has extended its presence into other Portuguese wine region – Dão.', N'255111122', 2, 2)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Casa de Santa Vitória', N'123asd2', 270, N'A Santa Vitória é uma empresa do Grupo Vila Galé focada na produção e comercialização de vinhos e azeites alentejanos de qualidade superior.', N'255111222', 3, 3)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Anselmo Mendes Vinhos', N'oooo123', 400, N'Foi com a casta Alvarinho em Monção e Melgaço, que Anselmo Mendes começou a produzir, em 1998. A adega, na zona do Vale do Minho, é um espaço de experimentação e investigação, a partir de onde a paixão de Anselmo Mendes pelo vinho e pela região ganha forma e gosto. É um lugar de reinvenção, para fazer de cada vinho uma expressão da terra elevada à sua forma mais sublime, um traço cultural, um rasgo de carácter.', N'255111333', 4, 4)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Casa Santa Eulália', N'dsa12', 200, N'criada no séc. XVII, situa-se em Atei, Mondim de Basto, região de vinho verde. 38 hectares de vinhas para Viticultura e Enoturismo.', N'255111444', 5, 5)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Quinta das Parcelas', N'kaskk23', 250, N'Virada a Nascente/SE, esta jovem Quinta fica situada no vale da Régua na margem direita do rio Douro na Região Demarcada do Douro - Baixo Corgo, captando soberba vista para a cidade e rio Douro', N'255123111', 6, 2)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Quinta de Paços', N'asd12', 199, N'A Quinta de Paços Sociedade Agrícola, Lda. é uma empresa familiar que explora o seu património agrícola procurando produzir vinhos de alta qualidade com uma personalidade distinta, resultante duma especial ênfase no seu carácter natural e autêntico.', N'255111555', 7, 5)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Casca Wines', N'dawe1', 100, N'Tudo começou na micro-região de Colares. Na serra de Sintra, o ponto mais ocidental da Europa continental, onde grandes produtores de vinho foram desafiados pelos ventos atlânticos por mais de 900 anos. Hélder Cunha decidiu produzir vinhos verdadeiramente únicos, unindo a história com qualidade.', N'255111666', 8, 2)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Quinta de Cottas', N'asdasd2', 180, N'A Quinta de Cottas dedica-se à produção de vinhos de elevada qualidade e com forte personalidade. A Quinta de Cottas, com uma área de 10 ha, localizada na Região Demarcada do Douro, no Cima Corgo, tem as suas vinhas povoadas com as tradicionais castas do Douro por forma a preservar o património genético da região. Beneficiando de uma excelente exposição solar, as suas velhas cepas plantadas nos solos xistosos do Douro, oferecem uvas de um perfil e carácter únicos.', N'255255255', 9, 2)
INSERT [Vinhos].[Quinta] ([Nome], [Morada], [TamanhoProducao], [Descricao], [Telefone], [ID], [RegiaoID]) VALUES (N'Herdade do Peso', N'alentejo', 200, N'A Herdade do Peso acolhe uma barragem, que ocupa uma área de 20 hectares e cuja água é preciosa para o sistema de rega da vinha e de um extenso olival. A Herdade do Peso está situada em Pedrogão, no concelho da Vidigueira - designação associada à abundância de videiras, tal a importância que essa cultura tem tido ao longo dos tempos na região. A Herdade do Peso ocupa uma área total de 465 hectares. Atualmente encontram-se plantados 120 hectares, sendo 112 hectares de uvas (Aragonez, Alicante Bouschet, Syrah, Touriga Nacional, Petit Verdot e Cabernet Sauvignon) e oito hectares de uvas brancas (Antão Vaz, Arinto e Chardonnay). Antes de adquirir a Herdade do Peso, a Sogrape Vinhos comprava já desde 1992 as uvas da propriedade ao anterior proprietário, um familiar de Fernando Guedes.', N'255123421', 10, 3)
SET IDENTITY_INSERT [Vinhos].[Quinta] OFF
SET IDENTITY_INSERT [Vinhos].[Regiao] ON 

INSERT [Vinhos].[Regiao] ([Solo], [Clima], [Nome], [Codigo], [ID]) VALUES (N'normal', N'quente', N'Reg. Lisboa', N'2565-136', 1)
INSERT [Vinhos].[Regiao] ([Solo], [Clima], [Nome], [Codigo], [ID]) VALUES (N'rochoso', N'ameno', N'DOC Douro', N'5110-214 ', 2)
INSERT [Vinhos].[Regiao] ([Solo], [Clima], [Nome], [Codigo], [ID]) VALUES (N'argiloso', N'quente', N'Alentejo', N'7900-573', 3)
INSERT [Vinhos].[Regiao] ([Solo], [Clima], [Nome], [Codigo], [ID]) VALUES (N'normal', N'frio', N'Monção e Melgaço', N'4950-483', 4)
INSERT [Vinhos].[Regiao] ([Solo], [Clima], [Nome], [Codigo], [ID]) VALUES (N'rochoso', N'ameno', N'Regional Minho', N'4850-481', 5)
SET IDENTITY_INSERT [Vinhos].[Regiao] OFF
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11111, 4)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11112, 4)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11113, 4)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11114, 4)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11115, 4)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11116, 5)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11117, 5)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11118, 5)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11119, 4)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11120, 4)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11121, 1)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11111, 2)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11112, 2)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11113, 2)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11114, 2)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11115, 1)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11116, 1)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11117, 1)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11118, 2)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11116, 3)
INSERT [Vinhos].[SaoJuri] ([SocioEnologo], [ConcursoID]) VALUES (11117, 3)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (1, 1)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (1, 2)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (2, 3)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (2, 4)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (2, 5)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (4, 6)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (5, 3)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (5, 7)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (7, 6)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (7, 2)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (7, 8)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (7, 9)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (8, 3)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (8, 4)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (8, 5)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (8, 10)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (10, 11)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (10, 12)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (10, 13)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (10, 14)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (11, 15)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (12, 3)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (12, 4)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (12, 16)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (13, 3)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (14, 3)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (14, 4)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (14, 5)
INSERT [Vinhos].[Tem] ([VinhoId], [CastasID]) VALUES (15, 17)
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Anselmo Mendes', CAST(N'1966-11-02' AS Date), N'oas12', N'asda1', N'10022021')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Francisco Marques Leandro', CAST(N'1956-09-11' AS Date), N'12sada', N'asd124', N'10022033')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Rui Walter Cunha', CAST(N'1987-10-01' AS Date), N'dasdq21', N'sadq21', N'10022044')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Hélder Cunha', CAST(N'1956-09-11' AS Date), N'qweqw', N'qeqweeq', N'10022055')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Francisco Baptista', CAST(N'1965-06-12' AS Date), N'ola123', N'asda1', N'11235204')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Ana Rola ', CAST(N'1966-11-02' AS Date), N'aw1231', N'asd123', N'12341421')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'José Gaspar', CAST(N'1997-01-10' AS Date), N'ola123', N'zsdasd', N'12345678')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Manuel Vieira', CAST(N'1967-11-02' AS Date), N'asd1q23', N'qeqweeq', N'12465123')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Patrícia Peixoto', CAST(N'1977-11-02' AS Date), N'ola123', N'asd124', N'13453212')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Luís Cabral de Almeida', CAST(N'1987-10-01' AS Date), N'	ola123', N'asda1', N'32132132')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'João Silva e Sousa', CAST(N'1956-09-11' AS Date), N'ola123', N'asdasd', N'50114523')
INSERT [Vinhos].[Users] ([Nome], [DataNascimento], [Pass], [Salt], [NIF]) VALUES (N'Pedro Barreiro', CAST(N'1967-11-02' AS Date), N'ola123', N'asdasd', N'50240197')
SET IDENTITY_INSERT [Vinhos].[Vinho] ON 

INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'BACELO NOVO BRANCO 2015', 12, CAST(3.90 AS Decimal(5, 2)), 6, N'Cor citrino claro.', N'Como aperitivo', 1, N'10/12ºC', 1, 1)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'BACELO NOVO TINTO 2014', 13, CAST(3.90 AS Decimal(5, 2)), 7, N'Cor rubi intenso com laivos', N'com bacalhau no forno', 2, N'15/17ºC', 2, 2)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'BACELO NOVO TINTO 2015', 14, CAST(3.90 AS Decimal(5, 2)), 5, N'Cor rubi. Aromas intensos', N'com carnes vermelhas', 3, N'15/17ºC', 3, 3)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'ALVARINHO 2016', 12, CAST(7.00 AS Decimal(5, 2)), 9, N'Cor amarelo citrino. Aromas cítricos e de frutas tropicais. Na boca apresenta-se fresco e pleno de mineralidade. Encorpado, bom volume e equilíbrio e com uma acidez vibrante a dar-lhe frescura.Final longo e com grande complexidade típico da casta Alvarinho.', N'como aperitivo ou com canapés, marisco, peixes diversos, queijos e pratos de aves.', 4, N'8/10ºC', 4, 4)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'QUINTA DA BARREIRA RESERVA TINTO 2015', 14, CAST(5.90 AS Decimal(5, 2)), 4, N'Cor rubi fechado. Aroma com boa intensidade, complexo. Notas de frutos vermelhos, pretos e pimento verde. Na boca apresenta-se jovem, com taninos firmes mas com bom corpo e estrutura. Equilibrado. Final longo.', N'com assados, carnes vermelhas e queijos fortes. Agradece decantação.', 5, N'18ºC', 1, 1)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'CASA SANTA EULÁLIA SUPERIOR ALVARINHO 2016', 12, CAST(7.00 AS Decimal(5, 2)), 6, N'Cor amarelo citrino. Aroma de boa intensidade, frutado e floral com notas tropicais. A boca confirma a fruta mostrando-se fresco e equilibrado. Final persistente.', N'com mariscos, peixes e carnes brancas.', 6, N'8/10ºC', 5, 5)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'CASA DE PAÇOS SUPERIOR 2015', 12, CAST(7.75 AS Decimal(5, 2)), 7, N'Cor límpida, amarelo-citrino.Aroma limpo e fresco, notas de citrinos, frutos tropicais e um toque mineral. Na boca a boa acidez dá-lhe frescura, boa fruta. Final longo.', N' com mariscos e peixes', 7, N'9/10ºC', 5, 7)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'NOMEVINHO MILHAFRE NEGRO RESERVA 2014', 13, CAST(8.55 AS Decimal(5, 2)), 8, N'Cor rubi escuro. Aroma jovem, fruta fresca com um ligeiro toque de madeira. Na boca é suave, bem estruturado e equilibrado. Boa acidez. Final persistente.', N' com queijos, enchidos, caça e carnes vermelhas assadas.', 8, N'16/18ºC', 2, 6)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'ALVARINHO CONTACTO 2016', 13, CAST(9.50 AS Decimal(5, 2)), 8, N'Cor amarelo-citrino.Aroma intenso, complexo e fresco, notas cítricas com algum mineral e um toque tropical. Excelente na boca, muito bem equilibrado, com boa estrutura e volume. Boa acidez e belas notas minerais. Bom final.	', N'como aperitivo ou com canapés, marisco, peixes diversos, queijos e pratos de aves.', 9, N'8/10ºC', 5, 4)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'CASCAS 2016', 12, CAST(4.20 AS Decimal(5, 2)), 5, N'Cor amarelo-citrino. Boa intensidade aromática, aroma frutado com leves notas florais. Na boca é equilibrado com uma boa acidez a dar-lhe frescura.', N' com carnes brancas, aves de capoeira, massas condimentadas e queijos suaves.', 10, N'14/16ºC', 2, 8)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'NOMEVINHO LUA CHEIA EM VINHAS VELHAS RESERVA ESPECIAL 2014', 13, CAST(8.40 AS Decimal(5, 2)), 8, N'Cor vermelho profundo. Aroma muito intenso e poderoso mas fresco, notas de bergamota, frutos do bosque (mirtilo e amora preta) e de boa madeira. Na boca é estruturado mas elegante, fresco e bem equilibrado. Final longo com notas florais e de frutos do bosque.', N'Com carnes vermelhas, caça e pratos condimentados, cozinha regional e mediterrânica.', 11, N'16/18ºC', 2, 2)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'NOMEVINHO COTTAS 2013', 13, CAST(7.00 AS Decimal(5, 2)), 7, N'Aromas frescos bem presentes de groselha preta e canela torrada. Macio na boca com taninos elegantes. Bom volume e  Final persistente com a presença da fruta.', N'Com massas, aves, carnes brancas e vermelhas.', 12, N'16º C', 2, 9)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'NOMEVINHO SOSSEGO ROSÉ 2016', 12, CAST(5.00 AS Decimal(5, 2)), 9, N'Cor rosa-cereja, aroma intenso a cereja e frutos vermelhos. Na boca apresenta-se, fresco, equilibrado. Final longo.', N'Com saladas e massas.', 13, N'8/10ºC', 3, 10)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'NOMEVINHO MONTE CASCAS 2016', 12, CAST(5.75 AS Decimal(5, 2)), 6, N'Cor rosa claro (pétala de rosa). Aroma levemente frutado com notas florais. Na boca é fresco com notas de frutos vermelhos. Final agradável.', N'Sozinho ou acompanhando aperitivos, mariscos, pratos de peixe, massas e queijos suaves.', 14, N'10/12ºC', 2, 8)
INSERT [Vinhos].[Vinho] ([Nome], [PercentagemAlcool], [Preco], [Avaliacao], [Descricao], [InfoNutricional], [ID], [TemperaturaServir], [RegiaoID], [QuintaID]) VALUES (N'NOMEVINHO PLAINAS VINHÃO GRANDE ESCOLHA 2016', 13, CAST(4.70 AS Decimal(5, 2)), 5, N'Cor granada intensa, quase opaca. Aroma de frutos pretos maduros. Na boca é a acidez dá-lhe frescura, intenso e equilibrado. Final persistente.', N'Com pratos de carnes vermelhas e da cozinha regional minhota.', 15, N'12/14ºC', 2, 5)
SET IDENTITY_INSERT [Vinhos].[Vinho] OFF
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11111, 1)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11112, 2)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11113, 3)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11114, 3)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11115, 4)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11111, 4)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11116, 5)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11115, 5)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11117, 7)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11115, 9)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11118, 8)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11112, 11)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11113, 11)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11112, 12)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11120, 12)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11121, 13)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11119, 14)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11115, 15)
INSERT [Vinhos].[VinhosAssociados] ([Enologo_ID], [Vinho_ID]) VALUES (11116, 15)
ALTER TABLE [Vinhos].[Derivados]  WITH CHECK ADD FOREIGN KEY([QuintaID])
REFERENCES [Vinhos].[Quinta] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Distribui]  WITH CHECK ADD FOREIGN KEY([DistribuiID])
REFERENCES [Vinhos].[Distribuidor] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Distribui]  WITH CHECK ADD FOREIGN KEY([QuintaID])
REFERENCES [Vinhos].[Quinta] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Enologos]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [Vinhos].[Users] ([NIF])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Owner]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [Vinhos].[Users] ([NIF])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[OwnerShip]  WITH CHECK ADD FOREIGN KEY([Owner_ID])
REFERENCES [Vinhos].[Owner] ([ID])
GO
ALTER TABLE [Vinhos].[OwnerShip]  WITH CHECK ADD FOREIGN KEY([Quinta_ID])
REFERENCES [Vinhos].[Quinta] ([ID])
GO
ALTER TABLE [Vinhos].[Participa]  WITH CHECK ADD FOREIGN KEY([CodigoConcurso])
REFERENCES [Vinhos].[Concursos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Participa]  WITH CHECK ADD FOREIGN KEY([VinhoId])
REFERENCES [Vinhos].[Vinho] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Posicoes]  WITH CHECK ADD FOREIGN KEY([CodigoConcurso])
REFERENCES [Vinhos].[Concursos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Posicoes]  WITH CHECK ADD FOREIGN KEY([VinhoID])
REFERENCES [Vinhos].[Vinho] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Quinta]  WITH CHECK ADD FOREIGN KEY([RegiaoID])
REFERENCES [Vinhos].[Regiao] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[SaoJuri]  WITH CHECK ADD FOREIGN KEY([ConcursoID])
REFERENCES [Vinhos].[Concursos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[SaoJuri]  WITH CHECK ADD FOREIGN KEY([SocioEnologo])
REFERENCES [Vinhos].[Enologos] ([NSocioEnologo])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Tem]  WITH CHECK ADD FOREIGN KEY([CastasID])
REFERENCES [Vinhos].[Castas] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Tem]  WITH CHECK ADD FOREIGN KEY([VinhoId])
REFERENCES [Vinhos].[Vinho] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[Vinho]  WITH CHECK ADD FOREIGN KEY([QuintaID])
REFERENCES [Vinhos].[Quinta] ([ID])
GO
ALTER TABLE [Vinhos].[Vinho]  WITH CHECK ADD FOREIGN KEY([RegiaoID])
REFERENCES [Vinhos].[Regiao] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[VinhosAssociados]  WITH CHECK ADD FOREIGN KEY([Enologo_ID])
REFERENCES [Vinhos].[Enologos] ([NSocioEnologo])
ON DELETE CASCADE
GO
ALTER TABLE [Vinhos].[VinhosAssociados]  WITH CHECK ADD FOREIGN KEY([Vinho_ID])
REFERENCES [Vinhos].[Vinho] ([ID])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [Vinhos].[CastaRelationTem]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Vinhos].[CastaRelationTem](@VinhoID int,@Aroma varchar(60), @Descricao varchar(800), @Nome varchar(60))
as 
	declare @CastaID int;
	BEGIN  
	insert into Vinhos.Castas(Aroma, Descricao, Nome) values(@Aroma , @Descricao, @Nome) 
	Set @CastaID=( SELECT max(Vinhos.Castas.ID) FROM Vinhos.Castas);
	insert into Vinhos.Tem(VinhoId, CastasID) values(@VinhoID , @CastaID) 
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[ConcursoPremios]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vinhos].[ConcursoPremios](@ID int)
as 
	select Vinhos.Concursos.*, Vinhos.Posicoes.PosicoesNu,Vinhos.Vinho.Nome as VinhoNome,Vinhos.Vinho.ID as VinhoID from Vinhos.Concursos join Vinhos.Posicoes on Vinhos.Concursos.ID=Vinhos.Posicoes.CodigoConcurso join Vinhos.Vinho on Vinhos.Vinho.ID=Vinhos.Posicoes.VinhoID where Vinhos.Concursos.ID=@ID order by Vinhos.Posicoes.PosicoesNu asc;

GO
/****** Object:  StoredProcedure [Vinhos].[DeleteCasta]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--################################################
-- Delete Casta and relation
--################################################
create procedure [Vinhos].[DeleteCasta](@ID int)
as 
	BEGIN  
	DELETE FROM Vinhos.Tem WHERE CastasID = @ID;
	DELETE FROM Vinhos.Castas WHERE ID = @ID;  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[DeleteCastaWineAssociation]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Vinhos].[DeleteCastaWineAssociation](@WineID int, @CastaID int)
as 
	BEGIN  
	DELETE FROM Vinhos.Tem WHERE CastasID = @CastaID and VinhoId=@WineID ;
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[DeleteQuinta]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--################################################
-- Delete Quinta
--################################################
create procedure [Vinhos].[DeleteQuinta](@ID int)
as 
	BEGIN  
	DELETE FROM Vinhos.Quinta where ID=@ID 
	DELETE FROM Vinhos.OwnerShip where Vinhos.OwnerShip.Quinta_ID =@ID   
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[DeleteRegiao]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--################################################
-- Delete Regiao
--################################################
create procedure [Vinhos].[DeleteRegiao](@ID int)
as 
	BEGIN 
	DELETE FROM Vinhos.Regiao WHERE ID = @ID;  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[DeleteVinho]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--################################################
--Delete Wines
--################################################
create procedure [Vinhos].[DeleteVinho](@ID int )
as 
	BEGIN  
	DELETE FROM Vinhos.Vinho where ID=@ID  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[InsertCasta]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Vinhos].[InsertCasta](@Aroma varchar(60), @Descricao varchar(800), @Nome varchar(60))
as 
	BEGIN  
	insert into Vinhos.Castas(Aroma, Descricao, Nome) values(@Aroma , @Descricao, @Nome)  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[InsertEnologos]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Vinhos].[InsertEnologos](@Name varchar(60), @Nparticipacoes int, @NSocioEnologo int,@UserId int)
as 
	BEGIN  
	insert into Vinhos.Enologos(Nome,Nparticipacoes,NSocioEnologo,UserId) values(@Name , @Nparticipacoes,@NSocioEnologo,@UserId)  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[InsertQuinta]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec Vinhos.InsertRegiao 'ola','ola','ola','ola'
-- exec Vinhos.DeleteRegiao 9
-- go
--################################################
-- Insert Quinta
--################################################
create procedure [Vinhos].[InsertQuinta](@Nome varchar(60),@Morada varchar(60),@TamanhoProducao int,@Descicao varchar(1000), @Telefone varchar(9), @RegiaoID int)
as 
	BEGIN  
	insert into Vinhos.Quinta(Nome,Morada, TamanhoProducao,Descricao,Telefone,RegiaoID) values(@Nome,@Morada,@TamanhoProducao,@Descicao, @Telefone, @RegiaoID)  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[InsertRegiao]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--################################################
-- Insert Regiao
--################################################
create procedure [Vinhos].[InsertRegiao](@Solo varchar(60),@Clima varchar(60),@Nome varchar(60), @Codigo varchar(9))
as 
	BEGIN  
	insert into Vinhos.Regiao(Solo, Clima, Nome,Codigo) values(@Solo , @Clima, @Nome,@Codigo)  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[InsertTem]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--################################################
-- Insert Relation Wine and casta
--################################################
create procedure [Vinhos].[InsertTem](@VinhoID int, @CastaID int)
as 
	BEGIN  
	insert into Vinhos.Tem(VinhoId, CastasID) values(@VinhoID , @CastaID)  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[InsertVinho]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Vinhos].[InsertVinho](@Nome varchar(60),@PercentagemAlcool int,@Preco decimal, @Avaliacao int,@Descricao varchar(500),@InfoNutricional varchar(200),@TemperaturaServir varchar(7),@RegiaoID int, @QuintaID int )
as 
	BEGIN  
	insert into Vinhos.Vinho(Nome,PercentagemAlcool,Preco,Avaliacao,Descricao,InfoNutricional,TemperaturaServir,RegiaoID,QuintaID) values(@Nome,@PercentagemAlcool,@Preco, @Avaliacao,@Descricao,@InfoNutricional,@TemperaturaServir,@RegiaoID, @QuintaID)  
	END                   

GO
/****** Object:  StoredProcedure [Vinhos].[UpdateQuinta]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vinhos].[UpdateQuinta](@Nome varchar(60),@Morada varchar(60),@TamanhoProducao int,@Descicao varchar(1000), @Telefone varchar(9), @RegiaoID int, @ID int)
as
	update Vinhos.Quinta set Nome=@Nome,Morada=@Morada, TamanhoProducao=@TamanhoProducao,Descricao=@Descicao,Telefone=@Telefone,RegiaoID=@RegiaoID where ID=@ID;

GO
/****** Object:  StoredProcedure [Vinhos].[UpdateRegiao]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vinhos].[UpdateRegiao](@Solo varchar(60),@Clima varchar(60),@Nome varchar(60), @Codigo varchar(9), @ID int)
as
	update Vinhos.Regiao set Solo=@Solo, Clima=@Clima, Nome=@Nome,Codigo=@Codigo where ID=@ID;

GO
/****** Object:  StoredProcedure [Vinhos].[UpdateVinho]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vinhos].[UpdateVinho](@ID int,@Nome varchar(60),@PercentagemAlcool int,@Preco decimal, @Avaliacao int,@Descricao varchar(500),@InfoNutricional varchar(200),@TemperaturaServir varchar(7),@RegiaoID int, @QuintaID int)
as
	update Vinhos.Vinho SET Nome=@Nome,PercentagemAlcool=@PercentagemAlcool,Preco=@Preco,Avaliacao=@Avaliacao,Descricao=@Descricao,InfoNutricional=@InfoNutricional, TemperaturaServir=@TemperaturaServir,RegiaoID=@RegiaoID,QuintaID=@QuintaID	 WHERE ID = @ID;

GO
/****** Object:  Trigger [Vinhos].[ValidateEnologo]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Vinhos].[ValidateEnologo] ON [Vinhos].[Enologos]
INSTEAD OF UPDATE,INSERT
as
begin
	Select *
	Into   #Temp
	From   inserted

	WHILE (SELECT count(*) FROM #Temp) >0
	begin
		DECLARE @NSocioEnologo as int;
		SELECT TOP 1 @NSocioEnologo = NSocioEnologo FROM #Temp;
		if  (SELECT count(*) FROM Vinhos.Enologos WHERE Vinhos.Enologos.NSocioEnologo=@NSocioEnologo) > 0
		begin
			DELETE #TEMP WHERE NSocioEnologo=@NSocioEnologo;
			RAISERROR('Enologo ALREADY HAVE THIS Number of partner', 16, 1);
		end
		ELSE
		begin
			insert into Vinhos.Enologos SELECT * FROM #TEMP WHERE NSocioEnologo=@NSocioEnologo;
			DELETE #TEMP WHERE NSocioEnologo=@NSocioEnologo;
		end
	end	
end

GO
/****** Object:  Trigger [Vinhos].[ValidateTem]    Script Date: 07/06/2019 19:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Vinhos].[ValidateTem] ON [Vinhos].[Tem]
INSTEAD OF UPDATE,INSERT
as
begin
	Select *
	Into   #Temp
	From   inserted

	WHILE (SELECT count(*) FROM #Temp) >0
	begin
		DECLARE @CastaID as int;
		DECLARE @VinhoID as int;
		SELECT TOP 1 @CastaID = CastasID FROM #Temp;
		Select top 1 @VinhoID = VinhoID FROM #Temp
		if  (SELECT count(*) FROM Vinhos.Tem WHERE Vinhos.Tem.CastasID=@CastaID and Vinhos.Tem.VinhoId=@VinhoID) > 0
		begin
			DELETE #TEMP WHERE CastasID=@CastaID and VinhoId=@VinhoID;
			RAISERROR('We already have that realtion', 16, 1);
		end
		ELSE
		begin
			insert into Vinhos.Tem SELECT * FROM #TEMP WHERE CastasID=@CastaID and VinhoId=@VinhoID;
			DELETE #TEMP WHERE CastasID=@CastaID and VinhoId=@VinhoID;
		end
	end	
end

GO
USE [master]
GO
ALTER DATABASE [p8g6] SET  READ_WRITE 
GO

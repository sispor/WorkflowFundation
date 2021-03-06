USE [master]
GO
/****** Object:  Database [CoreToWorkflow]    Script Date: 8/24/2018 12:32:40 PM ******/
CREATE DATABASE [CoreToWorkflow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoreToWorkflow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CoreToWorkflow.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoreToWorkflow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CoreToWorkflow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CoreToWorkflow] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoreToWorkflow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoreToWorkflow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoreToWorkflow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoreToWorkflow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoreToWorkflow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoreToWorkflow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoreToWorkflow] SET  MULTI_USER 
GO
ALTER DATABASE [CoreToWorkflow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoreToWorkflow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoreToWorkflow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoreToWorkflow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoreToWorkflow] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoreToWorkflow] SET QUERY_STORE = OFF
GO
USE [CoreToWorkflow]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CoreToWorkflow]
GO
/****** Object:  Table [dbo].[tableEstatus]    Script Date: 8/24/2018 12:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableEstatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[idTableWorkflow] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_TableEstatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableTasks]    Script Date: 8/24/2018 12:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskFunction] [nvarchar](500) NULL,
	[IdTableEstatus] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[IdTableWorkflow] [int] NULL,
 CONSTRAINT [PK_tableTasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableTracks]    Script Date: 8/24/2018 12:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableTracks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrentTime] [nvarchar](500) NULL,
	[IdTableWorkflow] [int] NULL,
 CONSTRAINT [PK_tableTrack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableWorkflow]    Script Date: 8/24/2018 12:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableWorkflow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Duration] [time](7) NULL,
 CONSTRAINT [PK_TableWorkflow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tableEstatus] ON 

INSERT [dbo].[tableEstatus] ([Id], [idTableWorkflow], [Name], [Description]) VALUES (1, 1, N'nivel1', N'tareas para las aprobaciones de cursos inscritos')
SET IDENTITY_INSERT [dbo].[tableEstatus] OFF
SET IDENTITY_INSERT [dbo].[tableTasks] ON 

INSERT [dbo].[tableTasks] ([Id], [TaskFunction], [IdTableEstatus], [Description], [IdTableWorkflow]) VALUES (1, N'Funcion1', 1, NULL, 1)
INSERT [dbo].[tableTasks] ([Id], [TaskFunction], [IdTableEstatus], [Description], [IdTableWorkflow]) VALUES (2, N'Funcion2', 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[tableTasks] OFF
SET IDENTITY_INSERT [dbo].[tableTracks] ON 

INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (26, N'momento del Fin: 01/06/2018 15:59:00 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (27, N'momento del Fin: 01/06/2018 15:59:00 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (28, N'momento del Fin: 01/06/2018 15:59:53 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (29, N'momento del Fin: 01/06/2018 15:59:53 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (30, N'momento del Fin: 01/06/2018 16:00:20 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (31, N'momento del Fin: 01/06/2018 16:00:20 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (32, N'momento del Fin: 01/06/2018 16:05:28 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (33, N'momento del Fin: 01/06/2018 16:05:28 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (34, N'momento del Fin: 01/06/2018 16:10:28 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (35, N'momento del Fin: 01/06/2018 16:10:28 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (36, N'momento del Fin: 01/06/2018 16:15:39 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (37, N'momento del Fin: 01/06/2018 16:15:39 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (38, N'momento del Fin: 01/06/2018 16:16:19 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (39, N'momento del Fin: 01/06/2018 16:16:19 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (40, N'momento del Fin: 01/06/2018 16:17:04 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (41, N'momento del Fin: 01/06/2018 16:17:04 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (42, N'momento del Fin: 01/06/2018 16:25:05 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (43, N'momento del Fin: 01/06/2018 16:26:59 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (44, N'momento del Fin: 01/06/2018 16:27:51 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (45, N'momento del Fin: 01/06/2018 16:27:51 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (46, N'momento del Fin: 01/06/2018 16:28:31 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (47, N'momento del Fin: 01/06/2018 16:28:31 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (48, N'momento del Fin: 01/06/2018 16:30:13 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (49, N'momento del Fin: 01/06/2018 16:30:13 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (50, N'momento del Fin: 01/06/2018 16:51:00 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (51, N'momento del Fin: 01/06/2018 16:51:39 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (52, N'momento del Fin: 01/06/2018 16:53:16 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (53, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (54, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (55, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (56, N'momento del Fin: 01/06/2018 17:00:08 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (57, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (58, N'momento del Fin: 01/06/2018 17:00:25 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (59, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (60, N'momento del Fin: 01/06/2018 17:03:50 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (61, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (62, N'momento del Fin: 01/06/2018 17:04:07 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (63, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (64, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (65, N'momento del Fin: 01/06/2018 17:06:06 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (66, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (67, N'momento del Fin: 01/06/2018 17:10:55 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (68, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (69, N'momento del Fin: 01/06/2018 17:11:53 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (70, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (71, N'momento del Fin: 01/06/2018 17:13:05 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (72, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (73, N'momento del Fin: 01/06/2018 17:15:00 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (74, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (75, N'momento del Fin: 01/06/2018 17:16:27 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (76, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (77, N'momento del Fin: 01/06/2018 17:17:26 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (78, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (79, N'momento del Fin: 01/06/2018 17:21:36 duración: 0.00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (80, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (81, N'momento del Fin: 01/06/2018 17:31:37 duración: 00:00:05', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (82, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (83, N'momento del Fin: 01/06/2018 17:32:11 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (84, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (85, N'momento del Fin: 01/06/2018 17:33:26 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (86, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (87, N'momento del Fin: 01/06/2018 17:33:54 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (88, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (89, N'momento del Fin: 01/06/2018 17:55:53 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (90, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (91, N'momento del Fin: 01/06/2018 17:58:46 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (92, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (93, N'momento del Fin: 01/06/2018 18:01:08 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (94, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (95, N'momento del Fin: 04/06/2018 9:55:46 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (96, NULL, 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (97, N'momento del Fin: 04/06/2018 9:56:47 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (98, N'momento del Fin: 04/06/2018 9:57:43 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (99, N'momento del Fin: 04/06/2018 9:57:43 duración: 00:00:01', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (100, N'momento del Fin: 04/06/2018 9:58:19 duración: 00:00:03', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (101, N'momento del Fin: 04/06/2018 9:58:19 duración: 00:00:03', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (102, N'momento del Fin: 04/06/2018 9:59:53 duración: 00:01:00', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (103, N'momento del Fin: 04/06/2018 9:59:53 duración: 00:01:00', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (104, N'04/06/2018 10:02:50', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (105, N'04/06/2018 10:02:50', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (106, N'04/06/2018 10:10:49', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (107, N'04/06/2018 10:10:49', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (108, N'11/06/2018 12:14:59', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (109, N'11/06/2018 12:16:10', 1)
INSERT [dbo].[tableTracks] ([Id], [CurrentTime], [IdTableWorkflow]) VALUES (110, N'11/06/2018 12:16:10', 1)
SET IDENTITY_INSERT [dbo].[tableTracks] OFF
SET IDENTITY_INSERT [dbo].[tableWorkflow] ON 

INSERT [dbo].[tableWorkflow] ([Id], [Name], [Description], [Duration]) VALUES (1, N'Workflowsigecap', N'funciones para la aprobación de cursos inscriptos por alumno', CAST(N'00:00:05' AS Time))
SET IDENTITY_INSERT [dbo].[tableWorkflow] OFF
ALTER TABLE [dbo].[tableEstatus]  WITH CHECK ADD  CONSTRAINT [FK_TableEstatus_TableWorkflow] FOREIGN KEY([idTableWorkflow])
REFERENCES [dbo].[tableWorkflow] ([Id])
GO
ALTER TABLE [dbo].[tableEstatus] CHECK CONSTRAINT [FK_TableEstatus_TableWorkflow]
GO
ALTER TABLE [dbo].[tableTasks]  WITH CHECK ADD  CONSTRAINT [FK_tableTasks_TableEstatus] FOREIGN KEY([IdTableEstatus])
REFERENCES [dbo].[tableEstatus] ([Id])
GO
ALTER TABLE [dbo].[tableTasks] CHECK CONSTRAINT [FK_tableTasks_TableEstatus]
GO
ALTER TABLE [dbo].[tableTasks]  WITH CHECK ADD  CONSTRAINT [FK_tableTasks_TableWorkflow] FOREIGN KEY([IdTableWorkflow])
REFERENCES [dbo].[tableWorkflow] ([Id])
GO
ALTER TABLE [dbo].[tableTasks] CHECK CONSTRAINT [FK_tableTasks_TableWorkflow]
GO
ALTER TABLE [dbo].[tableTracks]  WITH CHECK ADD  CONSTRAINT [FK_tableTrack_TableWorkflow] FOREIGN KEY([IdTableWorkflow])
REFERENCES [dbo].[tableWorkflow] ([Id])
GO
ALTER TABLE [dbo].[tableTracks] CHECK CONSTRAINT [FK_tableTrack_TableWorkflow]
GO
USE [master]
GO
ALTER DATABASE [CoreToWorkflow] SET  READ_WRITE 
GO

USE [movies]
GO
ALTER TABLE [dbo].[UserRatings] DROP CONSTRAINT [CHK_UserRatings_Rating]
GO
ALTER TABLE [dbo].[actors] DROP CONSTRAINT [CK__actors__Gender__37A5467C]
GO
ALTER TABLE [dbo].[UserRatings] DROP CONSTRAINT [FK_UserRatings_Users]
GO
ALTER TABLE [dbo].[UserRatings] DROP CONSTRAINT [FK_UserRatings_Movies]
GO
ALTER TABLE [dbo].[ratings] DROP CONSTRAINT [FK__ratings__MovieID__4AB81AF0]
GO
ALTER TABLE [dbo].[movies] DROP CONSTRAINT [FK__movies__Producer__3F466844]
GO
ALTER TABLE [dbo].[moviegenres] DROP CONSTRAINT [FK__moviegenr__Movie__46E78A0C]
GO
ALTER TABLE [dbo].[moviegenres] DROP CONSTRAINT [FK__moviegenr__Genre__47DBAE45]
GO
ALTER TABLE [dbo].[movieactors] DROP CONSTRAINT [FK__movieacto__Movie__4222D4EF]
GO
ALTER TABLE [dbo].[movieactors] DROP CONSTRAINT [FK__movieacto__Actor__4316F928]
GO
ALTER TABLE [dbo].[UserRatings] DROP CONSTRAINT [DF__UserRatin__Rated__5441852A]
GO
ALTER TABLE [dbo].[ratings] DROP CONSTRAINT [DF__ratings__MaxScor__4BAC3F29]
GO
ALTER TABLE [dbo].[movieactors] DROP CONSTRAINT [DF__movieacto__IsLea__440B1D61]
GO
/****** Object:  Index [UQ__Users__A9D1053492E1AC7A]    Script Date: 2025. 06. 28. 18:34:58 ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UQ__Users__A9D1053492E1AC7A]
GO
/****** Object:  Index [UQ__genres__737584F62C1E922E]    Script Date: 2025. 06. 28. 18:34:58 ******/
ALTER TABLE [dbo].[genres] DROP CONSTRAINT [UQ__genres__737584F62C1E922E]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserRatings]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRatings]') AND type in (N'U'))
DROP TABLE [dbo].[UserRatings]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ratings]') AND type in (N'U'))
DROP TABLE [dbo].[ratings]
GO
/****** Object:  Table [dbo].[producers]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producers]') AND type in (N'U'))
DROP TABLE [dbo].[producers]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movies]') AND type in (N'U'))
DROP TABLE [dbo].[movies]
GO
/****** Object:  Table [dbo].[moviegenres]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[moviegenres]') AND type in (N'U'))
DROP TABLE [dbo].[moviegenres]
GO
/****** Object:  Table [dbo].[movieactors]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movieactors]') AND type in (N'U'))
DROP TABLE [dbo].[movieactors]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[genres]') AND type in (N'U'))
DROP TABLE [dbo].[genres]
GO
/****** Object:  Table [dbo].[actors]    Script Date: 2025. 06. 28. 18:34:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[actors]') AND type in (N'U'))
DROP TABLE [dbo].[actors]
GO
USE [master]
GO
/****** Object:  Database [movies]    Script Date: 2025. 06. 28. 18:34:58 ******/
DROP DATABASE [movies]
GO
/****** Object:  Database [movies]    Script Date: 2025. 06. 28. 18:34:58 ******/
CREATE DATABASE [movies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'movies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\movies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'movies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\movies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [movies] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [movies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [movies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [movies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [movies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [movies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [movies] SET ARITHABORT OFF 
GO
ALTER DATABASE [movies] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [movies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [movies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [movies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [movies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [movies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [movies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [movies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [movies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [movies] SET  ENABLE_BROKER 
GO
ALTER DATABASE [movies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [movies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [movies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [movies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [movies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [movies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [movies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [movies] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [movies] SET  MULTI_USER 
GO
ALTER DATABASE [movies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [movies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [movies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [movies] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [movies] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [movies] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [movies] SET QUERY_STORE = ON
GO
ALTER DATABASE [movies] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [movies]
GO
/****** Object:  Table [dbo].[actors]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[BirthDate] [date] NULL,
	[Nationality] [nvarchar](100) NULL,
	[Gender] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movieactors]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movieactors](
	[MovieID] [int] NOT NULL,
	[ActorID] [int] NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[IsLead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moviegenres]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moviegenres](
	[MovieID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movies]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[ReleaseDate] [date] NULL,
	[DurationMinutes] [int] NULL,
	[Language] [nvarchar](50) NULL,
	[Budget] [bigint] NULL,
	[Revenue] [bigint] NULL,
	[Synopsis] [nvarchar](max) NULL,
	[ProducerID] [int] NULL,
	[AverageRating] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producers]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producers](
	[ProducerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Company] [nvarchar](100) NULL,
	[Nationality] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[Source] [nvarchar](100) NULL,
	[Score] [decimal](4, 1) NULL,
	[MaxScore] [decimal](4, 1) NULL,
	[ReviewCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRatings]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRatings](
	[UserID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[Rating] [tinyint] NOT NULL,
	[RatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserRatings] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2025. 06. 28. 18:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Tel] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actors] ON 

INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (1, N'Robert Downey Jr.', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (2, N'Scarlett Johansson', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (3, N'Chris Evans', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (4, N'Chris Hemsworth', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (5, N'Mark Ruffalo', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (6, N'Jeremy Renner', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (7, N'Tom Holland', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (8, N'Benedict Cumberbatch', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (9, N'Chadwick Boseman', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (10, N'Elizabeth Olsen', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (11, N'Paul Rudd', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (12, N'Brie Larson', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (13, N'Samuel L. Jackson', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (14, N'Michael B. Jordan', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (15, N'Zoe Saldana', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (16, N'Chris Pratt', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (17, N'Karen Gillan', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (18, N'Dave Bautista', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (19, N'Vin Diesel', NULL, NULL, NULL)
INSERT [dbo].[actors] ([ActorID], [FullName], [BirthDate], [Nationality], [Gender]) VALUES (20, N'Bradley Cooper', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[actors] OFF
GO
SET IDENTITY_INSERT [dbo].[genres] ON 

INSERT [dbo].[genres] ([GenreID], [Name]) VALUES (4, N'Action')
INSERT [dbo].[genres] ([GenreID], [Name]) VALUES (1, N'Comedy')
INSERT [dbo].[genres] ([GenreID], [Name]) VALUES (2, N'Horror')
INSERT [dbo].[genres] ([GenreID], [Name]) VALUES (3, N'Sci-Fi')
INSERT [dbo].[genres] ([GenreID], [Name]) VALUES (5, N'Thriller')
SET IDENTITY_INSERT [dbo].[genres] OFF
GO
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (1, 1, N'Role1_1', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (2, 2, N'Role2_2', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (2, 3, N'Role2_3', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (3, 3, N'Role3_3', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (3, 4, N'Role3_4', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (3, 5, N'Role3_5', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (4, 4, N'Role4_4', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (5, 5, N'Role5_5', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (5, 6, N'Role5_6', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (5, 7, N'Role5_7', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (6, 6, N'Role6_6', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (7, 7, N'Role7_7', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (7, 8, N'Role7_8', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (7, 9, N'Role7_9', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (8, 8, N'Role8_8', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (9, 9, N'Role9_9', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (9, 10, N'Role9_10', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (9, 11, N'Role9_11', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (10, 10, N'Role10_10', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (11, 11, N'Role11_11', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (11, 12, N'Role11_12', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (11, 13, N'Role11_13', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (12, 12, N'Role12_12', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (13, 13, N'Role13_13', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (13, 14, N'Role13_14', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (14, 14, N'Role14_14', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (14, 15, N'Role14_15', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (15, 15, N'Role15_15', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (15, 16, N'Role15_16', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (15, 17, N'Role15_17', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (16, 16, N'Role16_16', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (17, 17, N'Role17_17', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (17, 18, N'Role17_18', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (18, 18, N'Role18_18', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (18, 19, N'Role18_19', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (18, 20, N'Role18_20', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (19, 19, N'Role19_19', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (19, 20, N'Role19_20', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (20, 1, N'Role20_1', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (20, 2, N'Role20_2', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (20, 20, N'Role20_20', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (21, 1, N'Role21_1', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (21, 2, N'Role21_2', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (22, 3, N'Role22_3', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (23, 4, N'Role23_4', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (23, 5, N'Role23_5', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (23, 6, N'Role23_6', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (24, 7, N'Role24_7', 1)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (24, 8, N'Role24_8', 0)
INSERT [dbo].[movieactors] ([MovieID], [ActorID], [RoleName], [IsLead]) VALUES (25, 9, N'Role25_9', 1)
GO
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (1, 1)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (2, 2)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (3, 3)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (4, 4)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (5, 5)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (6, 1)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (7, 2)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (8, 3)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (9, 4)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (10, 5)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (11, 1)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (12, 2)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (13, 3)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (14, 4)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (15, 5)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (16, 1)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (17, 2)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (18, 3)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (19, 4)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (20, 5)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (21, 1)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (22, 2)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (23, 3)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (24, 4)
INSERT [dbo].[moviegenres] ([MovieID], [GenreID]) VALUES (25, 5)
GO
SET IDENTITY_INSERT [dbo].[movies] ON 

INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (1, N'The Dark Knight', CAST(N'2008-07-18' AS Date), 152, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (2, N'Inception', CAST(N'2010-07-16' AS Date), 148, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (3, N'The Godfather', CAST(N'1972-03-24' AS Date), 175, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (4, N'Avengers: Endgame', CAST(N'2019-04-26' AS Date), 181, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (5, N'Avatar', CAST(N'2009-12-18' AS Date), 162, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (6, N'Titanic', CAST(N'1997-12-19' AS Date), 195, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (7, N'Pulp Fiction', CAST(N'1994-10-14' AS Date), 154, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (8, N'The Shawshank Redemption', CAST(N'1994-09-23' AS Date), 142, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (9, N'Joker', CAST(N'2019-10-04' AS Date), 122, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (10, N'Interstellar', CAST(N'2014-11-07' AS Date), 169, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (11, N'The Matrix', CAST(N'1999-03-31' AS Date), 136, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (12, N'Fight Club', CAST(N'1999-10-15' AS Date), 139, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (13, N'Forrest Gump', CAST(N'1994-07-06' AS Date), 142, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (14, N'Gladiator', CAST(N'2000-05-05' AS Date), 155, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (15, N'Mad Max: Fury Road', CAST(N'2015-05-15' AS Date), 120, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (16, N'Parasite', CAST(N'2019-05-30' AS Date), 132, N'Korean', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (17, N'Oppenheimer', CAST(N'2023-07-21' AS Date), 180, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (18, N'Whiplash', CAST(N'2014-10-10' AS Date), 106, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (19, N'The Fellowship of the Ring', CAST(N'2001-12-19' AS Date), 178, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (20, N'Black Panther', CAST(N'2018-02-16' AS Date), 134, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (21, N'The Avengers', CAST(N'2012-05-04' AS Date), 143, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (22, N'Star Wars: A New Hope', CAST(N'1977-05-25' AS Date), 121, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (23, N'Jurassic Park', CAST(N'1993-06-11' AS Date), 127, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (24, N'Back to the Future', CAST(N'1985-07-03' AS Date), 116, N'English', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[movies] ([MovieID], [Title], [ReleaseDate], [DurationMinutes], [Language], [Budget], [Revenue], [Synopsis], [ProducerID], [AverageRating]) VALUES (25, N'Guardians of the Galaxy', CAST(N'2014-08-01' AS Date), 121, N'English', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[movies] OFF
GO
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (1, 1, 1, CAST(N'2025-06-28T15:24:52.0693631' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (1, 10, 1, CAST(N'2025-06-28T15:24:52.0723547' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (1, 11, 5, CAST(N'2025-06-28T15:25:46.9306196' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (1, 16, 4, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (1, 20, 5, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (1, 25, 5, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (2, 1, 2, CAST(N'2025-06-28T15:24:52.0693631' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (2, 2, 1, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (2, 11, 4, CAST(N'2025-06-28T15:25:46.9306196' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (2, 17, 3, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (2, 21, 5, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (3, 2, 2, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (3, 3, 3, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (3, 12, 4, CAST(N'2025-06-28T15:25:46.9306196' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (3, 16, 2, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (3, 21, 3, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (4, 3, 1, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (4, 4, 4, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (4, 12, 3, CAST(N'2025-06-28T15:25:46.9306196' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (4, 17, 1, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (4, 22, 2, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (5, 4, 1, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (5, 5, 5, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (5, 13, 5, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (5, 18, 5, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (5, 22, 4, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (6, 5, 2, CAST(N'2025-06-28T15:24:52.0703595' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (6, 6, 3, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (6, 13, 5, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (6, 19, 4, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (6, 23, 5, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (7, 6, 1, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (7, 7, 2, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (7, 14, 3, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (7, 18, 5, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (7, 23, 2, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (8, 7, 3, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (8, 8, 4, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (8, 14, 2, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (8, 19, 4, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (8, 24, 4, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (9, 8, 2, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (9, 9, 4, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (9, 15, 5, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (9, 20, 3, CAST(N'2025-06-28T15:25:46.9325081' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (9, 24, 1, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (10, 9, 5, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (10, 10, 3, CAST(N'2025-06-28T15:24:52.0713566' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (10, 15, 4, CAST(N'2025-06-28T15:25:46.9315127' AS DateTime2))
INSERT [dbo].[UserRatings] ([UserID], [MovieID], [Rating], [RatedAt]) VALUES (10, 25, 3, CAST(N'2025-06-28T15:25:46.9334838' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (1, N'user1@example.com', N'User1', N'hash1', N'123-456-7801')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (2, N'user2@example.com', N'User2', N'hash2', N'123-456-7802')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (3, N'user3@example.com', N'User3', N'hash3', N'123-456-7803')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (4, N'user4@example.com', N'User4', N'hash4', N'123-456-7804')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (5, N'user5@example.com', N'User5', N'hash5', N'123-456-7805')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (6, N'user6@example.com', N'User6', N'hash6', N'123-456-7806')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (7, N'user7@example.com', N'User7', N'hash7', N'123-456-7807')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (8, N'user8@example.com', N'User8', N'hash8', N'123-456-7808')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (9, N'user9@example.com', N'User9', N'hash9', N'123-456-7809')
INSERT [dbo].[Users] ([UserID], [Email], [Name], [PasswordHash], [Tel]) VALUES (10, N'user10@example.com', N'User10', N'hash10', N'123-456-7810')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__genres__737584F62C1E922E]    Script Date: 2025. 06. 28. 18:34:58 ******/
ALTER TABLE [dbo].[genres] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053492E1AC7A]    Script Date: 2025. 06. 28. 18:34:58 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movieactors] ADD  DEFAULT ((0)) FOR [IsLead]
GO
ALTER TABLE [dbo].[ratings] ADD  DEFAULT ((10.0)) FOR [MaxScore]
GO
ALTER TABLE [dbo].[UserRatings] ADD  DEFAULT (sysutcdatetime()) FOR [RatedAt]
GO
ALTER TABLE [dbo].[movieactors]  WITH CHECK ADD FOREIGN KEY([ActorID])
REFERENCES [dbo].[actors] ([ActorID])
GO
ALTER TABLE [dbo].[movieactors]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[movies] ([MovieID])
GO
ALTER TABLE [dbo].[moviegenres]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[genres] ([GenreID])
GO
ALTER TABLE [dbo].[moviegenres]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[movies] ([MovieID])
GO
ALTER TABLE [dbo].[movies]  WITH CHECK ADD FOREIGN KEY([ProducerID])
REFERENCES [dbo].[producers] ([ProducerID])
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[movies] ([MovieID])
GO
ALTER TABLE [dbo].[UserRatings]  WITH CHECK ADD  CONSTRAINT [FK_UserRatings_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[movies] ([MovieID])
GO
ALTER TABLE [dbo].[UserRatings] CHECK CONSTRAINT [FK_UserRatings_Movies]
GO
ALTER TABLE [dbo].[UserRatings]  WITH CHECK ADD  CONSTRAINT [FK_UserRatings_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRatings] CHECK CONSTRAINT [FK_UserRatings_Users]
GO
ALTER TABLE [dbo].[actors]  WITH CHECK ADD CHECK  (([Gender]='Other' OR [Gender]='Female' OR [Gender]='Male'))
GO
ALTER TABLE [dbo].[UserRatings]  WITH CHECK ADD  CONSTRAINT [CHK_UserRatings_Rating] CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[UserRatings] CHECK CONSTRAINT [CHK_UserRatings_Rating]
GO
USE [master]
GO
ALTER DATABASE [movies] SET  READ_WRITE 
GO

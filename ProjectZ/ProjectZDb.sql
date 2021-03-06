USE [master]
GO
/****** Object:  Database [ProjectZDb]    Script Date: 10/13/2021 12:35:10 PM ******/
CREATE DATABASE [ProjectZDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectZDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProjectZDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectZDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProjectZDb.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectZDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectZDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectZDb] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [ProjectZDb] SET ANSI_NULLS ON 
GO
ALTER DATABASE [ProjectZDb] SET ANSI_PADDING ON 
GO
ALTER DATABASE [ProjectZDb] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [ProjectZDb] SET ARITHABORT ON 
GO
ALTER DATABASE [ProjectZDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectZDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectZDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectZDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectZDb] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [ProjectZDb] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [ProjectZDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectZDb] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [ProjectZDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectZDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectZDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectZDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectZDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectZDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectZDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectZDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectZDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectZDb] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectZDb] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectZDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectZDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectZDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectZDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectZDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectZDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectZDb', N'ON'
GO
ALTER DATABASE [ProjectZDb] SET QUERY_STORE = OFF
GO
USE [ProjectZDb]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 10/13/2021 12:35:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[LegalStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/13/2021 12:35:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[HiringDate] [date] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [FK_Employees]    Script Date: 10/13/2021 12:35:10 PM ******/
CREATE NONCLUSTERED INDEX [FK_Employees] ON [dbo].[Employees]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Companies_CompanyId]
GO
USE [master]
GO
ALTER DATABASE [ProjectZDb] SET  READ_WRITE 
GO

USE [ProjectZDb]
INSERT INTO [Companies] (Name,LegalStatus)
VALUES
  ('A Auctor Associates','OAO'),
  ('Lorem LLC','OOO'),
  ('Euismod Limited','OAO'),
  ('Luctus Ut Limited','OOO'),
  ('Sodales Nisi Consulting','ODO'),
  ('Mattis Cras Corp.','OAO'),
  ('Sed PC','OAO'),
  ('Ac Fermentum Institute','OOO'),
  ('Nec Tellus Foundation','OAO'),
  ('Lorem Company','OAO'),
  ('Quis Accumsan Convallis Institute','OAO'),
  ('Imperdiet Ornare In Consulting','OAO'),
  ('Morbi LLC','OOO'),
  ('Dignissim Inc.','OAO'),
  ('Non Institute','OAO'),
  ('Id Erat Incorporated','OAO'),
  ('Consequat LLC','OAO'),
  ('Quis Massa Inc.','OAO'),
  ('Nibh Sit Corporation','ODO'),
  ('Nascetur Ridiculus Consulting','OAO'),
  ('In Nec Inc.','OAO'),
  ('Quisque Purus Incorporated','OAO'),
  ('Arcu Aliquam LLC','ODO'),
  ('Feugiat Metus LLP','ODO'),
  ('Sem Egestas Blandit Foundation','OOO'),
  ('Mauris Integer Corp.','ODO'),
  ('Elit Associates','ODO'),
  ('Dolor Sit LLC','OOO'),
  ('Odio Auctor Limited','OAO'),
  ('Non LLP','OAO');

INSERT INTO [Employees] (LastName,FirstName,MiddleName,HiringDate,Position,CompanyId)
VALUES
  ('Mullen','Sylvia','Maxwell','2018-01-11 14:59:46','Tester',18),
  ('Gonzales','Natalie','Hope','2021-06-14 15:00:24','Tester',20),
  ('Mcintyre','Cleo','Matthew','2018-05-25 01:50:01','Tester',10),
  ('Mcfarland','Bruno','Aristotle','2017-02-08 14:26:37','Developer',23),
  ('Boone','Yetta','Halla','2020-08-23 18:19:20','Developer',14),
  ('Cooley','Juliet','Caesar','2021-01-16 01:47:01','Developer',9),
  ('Burris','Paula','Deborah','2021-07-16 08:12:17','BusinessAnalyst',19),
  ('Tran','Mariko','Stephen','2015-11-21 13:44:00','Tester',9),
  ('Carver','Karyn','Kylynn','2020-12-11 17:30:19','Tester',19),
  ('Lindsey','Ursula','Jolie','2017-07-21 10:28:03','Tester',26),
  ('Prince','Zachary','Steel','2020-02-19 01:50:02','Tester',19),
  ('Morris','Whitney','Yael','2017-10-22 19:56:07','Tester',5),
  ('Arnold','Bo','Reagan','2014-12-16 02:34:52','Developer',22),
  ('Mcdaniel','Amity','Magee','2020-08-03 06:08:46','Tester',3),
  ('Hurst','Christopher','Susan','2017-07-23 23:41:32','Developer',24),
  ('Wilkerson','Leila','Halee','2017-05-29 23:29:03','Tester',20),
  ('Colon','Ingrid','Rhea','2020-11-21 22:26:49','Developer',25),
  ('Hatfield','Marshall','Martena','2015-03-26 23:29:10','Developer',26),
  ('Marsh','Allegra','Hillary','2020-09-09 22:23:26','BusinessAnalyst',7),
  ('Hartman','Michael','Silas','2019-12-30 07:02:08','Tester',4),
  ('Clements','Susan','Derek','2016-09-21 09:36:08','Developer',11),
  ('Odom','Alea','Zoe','2019-07-04 05:05:55','Developer',5),
  ('Hampton','Kay','Otto','2016-09-08 22:28:39','Tester',3),
  ('Barlow','Amber','Bruno','2015-02-22 20:20:47','Tester',14),
  ('Jarvis','Scarlet','Hasad','2019-06-15 16:05:34','Tester',13),
  ('Melton','Winifred','Karen','2019-11-18 05:15:48','Tester',17),
  ('Holden','Kenneth','Aimee','2018-10-26 10:32:28','BusinessAnalyst',18),
  ('Hubbard','Ivory','Clio','2018-03-26 19:50:42','Developer',19),
  ('Bowman','Harper','Slade','2019-04-19 09:23:59','Tester',6),
  ('Pittman','Melanie','Nicholas','2020-01-27 19:50:06','Tester',11),
  ('Lane','Wynter','Damon','2019-07-29 06:04:54','Tester',3),
  ('Juarez','Madeline','Abbot','2018-09-02 05:04:13','Tester',4),
  ('Osborn','Scarlet','Devin','2014-11-16 19:04:09','Tester',18),
  ('Adams','Shea','Paki','2015-10-12 15:49:38','Developer',26),
  ('Kinney','Barbara','Phyllis','2019-04-20 18:38:37','BusinessAnalyst',1),
  ('Barrett','Kasper','Deirdre','2021-07-12 12:44:06','Developer',13),
  ('Bender','Xantha','Kylan','2017-12-07 14:33:48','Tester',8),
  ('Romero','Steven','Kerry','2021-03-11 18:30:59','Developer',15),
  ('Boyle','Grant','Matthew','2018-07-29 01:36:56','Tester',13),
  ('Pugh','Kellie','Jordan','2021-05-20 02:37:10','Developer',15),
  ('Daniels','Bevis','April','2020-04-20 21:51:53','Tester',26),
  ('Carpenter','Piper','Uta','2017-04-26 01:55:26','Tester',14),
  ('Alston','Harding','Austin','2019-06-20 19:27:58','Tester',25),
  ('Garza','Joseph','Emery','2017-07-17 08:09:33','Tester',29),
  ('Wiley','Rafael','Amanda','2018-05-12 22:13:12','Tester',5),
  ('Rhodes','Axel','Brett','2018-09-10 14:15:15','Tester',17),
  ('Bennett','Amanda','Devin','2020-08-02 03:10:54','BusinessAnalyst',29),
  ('Haynes','Brady','Sandra','2016-11-14 14:46:32','Tester',11),
  ('Murphy','Genevieve','Maya','2021-06-03 22:30:08','Developer',14),
  ('Carey','Graiden','Winter','2020-03-04 02:04:09','BusinessAnalyst',18);
INSERT INTO [Employees] (LastName,FirstName,MiddleName,HiringDate,Position,CompanyId)
VALUES
  ('Dawson','Plato','Rafael','2015-08-16 19:56:51','Tester',12),
  ('Orr','Lucian','Alyssa','2019-04-25 10:32:37','BusinessAnalyst',7),
  ('Chavez','Benedict','Matthew','2016-08-23 01:48:54','BusinessAnalyst',8),
  ('Joseph','Burke','Marvin','2017-06-28 15:43:04','Tester',16),
  ('Lee','Ali','Mona','2018-04-03 04:26:40','Tester',29),
  ('Reynolds','Savannah','Alexandra','2020-02-29 01:54:02','Tester',6),
  ('Huber','Forrest','Fuller','2020-03-15 18:56:45','Developer',19),
  ('Martinez','Stella','Grant','2018-11-15 23:57:08','BusinessAnalyst',4),
  ('Moran','Demetrius','Illiana','2018-08-08 01:43:13','BusinessAnalyst',9),
  ('Frederick','Seth','Rooney','2016-07-12 21:15:42','BusinessAnalyst',21),
  ('Knox','Madison','Hermione','2018-03-08 07:46:28','Tester',25),
  ('Mcguire','Paula','Xander','2019-09-06 01:32:19','BusinessAnalyst',13),
  ('Ochoa','Ulric','Kyra','2021-05-12 14:01:51','BusinessAnalyst',11),
  ('Bauer','Teegan','Hamilton','2018-01-19 17:48:24','BusinessAnalyst',7),
  ('King','Ayanna','Elton','2015-08-01 21:38:44','Developer',13),
  ('Daniel','Idona','Kenyon','2016-08-23 21:17:41','Developer',5),
  ('Reilly','Odysseus','Samuel','2019-07-23 16:58:03','Tester',23),
  ('Haynes','Martin','Tad','2016-11-15 23:51:40','Developer',18),
  ('Payne','Amity','Quon','2021-04-21 15:12:13','BusinessAnalyst',23),
  ('Lawrence','Chiquita','Caryn','2019-06-28 20:23:34','Tester',9),
  ('Middleton','Zane','Patricia','2014-12-19 17:41:08','BusinessAnalyst',23),
  ('Bailey','Ciaran','Vance','2019-12-15 12:46:24','Developer',30),
  ('Padilla','Vera','Ignatius','2015-09-01 11:38:43','BusinessAnalyst',15),
  ('Witt','Selma','Steven','2018-05-01 07:19:03','Tester',10),
  ('Larsen','Callum','Rosalyn','2015-12-29 03:57:04','Tester',17),
  ('Boyle','Tucker','Violet','2015-07-26 12:27:25','Developer',11),
  ('Stewart','Eugenia','Burke','2016-12-24 22:08:46','Tester',30),
  ('Dale','Amal','Wayne','2019-08-23 09:10:36','Tester',29),
  ('Durham','Armando','Portia','2018-08-26 06:12:43','Tester',18),
  ('Conner','Maya','Lester','2017-07-30 07:11:47','Tester',26),
  ('Carney','Garrison','Kylie','2015-03-28 20:36:40','Tester',5),
  ('Mcconnell','Forrest','Herman','2017-05-31 13:58:52','BusinessAnalyst',28),
  ('Roth','Heather','Brendan','2015-12-09 18:11:32','Tester',6),
  ('Vaughan','Jescie','Otto','2021-07-06 05:38:24','Developer',8),
  ('Little','Jillian','Jenna','2017-07-09 00:05:06','BusinessAnalyst',26),
  ('Shepherd','Regina','Jolie','2016-08-30 16:35:17','BusinessAnalyst',22),
  ('Berger','Dane','Kyra','2015-02-27 20:52:25','Tester',19),
  ('Randolph','Denton','Yuli','2019-07-31 20:08:27','Developer',14),
  ('Berry','Alma','Zahir','2020-08-25 12:23:52','Tester',22),
  ('Mack','Jelani','Trevor','2021-03-15 03:31:50','BusinessAnalyst',28),
  ('Key','Quinlan','Tanya','2018-11-07 12:27:13','Tester',4),
  ('Maldonado','Jamalia','Honorato','2015-11-04 12:42:08','BusinessAnalyst',2),
  ('Tanner','Echo','Hilel','2017-11-11 11:24:21','BusinessAnalyst',19),
  ('Bradley','Jonah','Yen','2020-07-14 17:26:47','Tester',10),
  ('Cervantes','Nora','Lawrence','2016-09-06 23:15:50','Developer',12),
  ('Gutierrez','Cheyenne','Winter','2020-06-27 19:54:09','BusinessAnalyst',6),
  ('Molina','Buckminster','Derek','2016-03-27 21:44:26','Tester',9),
  ('Tucker','Zia','Aurelia','2018-09-28 13:46:55','Tester',25),
  ('Crawford','Alika','Rana','2020-07-20 02:41:55','Developer',28),
  ('Carroll','Lysandra','Dale','2019-12-27 05:09:58','BusinessAnalyst',4);

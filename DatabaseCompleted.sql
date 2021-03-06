USE [master]
GO
/****** Object:  Database [MarkManage]    Script Date: 7/18/2022 7:34:28 AM ******/
CREATE DATABASE [MarkManage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarkManage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarkManage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarkManage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarkManage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MarkManage] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarkManage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarkManage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarkManage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarkManage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarkManage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarkManage] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarkManage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarkManage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarkManage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarkManage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarkManage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarkManage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarkManage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarkManage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarkManage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarkManage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MarkManage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarkManage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarkManage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarkManage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarkManage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarkManage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarkManage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarkManage] SET RECOVERY FULL 
GO
ALTER DATABASE [MarkManage] SET  MULTI_USER 
GO
ALTER DATABASE [MarkManage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarkManage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarkManage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarkManage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarkManage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarkManage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MarkManage', N'ON'
GO
ALTER DATABASE [MarkManage] SET QUERY_STORE = OFF
GO
USE [MarkManage]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[suID] [nvarchar](50) NOT NULL,
	[caName] [nvarchar](50) NOT NULL,
	[sID] [nvarchar](50) NOT NULL,
	[examDate] [date] NOT NULL,
	[score] [float] NULL,
 CONSTRAINT [pk_A] PRIMARY KEY CLUSTERED 
(
	[suID] ASC,
	[caName] ASC,
	[sID] ASC,
	[examDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[suID] [nvarchar](50) NOT NULL,
	[caName] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Part] [int] NULL,
	[Weight] [float] NULL,
	[completionCriterial] [nvarchar](50) NULL,
	[duration] [nvarchar](100) NULL,
	[Question_Type] [nvarchar](150) NULL,
	[No_Question] [nvarchar](150) NULL,
	[Knowledge_and_Skill] [nvarchar](150) NULL,
	[Grading Guide] [nvarchar](150) NULL,
	[Note] [nvarchar](150) NULL,
 CONSTRAINT [pk] PRIMARY KEY CLUSTERED 
(
	[caName] ASC,
	[suID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gID] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Student]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Student](
	[gID] [nvarchar](50) NOT NULL,
	[sID] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_GS] PRIMARY KEY CLUSTERED 
(
	[gID] ASC,
	[sID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Subject]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Subject](
	[gID] [nvarchar](50) NOT NULL,
	[suID] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_Group_Subjet] PRIMARY KEY CLUSTERED 
(
	[gID] ASC,
	[suID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[seID] [nvarchar](50) NOT NULL,
	[seName] [nvarchar](50) NULL,
	[startDate] [nvarchar](50) NULL,
	[endDate] [nvarchar](50) NULL,
 CONSTRAINT [PK__Semester__2C89FE8F0FF217CF] PRIMARY KEY CLUSTERED 
(
	[seID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sID] [nvarchar](50) NOT NULL,
	[sName] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[DOB] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Subject]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Subject](
	[sID] [nvarchar](50) NOT NULL,
	[suID] [nvarchar](50) NOT NULL,
	[seID] [nvarchar](50) NULL,
	[group] [nvarchar](50) NULL,
	[mark] [float] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [pk_Student_Subject] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	[suID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 7/18/2022 7:34:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[suID] [nvarchar](50) NOT NULL,
	[suName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[suID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Assignment', N'HE134553', CAST(N'2022-06-11' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Assignment', N'HE150112', CAST(N'2022-12-12' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Assignment', N'HE157932', CAST(N'2022-09-06' AS Date), 2)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Assignment', N'HE160136', CAST(N'2022-12-15' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Assignment', N'HE167443', CAST(N'2022-11-07' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Assignment', N'HS132332', CAST(N'2022-12-25' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Exercises', N'HE134553', CAST(N'2022-06-10' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Exercises', N'HE150112', CAST(N'2022-10-15' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Exercises', N'HE157932', CAST(N'2022-11-16' AS Date), 4)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Exercises', N'HE160136', CAST(N'2022-12-10' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Exercises', N'HE167443', CAST(N'2022-11-17' AS Date), 2)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Exercises', N'HS132332', CAST(N'2022-11-09' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Final Exam', N'HE134553', CAST(N'2022-06-15' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Final Exam ', N'HE150112', CAST(N'2022-10-06' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Final Exam ', N'HE157932', CAST(N'2022-11-11' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Final Exam ', N'HE160136', CAST(N'2022-12-11' AS Date), 4)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Final Exam ', N'HE167443', CAST(N'2022-12-12' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'CEA201', N'Final Exam ', N'HS132332', CAST(N'2022-10-10' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Assignment', N'HE134553', CAST(N'2022-06-07' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Assignment', N'HE157932', CAST(N'2022-11-29' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Assignment', N'HE160136', CAST(N'2022-09-06' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Assignment', N'HE160233', CAST(N'2022-12-27' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Assignment', N'HE167443', CAST(N'2022-09-11' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Final Exam', N'HE134553', CAST(N'2022-06-25' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Final Exam', N'HE157932', CAST(N'2022-12-08' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Final Exam', N'HE160136', CAST(N'2022-12-09' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Final Exam', N'HE160233', CAST(N'2022-12-18' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Final Exam', N'HE167443', CAST(N'2022-09-05' AS Date), 4)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'lab', N'HE134553', CAST(N'2022-06-04' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'lab', N'HE157932', CAST(N'2022-10-05' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'lab', N'HE160136', CAST(N'2022-10-30' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'lab', N'HE160233', CAST(N'2022-10-03' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'lab', N'HE167443', CAST(N'2022-10-07' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Practice Exam', N'HE134553', CAST(N'2022-06-18' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Practice Exam', N'HE157932', CAST(N'2022-10-16' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Practice Exam', N'HE160136', CAST(N'2022-10-30' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Practice Exam', N'HE160233', CAST(N'2022-10-15' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Practice Exam', N'HE167443', CAST(N'2022-11-10' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Progress Test', N'HE134553', CAST(N'2022-06-02' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Progress Test', N'HE157932', CAST(N'2022-11-01' AS Date), 4)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Progress Test', N'HE160136', CAST(N'2022-11-24' AS Date), 10)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Progress Test', N'HE160233', CAST(N'2022-10-10' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'DBI202', N'Progress Test', N'HE167443', CAST(N'2022-12-21' AS Date), 10)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Activate learning', N'HE134553', CAST(N'2022-10-03' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Activate learning', N'HE157932', CAST(N'2022-10-22' AS Date), 4)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Activate learning', N'HE160136', CAST(N'2022-11-25' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Activate learning', N'HE160233', CAST(N'2022-10-13' AS Date), 10)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Activate learning', N'HE167443', CAST(N'2022-10-24' AS Date), 10)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Activate learning', N'HS132332', CAST(N'2022-11-09' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Final Exam', N'HE134553', CAST(N'2022-09-16' AS Date), 10)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Final Exam', N'HE157932', CAST(N'2022-09-03' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Final Exam', N'HE160136', CAST(N'2022-10-05' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Final Exam', N'HE160233', CAST(N'2022-12-15' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Final Exam', N'HE167443', CAST(N'2022-12-31' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Final Exam', N'HS132332', CAST(N'2022-11-02' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Presentation', N'HE134553', CAST(N'2022-11-18' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Presentation', N'HE157932', CAST(N'2022-11-30' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Presentation', N'HE160136', CAST(N'2022-10-28' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Presentation', N'HE160233', CAST(N'2022-12-04' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Presentation', N'HE167443', CAST(N'2022-09-22' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Presentation', N'HS132332', CAST(N'2022-10-31' AS Date), 10)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Progress test', N'HE134553', CAST(N'2022-11-18' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Progress test', N'HE157932', CAST(N'2022-11-14' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Progress test', N'HE160136', CAST(N'2022-09-13' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Progress test', N'HE160233', CAST(N'2022-12-28' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Progress test', N'HE167443', CAST(N'2022-10-21' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Progress test', N'HS132332', CAST(N'2022-10-21' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Project', N'HE134553', CAST(N'2022-10-12' AS Date), 4)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Project', N'HE157932', CAST(N'2022-12-29' AS Date), 9)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Project', N'HE160136', CAST(N'2022-11-06' AS Date), 4)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Project', N'HE160233', CAST(N'2022-11-08' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Project', N'HE167443', CAST(N'2022-09-17' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'IOT202', N'Project', N'HS132332', CAST(N'2022-10-16' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Assignment', N'HE150112', CAST(N'2022-10-27' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Assignment', N'HE157932', CAST(N'2022-09-06' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Assignment', N'HE157932', CAST(N'2022-09-20' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Assignment', N'HE160233', CAST(N'2022-10-27' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Assignment', N'HS132332', CAST(N'2022-11-27' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Final Exam', N'HE150112', CAST(N'2022-11-03' AS Date), 8)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Final Exam', N'HE157932', CAST(N'2022-10-14' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Final Exam', N'HE157932', CAST(N'2022-10-30' AS Date), 3)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Final Exam', N'HE160233', CAST(N'2022-10-02' AS Date), 2)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Final Exam', N'HS132332', CAST(N'2022-11-02' AS Date), 7)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Progress test', N'HE150112', CAST(N'2022-10-01' AS Date), 6)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Progress Test', N'HE157932', CAST(N'2022-10-21' AS Date), 5)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Progress Test', N'HE157932', CAST(N'2022-12-09' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Progress Test', N'HE160233', CAST(N'2022-10-02' AS Date), 1)
INSERT [dbo].[Assessment] ([suID], [caName], [sID], [examDate], [score]) VALUES (N'MAE101', N'Progress Test', N'HS132332', CAST(N'2022-11-02' AS Date), 7)
GO
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'IOT202', N'Activate learning', N'on-going', 1, 10, N'>0', N'From start to finish in schedule	', N'Private', N'N/A', N'Students ask good questions, hard work, self study online.	', N'by instructor', NULL)
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'CEA201', N'Assignment', N'on-going', 2, 30, N'>0', N'Option 1: At home Option2: (For Constructivism Approach only):', N'Option 1: Developing Assemly program Option 2 (For Constructivism Approach only)', N'Option 1: 2 Option 2 (For Constructivism Approach only):', N'Basic program', N'Teachers assess their works on their computer', N'30% of total progress mark')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'DBI202', N'Assignment', N'on-going', 1, 20, N'>0', N'28slots', NULL, N'N/A', N'All subject in syllabus', N'in calss by teacher', NULL)
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'MAE101', N'Assignment', N'on-going', 3, 30, N'>0', N'	OP1: at home // OP2: (For Constructivism Approach only): Follow lecturer''s proposal', N'	OP1: Open // OP2: (For Constructivism Approach only): Follow lecturer''s proposal', N'OP1: At least 3/chapter // OP2: (For Constructivism Approach only): Follow lecturer''s proposal', N'Chapters introduced', N'OP1: guided by instructor
in class, completed by students at home, submitted by deadline', N'OP1: guided by instructor
in class, completed by students at home, submitted by deadline')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'CEA201', N'Exercises', N'on-going', 4, 30, N'>0', N'Option 1: At home Option2: (For Constructivism Approach only):', N'Option 1: Developing Assemly program Option 2 (For Constructivism Approach only)', N'Option 1: Depends on chapters Option 2 (For Constructivism Approach only', N'Studied chapters; knowledge and skills	', N'Students write answers to their notebook	', N'30% of total progress mark')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'CEA201', N'Final Exam ', N'final exam', 1, 40, N'4', N'60''', N'Multiple choice', N'50', N'All chapters; knowledge and skills of digital system;	', N'By Exam board', N'40% of total progress mark
')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'DBI202', N'Final Exam ', N'final exam ', 1, 30, N'4', NULL, NULL, N'50', N'All subjects in syllabus', N'Exam room', N'The exam questions must be updated or different at least 70% to the previous ones.')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'IOT202', N'Final Exam', N'final exam', 1, 40, N'4', N'60''', N'Computer Gradable', N'50', N'All chapters; knowledge and skills
', N'by Exam board', NULL)
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'MAE101', N'Final Exam', N'final exam', 1, 40, N'4', N'60', N'Computer gradable', N'50
Structure:
• level 1: 10%
• level 2: 80%
• level 3: 10%', N'All studied chapters. Each studied Chapter contributes 2-8 questions,', N'by exam board', N'	~10% of
questions is a2 objective oriented')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'CEA201', N'Final Exam resit', N'final exam', 1, 40, N'4', N'60''', N'Multiple choice', N'50', N'All chapters; knowledge and skills of digital system;	', N'By Exam board', N'40% of total progress mark
')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'DBI202', N'Final Exam resit', N'final exam', 1, 30, N'4', NULL, NULL, N'50', N'All subjects in syllabus', N'Exam room', N'The exam questions must be updated or different at least 70% to the previous ones.')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'IOT202', N'Final Exam resit', N'final exam', 1, 40, N'4', N'60''', N'Computer Gradable', N'50', N'All chapters; knowledge and skills
', N'by Exam board', NULL)
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'MAE101', N'Final Exam Resit', N'final exam', 1, 30, N'4', N'60', N'Computer gradable', N'50
Structure:
• level 1: 10%
• level 2: 80%
• level 3: 10%', N'All studied chapters. Each studied Chapter contributes 2-8 questions,', N'by exam board', N'	~10% of
questions is a2 objective oriented')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'DBI202', N'lab', N'on-going', 5, 10, N'>0', N'90''', NULL, N'N/A', NULL, N'in class, by teacher', NULL)
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'DBI202', N'Practice Exam', N'on-going', 1, 30, N'>0', N'90', NULL, N'N/A', NULL, N'In class by teacher', NULL)
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'IOT202', N'Presentation', N'on-going', 1, 10, N'>0', NULL, N'Group', N'N/A', N'IoT idea / theory', N'by instructor', N'Scoring will be based on the guidelines in Tab "Presentation Guide"')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'DBI202', N'Progress Test', N'on-going', 2, 10, N'>0', N'30''', N'Multiple choices; Marked by Computer or a suitable format', N'20', NULL, N'in class by LMS system', N'Progress test must be taken right after the last lectures of required material.')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'IOT202', N'Progress test ', N'on-going', 2, 10, N'>0', N'30''', N'Private', N'N/A', N'studied chapters knowledge and skills	', N'by instructor', NULL)
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'MAE101', N'Progress Test', N'on-going	', 3, 30, N'>0', N'OP1: Test 1: 40''Test 2&3: 30''', N'	OP1: MC or a suitable format // OP2: (For Constructivism Approach only): Follow lecturer''s proposal', N'OP1: Test 1: 20 Test 2&3: 15+ At least 5*n questions', N'Chapters introduced	', N'OP1: by instructor, and by suitable means (computer, paper, oral...)
OP2: (For Constructivism Approach only): Follow lecturer''s proposal', N'Progress test must be taken right after the last lectures of required material.')
INSERT [dbo].[Category] ([suID], [caName], [Type], [Part], [Weight], [completionCriterial], [duration], [Question_Type], [No_Question], [Knowledge_and_Skill], [Grading Guide], [Note]) VALUES (N'IOT202', N'Project', N'on-going', 1, 30, N'>0', N'From start to finish in schedule', N'Group', N'N/A', N'studied chapters knowledge and skills	', N'by instructor', N'Scoring will be based on the guidelines in Tab "Project Guide"
')
GO
INSERT [dbo].[Group] ([gID]) VALUES (N'IA1601')
INSERT [dbo].[Group] ([gID]) VALUES (N'IA1604')
INSERT [dbo].[Group] ([gID]) VALUES (N'SE1532')
INSERT [dbo].[Group] ([gID]) VALUES (N'SE1655')
GO
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1601', N'HE150112')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1601', N'HE160136')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1601', N'HS132332')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1604', N'HE134553')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1604', N'HE150112')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1604', N'HE157932')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'IA1604', N'HE160136')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1532', N'HE157932')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1532', N'HE167443')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1655', N'HE160233')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1655', N'HE167443')
INSERT [dbo].[Group_Student] ([gID], [sID]) VALUES (N'SE1655', N'HS132332')
GO
INSERT [dbo].[Group_Subject] ([gID], [suID]) VALUES (N'IA1601', N'CEA201')
INSERT [dbo].[Group_Subject] ([gID], [suID]) VALUES (N'IA1601', N'MAE101')
INSERT [dbo].[Group_Subject] ([gID], [suID]) VALUES (N'IA1604', N'DBI202')
INSERT [dbo].[Group_Subject] ([gID], [suID]) VALUES (N'IA1604', N'MAE101')
INSERT [dbo].[Group_Subject] ([gID], [suID]) VALUES (N'SE1532', N'IOT202')
INSERT [dbo].[Group_Subject] ([gID], [suID]) VALUES (N'SE1655', N'CEA201')
GO
INSERT [dbo].[Semester] ([seID], [seName], [startDate], [endDate]) VALUES (N'FA22', N'Fall2022', N'2022-9-2', N'2023-1-1')
INSERT [dbo].[Semester] ([seID], [seName], [startDate], [endDate]) VALUES (N'SP23', N'Spring2023', N'2023-1-2', N'2023-4-1')
INSERT [dbo].[Semester] ([seID], [seName], [startDate], [endDate]) VALUES (N'SU22', N'Summer2022', N'2022-4-2', N'2022-9-1')
INSERT [dbo].[Semester] ([seID], [seName], [startDate], [endDate]) VALUES (N'SU23', N'Summer2023', N'2023-4-2', N'2023-9-1')
GO
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HE134553', N'Nguyễn Hồng Vân', 0, CAST(N'1995-06-16' AS Date))
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HE150112', N'Yên Công Bằng', 1, CAST(N'1996-11-12' AS Date))
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HE157932', N'Chu Cẩm Yến', 0, CAST(N'2000-07-11' AS Date))
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HE160136', N'Đỗ Văn Chung', 1, CAST(N'2002-03-30' AS Date))
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HE160233', N'Triệu Duy Cương', 1, CAST(N'1997-05-27' AS Date))
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HE167443', N'Nguyễn Minh Hùng', 1, CAST(N'2000-10-05' AS Date))
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HS132332', N'Phùng Thụy Linh', 0, CAST(N'1998-08-19' AS Date))
INSERT [dbo].[Student] ([sID], [sName], [gender], [DOB]) VALUES (N'HS152662', N'Đào Nhật Minh', 1, CAST(N'2001-01-01' AS Date))
GO
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE134553', N'CEA201', N'SU22', N'IA1601', 6.3, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE134553', N'DBI202', N'SU22', N'IA1604', 6.1, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE134553', N'IOT202', N'FA22', N'SE1532', 7, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE134553', N'MAE101', N'SP23', NULL, NULL, NULL)
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE150112', N'CEA201', N'SU22', N'IA1601', 7.8000000000000007, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE150112', N'DBI202', N'SP23', NULL, NULL, NULL)
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE150112', N'IOT202', N'SP23', NULL, NULL, NULL)
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE150112', N'MAE101', N'FA22', N'IA1604', 7.1000000000000005, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE157932', N'CEA201', N'SU22', N'IA1601', 5.4, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE157932', N'DBI202', N'SU22', N'IA1604', 5.5, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE157932', N'IOT202', N'FA22', N'SE1532', 6, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE157932', N'MAE101', N'FA22', N'IA1604', 7.6, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160136', N'CEA201', N'SU22', N'SE1655', 5.2, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160136', N'DBI202', N'SU22', N'IA1604', 3.5, N'not Passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160136', N'IOT202', N'FA22', N'SE1532', 6.3000000000000007, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160136', N'MAE101', N'SP23', NULL, NULL, NULL)
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160233', N'CEA201', N'SU23', NULL, NULL, NULL)
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160233', N'DBI202', N'SU22', N'IA1604', 6.3000000000000007, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160233', N'IOT202', N'FA22', N'SE1532', 4, N'not Passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE160233', N'MAE101', N'FA22', N'UA1601', 3.2, N'not Passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE167443', N'CEA201', N'SU22', N'IA1601', 6, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE167443', N'DBI202', N'SU22', N'IA1604', 4.4, N'not Passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE167443', N'IOT202', N'FA22', N'SE1532', 5, N'not Passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HE167443', N'MAE101', N'SP23', NULL, NULL, NULL)
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HS132332', N'CEA201', N'FA22', N'IA1601', 7.4, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HS132332', N'DBI202', N'SP23', NULL, NULL, NULL)
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HS132332', N'IOT202', N'SU22', N'SE1532', 5.3, N'passed')
INSERT [dbo].[Student_Subject] ([sID], [suID], [seID], [group], [mark], [status]) VALUES (N'HS132332', N'MAE101', N'SU22', N'IA1601', 7, N'passed')
GO
INSERT [dbo].[subject] ([suID], [suName]) VALUES (N'CEA201', N'Computer Organization and Architecture	')
INSERT [dbo].[subject] ([suID], [suName]) VALUES (N'DBI202', N'Introduction to Databases')
INSERT [dbo].[subject] ([suID], [suName]) VALUES (N'IOT202', N'Internet of Things')
INSERT [dbo].[subject] ([suID], [suName]) VALUES (N'MAE101', N'Mathematics for Engineering	')
GO
ALTER TABLE [dbo].[Student] ADD  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Category] FOREIGN KEY([caName], [suID])
REFERENCES [dbo].[Category] ([caName], [suID])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Category]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [fk2_A] FOREIGN KEY([sID])
REFERENCES [dbo].[Student] ([sID])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [fk2_A]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [fk_category] FOREIGN KEY([suID])
REFERENCES [dbo].[subject] ([suID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [fk_category]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [fk_GS] FOREIGN KEY([gID])
REFERENCES [dbo].[Group] ([gID])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [fk_GS]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [fk1_GS] FOREIGN KEY([sID])
REFERENCES [dbo].[Student] ([sID])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [fk1_GS]
GO
ALTER TABLE [dbo].[Group_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject_Group] FOREIGN KEY([gID])
REFERENCES [dbo].[Group] ([gID])
GO
ALTER TABLE [dbo].[Group_Subject] CHECK CONSTRAINT [FK_Group_Subject_Group]
GO
ALTER TABLE [dbo].[Group_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject_subject] FOREIGN KEY([suID])
REFERENCES [dbo].[subject] ([suID])
GO
ALTER TABLE [dbo].[Group_Subject] CHECK CONSTRAINT [FK_Group_Subject_subject]
GO
ALTER TABLE [dbo].[Student_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Student_Subject_Semester] FOREIGN KEY([seID])
REFERENCES [dbo].[Semester] ([seID])
GO
ALTER TABLE [dbo].[Student_Subject] CHECK CONSTRAINT [FK_Student_Subject_Semester]
GO
ALTER TABLE [dbo].[Student_Subject]  WITH CHECK ADD  CONSTRAINT [fk_Student_Subject1] FOREIGN KEY([sID])
REFERENCES [dbo].[Student] ([sID])
GO
ALTER TABLE [dbo].[Student_Subject] CHECK CONSTRAINT [fk_Student_Subject1]
GO
ALTER TABLE [dbo].[Student_Subject]  WITH CHECK ADD  CONSTRAINT [fk_Student_Subject2] FOREIGN KEY([suID])
REFERENCES [dbo].[subject] ([suID])
GO
ALTER TABLE [dbo].[Student_Subject] CHECK CONSTRAINT [fk_Student_Subject2]
GO
ALTER TABLE [dbo].[Student_Subject]  WITH CHECK ADD  CONSTRAINT [checkStatus] CHECK  (([status]='passed' OR [status]='passed (with condition)' OR [status]='not passed'))
GO
ALTER TABLE [dbo].[Student_Subject] CHECK CONSTRAINT [checkStatus]
GO
USE [master]
GO
ALTER DATABASE [MarkManage] SET  READ_WRITE 
GO

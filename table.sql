USE [master]
GO
/****** Object:  Database [checkingAttendence]    Script Date: 6/19/2022 10:12:13 AM ******/
CREATE DATABASE [checkingAttendence]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'checkingAttendence', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\checkingAttendence.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'checkingAttendence_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\checkingAttendence_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [checkingAttendence] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [checkingAttendence].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [checkingAttendence] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [checkingAttendence] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [checkingAttendence] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [checkingAttendence] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [checkingAttendence] SET ARITHABORT OFF 
GO
ALTER DATABASE [checkingAttendence] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [checkingAttendence] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [checkingAttendence] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [checkingAttendence] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [checkingAttendence] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [checkingAttendence] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [checkingAttendence] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [checkingAttendence] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [checkingAttendence] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [checkingAttendence] SET  DISABLE_BROKER 
GO
ALTER DATABASE [checkingAttendence] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [checkingAttendence] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [checkingAttendence] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [checkingAttendence] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [checkingAttendence] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [checkingAttendence] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [checkingAttendence] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [checkingAttendence] SET RECOVERY FULL 
GO
ALTER DATABASE [checkingAttendence] SET  MULTI_USER 
GO
ALTER DATABASE [checkingAttendence] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [checkingAttendence] SET DB_CHAINING OFF 
GO
ALTER DATABASE [checkingAttendence] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [checkingAttendence] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [checkingAttendence] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [checkingAttendence] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'checkingAttendence', N'ON'
GO
ALTER DATABASE [checkingAttendence] SET QUERY_STORE = OFF
GO
USE [checkingAttendence]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/19/2022 10:12:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseID] [varchar](50) NOT NULL,
	[courseName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 6/19/2022 10:12:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[groupID] [varchar](50) NOT NULL,
	[lectuterID] [varchar](50) NOT NULL,
	[studentID] [varchar](50) NOT NULL,
	[courseID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 6/19/2022 10:12:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[lecturerID] [varchar](50) NOT NULL,
	[lecturerName] [varchar](50) NOT NULL,
	[LectuerGmail] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[lecturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/19/2022 10:12:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [varchar](50) NOT NULL,
	[floor] [varchar](50) NOT NULL,
	[building] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 6/19/2022 10:12:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sessionNumber] [varchar](50) NOT NULL,
	[studentID] [varchar](50) NOT NULL,
	[slotNumber] [int] NOT NULL,
	[roomID] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sessionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 6/19/2022 10:12:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slotNumber] [int] NOT NULL,
	[time] [time](0) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[slotNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/19/2022 10:12:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[studentID] [varchar](50) NOT NULL,
	[studentName] [varchar](50) NOT NULL,
	[studentGender] [bit] NOT NULL,
	[studentAdress] [varbinary](100) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [checkingAttendence] SET  READ_WRITE 
GO

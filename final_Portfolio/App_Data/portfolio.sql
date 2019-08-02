USE [master]
GO
/****** Object:  Database [MyPortfolio]    Script Date: 8/2/2019 1:12:35 PM ******/
CREATE DATABASE [MyPortfolio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyPortfolio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyPortfolio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyPortfolio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyPortfolio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyPortfolio] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyPortfolio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyPortfolio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyPortfolio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyPortfolio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyPortfolio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyPortfolio] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyPortfolio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyPortfolio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyPortfolio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyPortfolio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyPortfolio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyPortfolio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyPortfolio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyPortfolio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyPortfolio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyPortfolio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyPortfolio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyPortfolio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyPortfolio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyPortfolio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyPortfolio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyPortfolio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyPortfolio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyPortfolio] SET RECOVERY FULL 
GO
ALTER DATABASE [MyPortfolio] SET  MULTI_USER 
GO
ALTER DATABASE [MyPortfolio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyPortfolio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyPortfolio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyPortfolio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyPortfolio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyPortfolio', N'ON'
GO
ALTER DATABASE [MyPortfolio] SET QUERY_STORE = OFF
GO
USE [MyPortfolio]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 8/2/2019 1:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseID] [int] NOT NULL,
	[studentID] [int] NOT NULL,
	[coursename] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[P_Information]    Script Date: 8/2/2019 1:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P_Information](
	[studentID] [int] NOT NULL,
	[name] [varchar](10) NOT NULL,
	[age] [int] NOT NULL,
	[phonenum] [varchar](50) NOT NULL,
	[university] [varchar](50) NOT NULL,
	[major] [varchar](50) NOT NULL,
	[url] [varchar](50) NOT NULL,
 CONSTRAINT [PK_P_Information] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project]    Script Date: 8/2/2019 1:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[projectID] [int] NOT NULL,
	[studentID] [int] NOT NULL,
	[projectname] [varchar](50) NOT NULL,
	[organization] [varchar](50) NOT NULL,
	[discription] [varchar](max) NOT NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[projectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[P_Information]  WITH CHECK ADD  CONSTRAINT [FK_P_Information_P_Information] FOREIGN KEY([studentID])
REFERENCES [dbo].[P_Information] ([studentID])
GO
ALTER TABLE [dbo].[P_Information] CHECK CONSTRAINT [FK_P_Information_P_Information]
GO
ALTER TABLE [dbo].[project]  WITH CHECK ADD  CONSTRAINT [FK_project_project] FOREIGN KEY([projectID])
REFERENCES [dbo].[project] ([projectID])
GO
ALTER TABLE [dbo].[project] CHECK CONSTRAINT [FK_project_project]
GO
USE [master]
GO
ALTER DATABASE [MyPortfolio] SET  READ_WRITE 
GO

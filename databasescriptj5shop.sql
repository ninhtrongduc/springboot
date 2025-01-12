USE [master]
GO
/****** Object:  Database [J5Shop]    Script Date: 12/10/2022 8:06:35 PM ******/
CREATE DATABASE [J5Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J5Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\J5Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J5Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\J5Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [J5Shop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J5Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J5Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J5Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J5Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J5Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J5Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J5Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J5Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J5Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J5Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J5Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J5Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J5Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J5Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J5Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J5Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J5Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [J5Shop] SET  MULTI_USER 
GO
ALTER DATABASE [J5Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J5Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J5Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J5Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J5Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J5Shop] SET QUERY_STORE = OFF
GO
USE [J5Shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/10/2022 8:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/10/2022 8:06:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [varchar](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/10/2022 8:06:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/10/2022 8:06:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/10/2022 8:06:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [varchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Samsungsfkjsdhfjkshfa')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Oppo')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'anhtu')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'điện gia dụng123')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (2, N'Samsung', N'samsung.png', 234.5, CAST(N'2001-12-29' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (3, N'Oppo', N'oppo.png', 123.5, CAST(N'2021-05-11' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (4, N'BPhone', N'bphone.png', 211.7, CAST(N'2021-03-11' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (6, N'Tiki', N'tiki.png', 200.1, CAST(N'2021-04-23' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (9, N'Lazada', N'lazada.jpg', 156.4, CAST(N'2011-05-07' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (10, N'Shoppe', N'shoppe.png', 99.7, CAST(N'2003-03-06' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (11, N'Alibaba', N'alibaba.jpg', 100.5, CAST(N'2004-05-02' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (14, N'Doremon', N'doremon.png', 121.6, CAST(N'2012-11-29' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (16, N'Doremi', N'doremi.png', 125.7, CAST(N'2014-12-29' AS Date), 1, N'1002')
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Index [UQ__OrderDet__08D097A2BB215830]    Script Date: 12/10/2022 8:06:44 PM ******/
ALTER TABLE [dbo].[OrderDetails] ADD UNIQUE NONCLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [J5Shop] SET  READ_WRITE 
GO

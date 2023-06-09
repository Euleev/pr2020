USE [master]
GO
/****** Object:  Database [pr2020]    Script Date: 17.05.2023 12:29:43 ******/
CREATE DATABASE [pr2020]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pr2020', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pr2020.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pr2020_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pr2020_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pr2020] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pr2020].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pr2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pr2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pr2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pr2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pr2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [pr2020] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [pr2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pr2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pr2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pr2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pr2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pr2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pr2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pr2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pr2020] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pr2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pr2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pr2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pr2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pr2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pr2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pr2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pr2020] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pr2020] SET  MULTI_USER 
GO
ALTER DATABASE [pr2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pr2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pr2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pr2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pr2020] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pr2020] SET QUERY_STORE = OFF
GO
USE [pr2020]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [nvarchar](20) NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
	[ProductID] [int] NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 17.05.2023 12:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (1, 9)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (2, 11)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (4, 6)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (9, 6)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (17, 5)
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Серёга', N'Белый', N'Сергеевич', CAST(N'2003-02-12' AS Date), CAST(N'2023-05-11T17:00:00.000' AS DateTime), N'assaddsasdadsa@bk.ru', N'79327548562', N'2', N'photo\СБС.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Стас', N'Стасов', N'Стасович', CAST(N'2000-08-15' AS Date), CAST(N'2023-05-14T14:00:00.000' AS DateTime), N'sdfcxvd@bk.ru', N'79534856742', N'1', N'photo\ССС.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Гена', N'Генов', N'Герычев', CAST(N'2000-07-05' AS Date), CAST(N'2023-05-07T13:30:00.000' AS DateTime), N'sdfdsf@bk.ru', N'79324856748', N'2', N'photo\ГГГ.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Валера', N'Валерьянов', N'Валерович', CAST(N'1997-05-18' AS Date), CAST(N'2023-05-21T18:20:00.000' AS DateTime), N'klklnjknkj@bk.ru', N'79432752346', N'1', N'photo\ВВВ.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Мага', N'Магафуров', N'Ильфарович', CAST(N'2003-09-07' AS Date), CAST(N'2023-05-20T11:30:00.000' AS DateTime), N'vbnxzvchj@bk.ru', N'79542345768', N'2', N'photo\ММИ.jpg')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 1, 1, CAST(N'2023-05-01T17:00:00.000' AS DateTime), N'Perfect')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 2, 2, CAST(N'2023-05-07T11:00:00.000' AS DateTime), N'Perfect')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 3, 3, CAST(N'2023-05-28T21:00:00.000' AS DateTime), N'Perfect')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 4, 4, CAST(N'2023-05-22T13:00:00.000' AS DateTime), N'Perfect')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 5, 5, CAST(N'2023-05-04T15:00:00.000' AS DateTime), N'Perfect')
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentByService] ON 

INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (2, 2, N'Doc\client\1.docx')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (3, 3, N'Doc\client\2.docx')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (4, 4, N'Doc\client\3.docx')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (5, 5, N'Doc\client\4.docx')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (6, 6, N'Doc\client\5.docx')
SET IDENTITY_INSERT [dbo].[DocumentByService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'Мужской')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'Женски')
GO
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (51, N'Profix', CAST(N'2017-10-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (52, N'Pierburg', CAST(N'2017-01-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (53, N'Honda', CAST(N'2016-06-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (54, N'Benson', CAST(N'2015-04-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (55, N'Mazda', CAST(N'2018-01-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (56, N'Zekkert', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (57, N'Ferodo', CAST(N'2015-08-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (58, N'Lemforder', CAST(N'2016-11-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (59, N'Toyota', CAST(N'2016-06-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (60, N'Automega', CAST(N'2016-07-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (61, N'Magneti Marelli', CAST(N'2017-05-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (62, N'Nissan', CAST(N'2015-01-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (63, N'Airline', CAST(N'2016-03-26' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (64, N'BILSTEIN', CAST(N'2018-03-06' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (65, N'Petro-Canada', CAST(N'2017-03-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (66, N'Bendix', CAST(N'2015-04-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (67, N'Mercedes', CAST(N'2016-03-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (68, N'Mitsubishi', CAST(N'2017-04-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (69, N'Motul', CAST(N'2018-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (70, N'Shell', CAST(N'2016-11-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (71, N'Liqui Moly', CAST(N'2015-03-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (72, N'Mando', CAST(N'2015-03-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (73, N'LUK', CAST(N'2015-12-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (74, N'76', CAST(N'2017-02-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (75, N'Kayaba', CAST(N'2016-02-08' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (76, N'Total', CAST(N'2015-03-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (77, N'ASHIKA', CAST(N'2018-06-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (78, N'VAG', CAST(N'2018-05-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (79, N'King Bearings', CAST(N'2016-09-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (80, N'Castrol', CAST(N'2015-04-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (81, N'Hyundai/Kia', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (82, N'Opel', CAST(N'2015-03-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (83, N'Idemitsu', CAST(N'2018-01-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (84, N'Stels', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (85, N'BOGE', CAST(N'2016-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (86, N'Glaser', CAST(N'2015-12-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (87, N'Goodyear', CAST(N'2015-12-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (88, N'Suzuki', CAST(N'2017-05-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (89, N'ZIMMERMANN', CAST(N'2017-12-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (90, N'Mobil', CAST(N'2016-10-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (91, N'OPTIMAL', CAST(N'2016-08-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (92, N'ZIC', CAST(N'2015-02-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (93, N'Ford', CAST(N'2016-10-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (94, N'General Motors', CAST(N'2016-10-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (95, N'KASHIYAMA', CAST(N'2015-10-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (96, N'ALСA', CAST(N'2016-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (97, N'Airtex', CAST(N'2015-10-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (98, N'Elf', CAST(N'2016-10-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (99, N'BOSCH', CAST(N'2017-06-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (100, N'Lukoil', CAST(N'2017-12-19' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (1, N'Моторное масло Motor Oil KE900-90042-R', 2060.0000, N' Nissan', N' Товары автосервиса\8FE07916.jpg', N' да', 51)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (2, N'Моторное масло Helix Ultra 550046361', 2120.0000, N' Shell', N' Товары автосервиса\F310E078.jpg', N' да', 52)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (3, N'Моторное масло Super 3000 X1 152566', 1820.0000, N' Mobil', N' Товары автосервиса\6CA0BE73.jpg', N' нет', 53)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (4, N'Моторное масло Turbo SYN Gasoline 05100-00441', 187.0000, N' Hyundai/Kia', N' Товары автосервиса\2B009062.jpg', N' активен', 54)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (5, N'Моторное масло Dexos 2 95599405', 1410.0000, N' General Motors', N' Товары автосервиса\AD00B713.jpg', N' да', 55)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (6, N'Моторное масло Molygen New Generation 9054', 2670.0000, N' Liqui Moly', N' Товары автосервиса\0DF0A8A4.jpg', N' да', 56)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (7, N'Моторное масло Top Tec 4600 8033', 258.0000, N' Liqui Moly', N' Товары автосервиса\B790A6AA.jpg', N' не активен', 57)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (8, N'Моторное масло ENGINE OIL 08880-80375-GO', 2710.0000, N' Toyota', N' Товары автосервиса\CC40C869.jpg', N' нет', 58)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (9, N'Моторное масло Mobil 1 ESP 154285', 289.0000, N' Mobil', N' Товары автосервиса\F490E078.jpg', N' да', 59)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (10, N'Моторное масло Dexos 2 93165557', 1500.0000, N' General Motors', N' Товары автосервиса\45908C52.jpg', N' да', 60)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (11, N'Моторное масло Super 3000 X1 Diesel 152572', 187.0000, N' Mobil', N' Товары автосервиса\B0A0C186.jpg', N' активен', 61)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (12, N'Моторное масло ENGINE OIL MZ 320754', 214.0000, N' Mitsubishi', N' Товары автосервиса\3B70C57C.jpg', N' активен', 62)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (13, N'Моторное масло Genesis Armortech 3148675', 166.0000, N' Lukoil', N' Товары автосервиса\C9C0F036.jpg', N' не активен', 63)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (14, N'Моторное масло Optimal Synth 3926', 1880.0000, N' Liqui Moly', N' Товары автосервиса\EFC05011.jpg', N' активен', 64)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (15, N'Моторное масло Optimal Synth 2293', 252.0000, N' Liqui Moly', N' Товары автосервиса\C310B9F3.jpg', N' да', 65)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (16, N'Моторное масло Evolution 900 SXR 194878', 201.0000, N' Elf', N' Товары автосервиса\E320BB7C.jpg', N' да', 66)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (17, N'Моторное масло Special C G 055 167 M4', 4720.0000, N' VAG', N' Товары автосервиса\6730A31C.jpg', N' да', 67)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (18, N'Моторное масло Longlife III G 052 195 M2', 191.0000, N' VAG', N' Товары автосервиса\E5507A37.jpg', N' да', 68)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (19, N'Моторное масло Special Tec LL 8055', 2420.0000, N' Liqui Moly', N' Товары автосервиса\B590AA7B.jpg', N' нет', 69)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (20, N'Моторное масло Dexos 2 19 42 002', 1300.0000, N' Opel', N' Товары автосервиса\23F0848B.jpg', N' да', 70)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (21, N'Моторное масло Gasoline Fully- Synthetic 30021326-746', 165.0000, N' Idemitsu', N' Товары автосервиса\27B0C883.jpg', N' активен', 71)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (22, N'Моторное масло Formula F 15595E', 175.0000, N' Ford', N' Товары автосервиса\5250C855.jpg', N' нет', 72)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (23, N'Моторное масло Zepro Euro Spec SN/CF 1849-004', 240.0000, N' Idemitsu', N' Товары автосервиса\90D0B807.jpg', N' активен', 73)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (24, N'Моторное масло SN 08880-10705', 2200.0000, N' Toyota', N' Товары автосервиса\43909176.jpg', N' да', 74)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (25, N'Моторное масло Motor Oil KE900-90042', 202.0000, N' Nissan', N' Товары автосервиса\90505D31.jpg', N' да', 75)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (26, N'Моторное масло Evolution 900 SXR 194839', 234.0000, N' Elf', N' Товары автосервиса\F8E0B138.jpg', N' нет', 76)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (27, N'Моторное масло SN/GF-5 SN5W30C', 155.0000, N' Profix', N' Товары автосервиса\5A30A7EE.jpg', N' активен', 77)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (28, N'Моторное масло Evolution 900 SXR 194877', 2470.0000, N' Elf', N' Товары автосервиса\E3A0B18A.jpg', N' активен', 78)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (29, N'Трос буксировочный 12 тонн 54384', 410.0000, N' Stels', N' Товары автосервиса\9750DA76.jpg', N' да', 79)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (30, N'Моторное масло Molygen New Generation 9042', 251.0000, N' Liqui Moly', N' Товары автосервиса\0D60A8A4.jpg', N' да', 80)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (31, N'Моторное масло QUARTZ INEO ECS 166252', 160.0000, N' Total', N' Товары автосервиса\D0D08F32.jpg', N' да', 81)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (32, N'Моторное масло Motor Oil KE900-90032-R', 145.0000, N' Nissan', N' Товары автосервиса\54B0795D.jpg', N' да', 82)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (33, N'Моторное масло Original oil Ultra 8300-77-992', 2770.0000, N' Mazda', N' Товары автосервиса\EF80D790.jpg', N' нет', 83)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (34, N'Моторное масло Longlife III G 052 195 M4', 410.0000, N' VAG', N' Товары автосервиса\D9605006.jpg', N' активен', 84)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (35, N'Моторное масло 8100 X-CESS 102870', 319.0000, N' Motul', N' Товары автосервиса\E9308929.jpg', N' да', 85)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (36, N'Моторное масло Magnatec A5 15583D', 2220.0000, N' Castrol', N' Товары автосервиса\9380C1E7.jpg', N' да', 86)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (37, N'Щетка для снега со съемным скребком GY000202', 350.0000, N' Goodyear', N' Товары автосервиса\3760D73F.jpg', N' да', 87)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (38, N'Моторное масло Magnatec A3/B4 156E9E', 213.0000, N' Castrol', N' Товары автосервиса\92C0C1E7.jpg', N' активен', 88)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (39, N'Моторное масло Dexos 2 19 42 000', 141.0000, N' Opel', N' Товары автосервиса\2390848B.jpg', N' да', 99)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (40, N'Моторное масло QUARTZ 9000 FUTURE NFC 171839', 156.0000, N' Total', N' Товары автосервиса\D2508F32.jpg', N' да', 100)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (41, N'Моторное масло Premium DPF Diesel 05200-00120', 146.0000, N' Hyundai/Kia', N' Товары автосервиса\2D709062.jpg', N' да', 55)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (42, N'Моторное масло Special G G 052 502 M2', 182.0000, N' VAG', N' Товары автосервиса\E0D0E079.jpg', N' да', 56)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (43, N'Моторное масло Ecstar F9000 99M00-22R02-004', 233.0000, N' Suzuki', N' Товары автосервиса\21B0E533.jpg', N' да', 57)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (44, N'Моторное масло Genesis Armortech 1539424', 171.0000, N' Lukoil', N' Товары автосервиса\B0F0CB59.jpg', N' да', 58)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (45, N'Моторное масло Helix Ultra 550046387', 2160.0000, N' Shell', N' Товары автосервиса\F2B0E078.jpg', N' нет', 59)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (46, N'Моторное масло Super 3000 X1 152567', 155.0000, N' Mobil', N' Товары автосервиса\F200BC2F.jpg', N' да', 60)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (47, N'Моторное масло ENGINE OIL MZ 320753', 1590.0000, N' Mitsubishi', N' Товары автосервиса\5BB0C351.jpg', N' нет', 61)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (48, N'Моторное масло Mobil 1 ESP Formula 152621', 292.0000, N' Mobil', N' Товары автосервиса\DC70BEC3.jpg', N' нет', 62)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (49, N'Моторное масло Genuine A000989790211BIFR', 1530.0000, N' Mercedes', N' Товары автосервиса\2E30E06C.jpg', N' нет', 63)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (50, N'Моторное масло ULTRA 152624', 194.0000, N' Mobil', N' Товары автосервиса\BA30C186.jpg', N' активен', 64)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (51, N'Моторное масло Super 3000 X1 Formula FE 152564', 1890.0000, N' Mobil', N' Товары автосервиса\59B0BE73.jpg', N' да', 65)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (52, N'Моторное масло Zepro Euro Spec SN/CF 1849-001', 1730.0000, N' Idemitsu', N' Товары автосервиса\90A0B807.jpg', N' активен', 66)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (53, N'Моторное масло Helix Ultra 550046367', 1650.0000, N' Shell', N' Товары автосервиса\F2E0E078.jpg', N' нет', 67)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (54, N'Моторное масло QUARTZ 9000 FUTURE NFC 183199', 204.0000, N' Total', N' Товары автосервиса\6CE0A012.jpg', N' да', 68)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (55, N'Моторное масло Dexos 2 93165554', 1380.0000, N' General Motors', N' Товары автосервиса\45008C52.jpg', N' да', 69)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (56, N'Моторное масло Formula F Fuel Economy HC 155D4B', 145.0000, N' Ford', N' Товары автосервиса\39A0C188.jpg', N' активен', 70)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (57, N'Моторное масло 76 08880-803ENGINE OIL-GO', 163.0000, N' Toyota', N' Товары автосервиса\0070C563.jpg', N' да', 81)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (58, N'Моторное масло QUARTZ 9000 FUTURE NFC 183450', 1660.0000, N' Total', N' Товары автосервиса\FA90B138.jpg', N' да', 82)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (59, N'Моторное масло Top Tec 4100 7501', 2580.0000, N' Liqui Moly', N' Товары автосервиса\022096CB.jpg', N' активен', 83)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (60, N'Моторное масло Mobil 1 ESP 154279', 1860.0000, N' Mobil', N' Товары автосервиса\F460E078.jpg', N' да', 84)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (61, N'Моторное масло Super 3000 X1 152061', 201.0000, N' Mobil', N' Товары автосервиса\40409946.jpg', N' да', 85)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (62, N'Моторное масло Super Extra Gasoline 05100-00410', 123.0000, N' Hyundai/Kia', N' Товары автосервиса\2A109062.jpg', N' активен', 86)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (63, N'Моторное масло Dexos 2 93165556', 134.0000, N' General Motors', N' Товары автосервиса\43E08C52.jpg', N' да', 87)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (64, N'Моторное масло Leichtlauf Special AA 7516', 236.0000, N' Liqui Moly', N' Товары автосервиса\47E07CB5.jpg', N' да', 88)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (65, N'Моторное масло Helix HX8 A5/B5 550046777', 153.0000, N' Shell', N' Товары автосервиса\F160E078.jpg', N' да', 89)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (66, N'Моторное масло Fuel Economy 08880-80845', 2560.0000, N' Toyota', N' Товары автосервиса\23106A35.jpg', N' да', 90)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (67, N'Моторное масло 76 Top Tec 420061', 344.0000, N' Liqui Moly', N' Товары автосервиса\03D096CB.jpg', N' да', 91)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (68, N'Моторное масло X9 162613', 1530.0000, N' ZIC', N' Товары автосервиса\30E0C751.jpg', N' да', 92)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (69, N'Моторное масло EDGE Professional LL III Titanium FST 157AD6', 1760.0000, N' Castrol', N' Товары автосервиса\96E0C1E7.jpg', N' да', 93)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (70, N'Моторное масло Magnatec A3/B4 156E9D', 161.0000, N' Castrol', N' Товары автосервиса\9290C1E7.jpg', N' активен', 94)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (71, N'Моторное масло Genuine A000989790213BIFR', 239.0000, N' Mercedes', N' Товары автосервиса\2E60E06C.jpg', N' да', 95)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (72, N'Моторное масло Supreme Synthetic MOSYN53C16', 1910.0000, N' Petro-Canada', N' Товары автосервиса\69C0CD62.jpg', N' да', 96)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (73, N'Моторное масло Helix Ultra Pro AM-L 550046353', 2110.0000, N' Shell', N' Товары автосервиса\3DF0E4BC.jpg', N' да', 97)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (74, N'Моторное масло QUARTZ INEO ECS 151510', 192.0000, N' Total', N' Товары автосервиса\8F609ED7.jpg', N' да', 98)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (75, N'Моторное масло Original oil Ultra 0530-05-TFE', 293.0000, N' Mazda', N' Товары автосервиса\85C04040.jpg', N' да', 99)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (76, N'Моторное масло QUARTZ 9000 ENERGY HKS 175393', 2830.0000, N' Total', N' Товары автосервиса\6DD0A012.jpg', N' активен', 100)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (77, N'Моторное масло Ultra LEO-SN 08217-99974', 2980.0000, N' Honda', N' Товары автосервиса\97809225.jpg', N' да', 55)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (78, N'Моторное масло Special G G 052 502 M4', 309.0000, N' VAG', N' Товары автосервиса\E0A0E079.jpg', N' да', 56)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (79, N'Моторное масло Люкс 207465', 109.0000, N' Lukoil', N' Товары автосервиса\8E20A863.jpg', N' да', 57)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (80, N'Жилет светоотражающий взрослый ARW-AV-02', 150.0000, N' Airline', N' Товары автосервиса\D4D0CE67.jpg', N' да', 58)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (81, N'Моторное масло Premium LF Gasoline 05100-00451', 1620.0000, N' Hyundai/Kia', N' Товары автосервиса\2B609062.jpg', N' да', 59)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (82, N'Моторное масло Evolution 900 SXR 10160501', 175.0000, N' Elf', N' Товары автосервиса\BD80E8D5.jpg', N' активен', 60)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (83, N'Моторное масло Zepro Touring 1845-004', 2380.0000, N' Idemitsu', N' Товары автосервиса\5180B90E.jpg', N' да', 61)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (84, N'Моторное масло 76 A000989PKW Motorenol0213BLER', 251.0000, N' Mercedes', N' Товары автосервиса\2E00E06C.jpg', N' да', 62)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (85, N'Моторное масло QUARTZ 9000 ENERGY HKS 175392', 1530.0000, N' Total', N' Товары автосервиса\6DA0A012.jpg', N' нет', 63)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (86, N'Моторное масло Formula F 155D3A', 183.0000, N' Ford', N' Товары автосервиса\39D0C188.jpg', N' да', 64)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (87, N'Моторное масло Mobil 1 FS 153692', 302.0000, N' Mobil', N' Товары автосервиса\6080DCD5.jpg', N' да', 65)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (88, N'Моторное масло Zepro Eco Medalist 3583-004', 252.0000, N' Idemitsu', N' Товары автосервиса\3DA0B713.jpg', N' да', 66)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (89, N'Моторное масло SN 08880-10706', 1640.0000, N' Toyota', N' Товары автосервиса\43C09176.jpg', N' да', 67)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (90, N'Моторное масло Dexos 2 19 42 003', 1490.0000, N' Opel', N' Товары автосервиса\8430842A.jpg', N' да', 68)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (91, N'Моторное масло ENGINE OIL 08880-80365-GO', 358.0000, N' Toyota', N' Товары автосервиса\CC10C869.jpg', N' да', 69)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (92, N'Моторное масло EDGE LL Titanium FST 15669A', 300.0000, N' Castrol', N' Товары автосервиса\8BC0C1A9.jpg', N' активен', 70)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (93, N'Моторное масло QUARTZ 9000 148597', 170.0000, N' Total', N' Товары автосервиса\8F909ED7.jpg', N' нет', 71)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (94, N'Моторное масло ENGINE OIL MZ 320756', 1600.0000, N' Mitsubishi', N' Товары автосервиса\5BE0C351.jpg', N' не активен', 72)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (95, N'Моторное масло Zepro Touring 1845-001', 172.0000, N' Idemitsu', N' Товары автосервиса\7B70B9C6.jpg', N' да', 73)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (96, N'Моторное масло ENGINE OIL MZ 320757', 2210.0000, N' Mitsubishi', N' Товары автосервиса\0D30C4EE.jpg', N' да', 74)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (97, N'Моторное масло Zepro Eco Medalist 3583-001', 177.0000, N' Idemitsu', N' Товары автосервиса\6800BB8A.jpg', N' активен', 75)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (98, N'Моторное масло Premium DPF Diesel 05200-00620', 247.0000, N' Hyundai/Kia', N' Товары автосервиса\9B3075EB.jpg', N' да', 76)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (99, N'Моторное масло QUARTZ 9000 FUTURE NFC 10230501', 1650.0000, N' Total', N' Товары автосервиса\3970E753.jpg', N' нет', 77)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (2, 1, N'photodoc\DC70BEC3.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (3, 2, N'photodoc\6DD0A012.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (4, 3, N'photodoc\5BB0C351.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (5, 4, N'photodoc\0D60A8A4.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (6, 5, N'photodoc\0D30C4EE.jpg')
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (101, CAST(N'2019-02-22T15:30:00.000' AS DateTime), N'Моторное масло Mobil 1 ESP 154285', 2, 1, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (102, CAST(N'2019-11-20T17:05:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320756', 3, 2, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (103, CAST(N'2019-10-05T17:25:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 FUTURE NFC 171839', 1, 3, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (104, CAST(N'2019-10-06T15:45:00.000' AS DateTime), N'Моторное масло EDGE LL Titanium FST 15669A', 2, 4, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (105, CAST(N'2019-02-11T18:18:00.000' AS DateTime), N'Моторное масло Top Tec 4600 8033', 1, 5, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (106, CAST(N'2019-11-03T19:48:00.000' AS DateTime), N'Моторное масло ENGINE OIL 08880-80375-GO', 2, 6, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (107, CAST(N'2019-08-25T09:14:00.000' AS DateTime), N'Жилет светоотражающий взрослый ARW-AV-02', 3, 7, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (108, CAST(N'2019-04-08T19:12:00.000' AS DateTime), N'Моторное масло Super 3000 X1 152567', 2, 8, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (109, CAST(N'2019-10-07T18:30:00.000' AS DateTime), N'Моторное масло Motor Oil KE900-90032-R', 3, 9, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (110, CAST(N'2019-12-30T13:56:00.000' AS DateTime), N'Моторное масло Premium LF Gasoline 05100-00451', 2, 10, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (111, CAST(N'2019-07-23T13:22:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320757', 2, 11, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (112, CAST(N'2019-05-08T16:32:00.000' AS DateTime), N'Моторное масло Dexos 2 93165556', 1, 12, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (113, CAST(N'2019-02-25T18:40:00.000' AS DateTime), N'Моторное масло Evolution 900 SXR 194877', 1, 13, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (114, CAST(N'2019-11-16T16:36:00.000' AS DateTime), N'Моторное масло Magnatec A3/B4 156E9D', 3, 14, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (115, CAST(N'2019-01-05T14:29:00.000' AS DateTime), N'Моторное масло Genesis Armortech 3148675', 3, 15, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (116, CAST(N'2019-01-03T14:05:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320754', 3, 16, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (117, CAST(N'2019-11-22T08:16:00.000' AS DateTime), N'Моторное масло Premium DPF Diesel 05200-00120', 3, 17, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (118, CAST(N'2019-12-18T15:30:00.000' AS DateTime), N'Моторное масло Dexos 2 93165554', 2, 18, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (119, CAST(N'2019-02-11T13:31:00.000' AS DateTime), N'Моторное масло Formula F Fuel Economy HC 155D4B', 2, 19, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (120, CAST(N'2019-11-09T14:29:00.000' AS DateTime), N'Моторное масло Evolution 900 SXR 10160501', 3, 20, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (121, CAST(N'2019-01-17T09:33:00.000' AS DateTime), N'Моторное масло Premium DPF Diesel 05200-00620', 3, 21, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (122, CAST(N'2019-07-27T12:18:00.000' AS DateTime), N'Моторное масло QUARTZ INEO ECS 151510', 3, 22, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (123, CAST(N'2019-05-02T14:04:00.000' AS DateTime), N'Моторное масло Helix Ultra 550046361', 1, 23, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (124, CAST(N'2019-03-23T12:33:00.000' AS DateTime), N'Моторное масло Magnatec A5 15583D', 3, 24, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (125, CAST(N'2019-08-31T10:27:00.000' AS DateTime), N'Моторное масло Zepro Eco Medalist 3583-001', 2, 25, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (126, CAST(N'2019-04-02T15:49:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 FUTURE NFC 183199', 3, 26, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (127, CAST(N'2019-02-14T16:30:00.000' AS DateTime), N'Моторное масло SN 08880-10706', 2, 27, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (128, CAST(N'2019-06-30T15:04:00.000' AS DateTime), N'Моторное масло Super 3000 X1 152566', 3, 28, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (129, CAST(N'2019-01-15T10:32:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 FUTURE NFC 183450', 1, 29, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (130, CAST(N'2019-12-25T09:20:00.000' AS DateTime), N'Моторное масло Zepro Euro Spec SN/CF 1849-004', 3, 30, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (131, CAST(N'2019-04-24T17:19:00.000' AS DateTime), N'Моторное масло Special G G 052 502 M2', 2, 31, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (132, CAST(N'2019-05-11T16:15:00.000' AS DateTime), N'Моторное масло SN 08880-10706', 1, 32, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (133, CAST(N'2019-01-21T13:44:00.000' AS DateTime), N'Моторное масло Evolution 900 SXR 194878', 2, 33, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (134, CAST(N'2019-08-22T09:42:00.000' AS DateTime), N'Моторное масло Premium DPF Diesel 05200-00620', 2, 34, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (135, CAST(N'2019-11-10T17:27:00.000' AS DateTime), N'Моторное масло Dexos 2 19 42 003', 1, 35, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (136, CAST(N'2019-01-20T17:36:00.000' AS DateTime), N'Моторное масло 76 Top Tec 420061', 3, 36, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (137, CAST(N'2019-08-06T10:47:00.000' AS DateTime), N'Моторное масло Special Tec LL 8055', 2, 37, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (138, CAST(N'2019-09-25T09:23:00.000' AS DateTime), N'Моторное масло 76 A000989PKW Motorenol0213BLER', 2, 38, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (139, CAST(N'2019-01-13T15:27:00.000' AS DateTime), N'Моторное масло Formula F Fuel Economy HC 155D4B', 3, 39, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (140, CAST(N'2019-11-21T15:51:00.000' AS DateTime), N'Моторное масло QUARTZ INEO ECS 151510', 1, 40, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (141, CAST(N'2019-03-02T09:33:00.000' AS DateTime), N'Моторное масло Helix Ultra 550046367', 1, 41, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (142, CAST(N'2019-02-16T08:02:00.000' AS DateTime), N'Моторное масло Dexos 2 19 42 000', 1, 42, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (143, CAST(N'2019-07-22T17:12:00.000' AS DateTime), N'Моторное масло Evolution 900 SXR 194878', 2, 43, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (144, CAST(N'2019-12-26T19:19:00.000' AS DateTime), N'Моторное масло Genuine A000989790211BIFR', 2, 44, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (145, CAST(N'2019-07-18T08:43:00.000' AS DateTime), N'Трос буксировочный 12 тонн 54384', 3, 45, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (146, CAST(N'2019-06-02T19:06:00.000' AS DateTime), N'Моторное масло Mobil 1 ESP Formula 152621', 2, 46, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (147, CAST(N'2019-07-22T10:28:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320753', 3, 47, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (148, CAST(N'2019-03-27T19:34:00.000' AS DateTime), N'Жилет светоотражающий взрослый ARW-AV-02', 2, 48, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (149, CAST(N'2019-09-01T17:03:00.000' AS DateTime), N'Моторное масло Genuine A000989790211BIFR', 3, 49, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (150, CAST(N'2019-02-27T17:52:00.000' AS DateTime), N'Моторное масло 76 A000989PKW Motorenol0213BLER', 2, 50, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (151, CAST(N'2019-02-22T15:07:00.000' AS DateTime), N'Моторное масло Zepro Eco Medalist 3583-004', 3, 51, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (152, CAST(N'2019-01-18T14:44:00.000' AS DateTime), N'Трос буксировочный 12 тонн 54384', 2, 52, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (153, CAST(N'2019-03-24T18:10:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 148597', 3, 53, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (154, CAST(N'2019-10-21T10:29:00.000' AS DateTime), N'Моторное масло Magnatec A5 15583D', 2, 54, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (155, CAST(N'2019-06-11T09:34:00.000' AS DateTime), N'Моторное масло X9 162613', 3, 55, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (156, CAST(N'2019-06-08T14:12:00.000' AS DateTime), N'Моторное масло Original oil Ultra 8300-77-992', 1, 56, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (157, CAST(N'2019-03-23T09:48:00.000' AS DateTime), N'Моторное масло Formula F 155D3A', 3, 57, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (158, CAST(N'2019-07-21T08:46:00.000' AS DateTime), N'Трос буксировочный 12 тонн 54384', 1, 58, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (159, CAST(N'2019-04-13T12:41:00.000' AS DateTime), N'Моторное масло Evolution 900 SXR 10160501', 2, 59, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (160, CAST(N'2019-01-24T16:39:00.000' AS DateTime), N'Моторное масло Люкс 207465', 1, 60, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (161, CAST(N'2019-02-15T13:41:00.000' AS DateTime), N'Кредитница, Кожа B6 6 95 1349', 3, 61, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (162, CAST(N'2019-07-04T17:30:00.000' AS DateTime), N'Моторное масло Helix Ultra 550046361', 2, 62, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (163, CAST(N'2019-03-27T18:28:00.000' AS DateTime), N'Моторное масло Dexos 2 93165557', 3, 63, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (164, CAST(N'2019-11-14T08:58:00.000' AS DateTime), N'Моторное масло Optimal Synth 3926', 2, 64, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (165, CAST(N'2019-06-12T10:24:00.000' AS DateTime), N'Моторное масло Dexos 2 95599405', 2, 65, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (166, CAST(N'2019-08-07T18:21:00.000' AS DateTime), N'Моторное масло Mobil 1 ESP Formula 152621', 2, 66, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (167, CAST(N'2019-09-26T16:57:00.000' AS DateTime), N'Моторное масло Longlife III G 052 195 M4', 1, 67, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (168, CAST(N'2019-09-04T08:03:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320753', 3, 68, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (169, CAST(N'2019-02-19T08:36:00.000' AS DateTime), N'Моторное масло X9 162613', 1, 69, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (170, CAST(N'2019-05-14T16:03:00.000' AS DateTime), N'Моторное масло Genuine A000989790213BIFR', 1, 70, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (171, CAST(N'2019-07-14T09:32:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320754', 1, 71, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (173, CAST(N'2019-01-08T10:57:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 148597', 2, 72, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (174, CAST(N'2019-03-07T17:37:00.000' AS DateTime), N'Моторное масло X9 162613', 2, 73, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (175, CAST(N'2019-05-08T16:55:00.000' AS DateTime), N'Моторное масло Optimal Synth 3926', 2, 74, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (176, CAST(N'2019-07-29T09:29:00.000' AS DateTime), N'Моторное масло Super 3000 X1 Diesel 152572', 3, 75, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (177, CAST(N'2019-01-17T18:25:00.000' AS DateTime), N'Моторное масло Zepro Eco Medalist 3583-004', 3, 76, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (178, CAST(N'2019-01-02T08:49:00.000' AS DateTime), N'Моторное масло Formula F 15595E', 1, 77, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (179, CAST(N'2019-04-27T12:25:00.000' AS DateTime), N'Моторное масло Molygen New Generation 9042', 3, 78, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (180, CAST(N'2019-10-11T16:56:00.000' AS DateTime), N'Моторное масло SN/GF-5 SN5W30C', 2, 79, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (181, CAST(N'2019-11-16T13:32:00.000' AS DateTime), N'Моторное масло Fuel Economy 08880-80845', 3, 80, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (182, CAST(N'2019-07-28T10:56:00.000' AS DateTime), N'Моторное масло Longlife III G 052 195 M2', 1, 81, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (183, CAST(N'2019-05-29T13:09:00.000' AS DateTime), N'Моторное масло ENGINE OIL 08880-80365-GO', 2, 82, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (184, CAST(N'2019-05-23T12:00:00.000' AS DateTime), N'Моторное масло Fuel Economy 08880-80845', 1, 83, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (185, CAST(N'2019-12-24T10:08:00.000' AS DateTime), N'Моторное масло Special Tec LL 8055', 3, 84, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (186, CAST(N'2019-03-10T08:00:00.000' AS DateTime), N'Моторное масло Evolution 900 SXR 194878', 1, 85, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (187, CAST(N'2019-08-20T18:45:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 ENERGY HKS 175392', 3, 86, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (188, CAST(N'2019-03-27T12:05:00.000' AS DateTime), N'Моторное масло Helix Ultra 550046367', 1, 87, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (189, CAST(N'2019-02-13T13:40:00.000' AS DateTime), N'Моторное масло Fuel Economy 08880-80845', 3, 88, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (190, CAST(N'2019-09-20T08:56:00.000' AS DateTime), N'Моторное масло Top Tec 4600 8033', 2, 89, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (191, CAST(N'2019-10-03T12:31:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 FUTURE NFC 183199', 1, 90, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (192, CAST(N'2019-10-08T12:30:00.000' AS DateTime), N'Моторное масло Zepro Eco Medalist 3583-001', 2, 91, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (193, CAST(N'2019-08-19T10:01:00.000' AS DateTime), N'Моторное масло Longlife III G 052 195 M2', 3, 92, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (194, CAST(N'2019-10-09T18:21:00.000' AS DateTime), N'Моторное масло QUARTZ 9000 148597', 2, 93, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (195, CAST(N'2019-01-09T17:04:00.000' AS DateTime), N'Моторное масло Optimal Synth 2293', 3, 94, 5)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (196, CAST(N'2019-07-26T13:42:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320754', 2, 95, 6)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (197, CAST(N'2019-04-29T18:19:00.000' AS DateTime), N'Моторное масло Magnatec A3/B4 156E9E', 1, 96, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (198, CAST(N'2019-11-22T14:44:00.000' AS DateTime), N'Моторное масло Longlife III G 052 195 M2', 3, 97, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (199, CAST(N'2019-01-28T08:59:00.000' AS DateTime), N'Моторное масло Mobil 1 FS 153692', 1, 98, 4)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductName], [Quantity], [ProductID], [ClientServiceID]) VALUES (200, CAST(N'2019-05-25T12:03:00.000' AS DateTime), N'Моторное масло ENGINE OIL MZ 320757', 3, 99, 5)
GO
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Шиномонтаж', 19000.0000, 700, N'no description', 0, N'serviceimage\45008C52.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Смена колес', 43000.0000, 890, N'no description', 0, N'serviceimage\E5507A37.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Заправка 92', 45000.0000, 1800, N'no description', 0, N'serviceimage\F460E078.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Заправка 95', 14000.0000, 900, N'no description', 5, N'serviceimage\23F0848B.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Заправка дизель', 34000.0000, 590, N'no description', 0, N'serviceimage\5BE0C351.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Ремонт машины', 940000.0000, 15800, N'no description', 10, N'serviceimage\2E00E06C.jpg')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServicePhoto] ON 

INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (2, 1, N'servicephotoimage\90D0B807.jpg')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (4, 2, N'servicephotoimage\022096CB.jpg')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (5, 3, N'servicephotoimage\B790A6AA.jpg')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (6, 4, N'servicephotoimage\8430842A.jpg')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (7, 5, N'servicephotoimage\F2E0E078.jpg')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (9, 6, N'servicephotoimage\F2E0E078.jpg')
SET IDENTITY_INSERT [dbo].[ServicePhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (1, N'1', N'Black ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (4, N'2', N'Yellow')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (11, N'3', N'Red   ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (12, N'4', N'Green ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (13, N'5', N'White ')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (1, 12)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (2, 13)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (3, 12)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (4, 11)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (5, 1)
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [pr2020] SET  READ_WRITE 
GO

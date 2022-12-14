USE [master]
GO
/****** Object:  Database [SWP392]    Script Date: 8/15/2022 9:18:13 PM ******/
CREATE DATABASE [SWP392]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP392', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWP392.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SWP392_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWP392_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SWP392] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP392].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP392] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP392] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP392] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP392] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP392] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP392] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP392] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP392] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP392] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP392] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP392] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP392] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP392] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP392] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP392] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP392] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP392] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP392] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP392] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP392] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP392] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP392] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP392] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP392] SET  MULTI_USER 
GO
ALTER DATABASE [SWP392] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP392] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP392] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP392] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWP392] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SWP392]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [varchar](50) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[role] [varchar](20) NOT NULL,
	[status] [varchar](5) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bin]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bin](
	[binID] [varchar](50) NOT NULL,
	[inventoryID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[capacity] [int] NOT NULL,
	[available] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[binID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[inventoryID] [int] IDENTITY(1,1) NOT NULL,
	[inputDate] [date] NOT NULL,
	[warranty] [varchar](30) NOT NULL,
	[note] [nvarchar](300) NULL,
	[stockKeeperID] [varchar](50) NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[quantityOnHand] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[inventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Issue](
	[issueID] [int] IDENTITY(1,1) NOT NULL,
	[note] [nvarchar](300) NULL,
	[accountantID] [varchar](50) NOT NULL,
	[sellerID] [varchar](50) NOT NULL,
	[orderID] [int] NOT NULL,
	[DateP] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[issueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](30) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[status] [varchar](13) NOT NULL,
	[note] [nvarchar](300) NULL,
	[deliveryDate] [date] NOT NULL,
	[sellerID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [varchar](50) NOT NULL,
	[model] [varchar](30) NOT NULL,
	[brand] [varchar](50) NOT NULL,
	[status] [varchar](5) NOT NULL,
	[type] [varchar](30) NOT NULL,
	[width] [float] NOT NULL,
	[depth] [float] NOT NULL,
	[height] [float] NOT NULL,
	[screenSize] [float] NOT NULL,
	[voiceRemote] [varchar](8) NOT NULL,
	[bluetooth] [varchar](8) NOT NULL,
	[manufacturingDate] [int] NOT NULL,
	[madeIn] [varchar](30) NOT NULL,
	[quantity] [int] NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Receipt](
	[receiptID] [int] IDENTITY(1,1) NOT NULL,
	[inputDate] [date] NOT NULL,
	[status] [varchar](5) NOT NULL,
	[totalQuantity] [int] NOT NULL,
	[note] [nvarchar](300) NULL,
	[accountantID] [varchar](50) NOT NULL,
	[stockKeeperID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[receiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReceiptDetail](
	[receiptDetailID] [int] IDENTITY(1,1) NOT NULL,
	[quantityInBill] [int] NOT NULL,
	[quantityInShipping] [int] NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[receiptID] [int] NOT NULL,
	[solution] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[receiptDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Report]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[reportID] [int] IDENTITY(1,1) NOT NULL,
	[checkingDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportDetail]    Script Date: 8/15/2022 9:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportDetail](
	[reportDetailID] [int] IDENTITY(1,1) NOT NULL,
	[reportID] [int] NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[quality] [int] NOT NULL,
	[quantityInChecking] [int] NOT NULL,
	[quantity] [int] NULL,
	[note] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[reportDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'ac123', N'Anh Bang', N'AC', N'True', 372837398, N'123')
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'ac456', N'Phuong Anh', N'AC', N'True', 123456789, N'456')
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'mn123', N'Van Khanh', N'MN', N'True', 321456879, N'123')
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'mn456', N'Mai Xuan', N'MN', N'True', 1239874560, N'456')
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'sk123', N'Quang Minh', N'SK', N'True', 321654987, N'123')
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'sk456', N'Lien Minh', N'SK', N'True', 231654879, N'456')
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'sl123', N'Nien Ket', N'SL', N'True', 367514735, N'123')
INSERT [dbo].[Account] ([accountID], [name], [role], [status], [phoneNumber], [password]) VALUES (N'sl456', N'Nhat Ha', N'SL', N'True', 227514753, N'456')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'AF1R1', 1, 50, 100, N'AQ')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'AF2R2', 1, 50, 100, N'AQ')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'AF3R3', 5, 50, 100, N'AQ')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'AF4R4', 8, 50, 100, N'AQ')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'AF5R5', 23, 50, 100, N'CP')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'BF1R1', 24, 20, 100, N'LG')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'BF2R2', 25, 10, 100, N'LG')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'BF3R3', 26, 50, 100, N'LG')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'BF4R4', 27, 40, 100, N'LG')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'BF5R5', 28, 30, 100, N'LG')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'CF1R1', 29, 50, 100, N'SN')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'CF2R2', 30, 50, 100, N'SN')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'CF3R3', 31, 30, 100, N'SN')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'CF4R4', 40, 50, 100, N'SN')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'DF1R1', 41, 50, 100, N'SS')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'DF2R2', 42, 50, 100, N'SS')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'DF3R3', 48, 50, 100, N'TCL')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'DF4R4', 49, 50, 100, N'TCL')
INSERT [dbo].[Bin] ([binID], [inventoryID], [quantity], [capacity], [available]) VALUES (N'DF4R5', 35, 10, 100, N'SN')
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (1, CAST(N'2021-03-20' AS Date), N'Good', NULL, N'sk123', N'AQ-LE43AQT6600UG', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (5, CAST(N'2021-03-21' AS Date), N'Not good', N'50%', N'sk123', N'AQ-LE50AQT6600UG', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (8, CAST(N'2021-03-22' AS Date), N'Good', NULL, N'sk123', N'AQ-LE55AQTS6UG', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (9, CAST(N'2021-03-23' AS Date), N'Good', NULL, N'sk123', N'AQ-LE58AQT6600UG', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (18, CAST(N'2021-03-24' AS Date), N'Good', NULL, N'sk123', N'AQ-LE65AQT6600UG', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (19, CAST(N'2021-03-25' AS Date), N'Good', NULL, N'sk123', N'AQ-LE65AQTS6UG', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (23, CAST(N'2021-03-26' AS Date), N'Not good', N'60%', N'sk123', N'CP-43FX6200', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (24, CAST(N'2021-03-27' AS Date), N'Good', NULL, N'sk123', N'LG-43NANO75TPA', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (25, CAST(N'2021-03-28' AS Date), N'Good', NULL, N'sk123', N'LG-48A1PTA', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (26, CAST(N'2021-03-29' AS Date), N'Good', NULL, N'sk123', N'LG-55NANO75TPA', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (27, CAST(N'2021-03-30' AS Date), N'Good', NULL, N'sk123', N'LG-55UP7550PTC', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (28, CAST(N'2021-03-31' AS Date), N'Good', NULL, N'sk123', N'LG-55UP7750PTB', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (29, CAST(N'2021-04-01' AS Date), N'Good', NULL, N'sk123', N'SN-32W830K', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (30, CAST(N'2021-04-02' AS Date), N'Good', NULL, N'sk123', N'SN-43X75', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (31, CAST(N'2021-04-03' AS Date), N'Good', NULL, N'sk123', N'SN-43X75K', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (32, CAST(N'2021-04-04' AS Date), N'Good', NULL, N'sk123', N'SN-50X75', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (33, CAST(N'2021-04-05' AS Date), N'Good', NULL, N'sk123', N'SN-55X75K', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (34, CAST(N'2021-04-06' AS Date), N'Good', NULL, N'sk123', N'SN-55X80J', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (35, CAST(N'2021-04-07' AS Date), N'Good', NULL, N'sk456', N'SN-55X85J', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (36, CAST(N'2021-04-08' AS Date), N'Good', NULL, N'sk456', N'SN-55X90J', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (37, CAST(N'2021-04-09' AS Date), N'Good', NULL, N'sk456', N'SN-65X75K', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (38, CAST(N'2021-04-10' AS Date), N'Good', NULL, N'sk456', N'SN-65X85J', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (39, CAST(N'2021-04-11' AS Date), N'Good', NULL, N'sk456', N'SN-75X80K', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (40, CAST(N'2021-04-12' AS Date), N'Good', NULL, N'sk456', N'SS-AU7200 ', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (41, CAST(N'2021-04-13' AS Date), N'Good', NULL, N'sk456', N'SS-AU8100', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (42, CAST(N'2021-04-14' AS Date), N'Good', NULL, N'sk456', N'SS-Q65A', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (43, CAST(N'2021-04-15' AS Date), N'Good', NULL, N'sk456', N'SS-T4500 ', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (44, CAST(N'2021-04-16' AS Date), N'Good', NULL, N'sk456', N'SS-T6500 ', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (45, CAST(N'2021-04-17' AS Date), N'Good', NULL, N'sk456', N'TCL-43P615', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (46, CAST(N'2021-04-18' AS Date), N'Good', NULL, N'sk456', N'TCL-43P737', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (47, CAST(N'2021-04-19' AS Date), N'Good', NULL, N'sk456', N'TCL-55P615', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (48, CAST(N'2021-04-20' AS Date), N'Good', NULL, N'sk456', N'TCL-L32S66A', 50)
INSERT [dbo].[Inventory] ([inventoryID], [inputDate], [warranty], [note], [stockKeeperID], [productID], [quantityOnHand]) VALUES (49, CAST(N'2021-04-21' AS Date), N'Not good', N'40%', N'sk456', N'TCL-L43S5200', 50)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
SET IDENTITY_INSERT [dbo].[Issue] ON 

INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (4, N'Implemented', N'ac123', N'sl123', 2, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (5, N'Implemented', N'ac123', N'sl456', 4, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (6, N'Implemented', N'ac123', N'sl456', 7, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (7, N'Implemented', N'ac123', N'sl123', 9, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (8, N'Implementing', N'ac123', N'sl123', 11, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (9, N'Implementing', N'ac456', N'sl456', 12, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (10, N'Implementing', N'ac456', N'sl123', 14, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (11, N'Implementing', N'ac456', N'sl123', 15, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (12, N'Implementing', N'ac456', N'sl456', 17, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (13, N'Implemented', N'ac456', N'sl123', 18, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (14, N'Implemented', N'ac123', N'sl456', 21, CAST(N'2022-08-01' AS Date))
INSERT [dbo].[Issue] ([issueID], [note], [accountantID], [sellerID], [orderID], [DateP]) VALUES (15, N'Implementing', N'ac123', N'sl456', 22, CAST(N'2022-08-02' AS Date))
SET IDENTITY_INSERT [dbo].[Issue] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (1, 20, 2, N'AQ-LE43AQT6600UG')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (3, 40, 2, N'AQ-LE50AQT6600UG')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (4, 30, 4, N'AQ-LE55AQTS6UG')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (5, 20, 4, N'AQ-LE58AQT6600UG')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (7, 30, 7, N'AQ-LE65AQT6600UG')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (8, 10, 7, N'AQ-LE65AQTS6UG')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (9, 20, 9, N'CP-43FX6200')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (11, 30, 9, N'LG-43NANO75TPA')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (12, 20, 11, N'LG-48A1PTA')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (13, 50, 11, N'LG-55NANO75TPA')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (14, 10, 12, N'LG-55UP7550PTC')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (15, 20, 12, N'LG-55UP7750PTB')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (17, 20, 14, N'SN-32W830K')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (18, 30, 14, N'SN-43X75')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (19, 20, 15, N'SN-43X75K')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (20, 20, 15, N'SN-50X75')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (21, 10, 17, N'SN-55X75K')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (22, 20, 17, N'SN-55X80J')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (23, 20, 18, N'LG-48A1PTA')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (24, 20, 18, N'SN-55X85J')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (25, 20, 19, N'SN-55X90J')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (27, 20, 20, N'SN-55X85J')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (28, 20, 20, N'SN-65X75K')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (30, 20, 21, N'SN-65X85J')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (31, 20, 22, N'SS-AU7200 ')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (32, 20, 23, N'SS-AU8100')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (33, 20, 23, N'SS-Q65A')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (34, 20, 25, N'TCL-43P615')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (35, 20, 27, N'TCL-43P737')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (36, 20, 28, N'TCL-55P615')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (37, 20, 29, N'TCL-L32S66A')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (38, 10, 30, N'AQ-LE50AQT6600UG')
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [orderID], [productID]) VALUES (39, 15, 30, N'AQ-LE43AQT6600UG')
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (2, N'Nguyen Van An', N'TPHCM', 123465789, N'Confirm', NULL, CAST(N'2022-08-03' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (4, N'Ngo Van Binh', N'Quang Binh', 321456987, N'Confirm', NULL, CAST(N'2022-08-04' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (7, N'Nguyen Van Cuong', N'Hue', 123654789, N'Confirm', NULL, CAST(N'2022-08-05' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (9, N'Tran Van Duong', N'Ha Tinh', 132456589, N'Confirm', NULL, CAST(N'2022-08-06' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (11, N'Nham Van Em', N'TPHCM', 987652331, N'Confirm', NULL, CAST(N'2022-08-07' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (12, N'Mai Van Phung', N'Nghe An', 123456789, N'Confirm', NULL, CAST(N'2022-08-08' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (14, N'Ha Van Giang', N'Ha Noi', 654223877, N'Not Confirm', N'chat luong tot', CAST(N'2022-08-09' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (15, N'Nguyen Van Ha', N'Ca Mau', 582515160, N'Cancel', NULL, CAST(N'2022-08-10' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (17, N'Pham Van Yen', N'Dong Nai', 265622689, N'Cancel', NULL, CAST(N'2022-08-11' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (18, N'Phan Van Trung', N'Ben Tre', 645658800, N'Cancel', NULL, CAST(N'2022-08-12' AS Date), N'sl123')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (19, N'Ha Van Khoi', N'Vung Tau', 565556658, N'Cancel', NULL, CAST(N'2022-08-13' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (20, N'Dao Van Lam', N'TPHCM', 525521562, N'Cancel', NULL, CAST(N'2022-08-14' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (21, N'Do Van Muoi', N'Ben Tre', 558522212, N'Confirm', NULL, CAST(N'2022-08-15' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (22, N'Khuu Van Na', N'TPHCM', 222254512, N'Confirmed', N'chat luong dom', CAST(N'2022-08-16' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (23, N'Hoang Van Ong', N'Ha Noi', 549849856, N'Cancel', N'', CAST(N'2022-08-17' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (25, N'Ho Van Phuong', N'Nam Dinh', 549898949, N'Cancel', N'', CAST(N'2022-08-18' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (27, N'Nguyen Van Quyen', N'Ha Noi', 625656566, N'Cancel', N'', CAST(N'2022-08-19' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (28, N'Nguyen Thi Ri', N'Hue', 545488236, N'Cancel', N'', CAST(N'2022-08-20' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (29, N'Luong Van Sang', N'TPHCM', 525872133, N'Not Confirm', NULL, CAST(N'2022-08-21' AS Date), N'sl456')
INSERT [dbo].[Orders] ([orderID], [customerName], [address], [phoneNumber], [status], [note], [deliveryDate], [sellerID]) VALUES (30, N'Van Tai', N'12/1 Le Van Viet', 123456789, N'Not Confirm', N'', CAST(N'2022-08-06' AS Date), N'sl123')
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'AQ-LE43AQT6600UG', N'LE43AQT6600UG', N'AQ-AQUA', N'True', N'TV', 50, 1.9, 29, 43, N'Have', N'Have', 2021, N'China', 20, N'Android Tivi AQUA 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'AQ-LE50AQT6600UG', N'LE50AQT6600UG', N'AQ-AQUA', N'True', N'TV', 50.5, 2, 28.6, 50, N'Have', N'Have', 2021, N'China', 40, N'Android Tivi AQUA 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'AQ-LE55AQTS6UG', N'LE55AQTS6UG', N'AQ-AQUA', N'True', N'TV', 50.1, 2, 29.8, 55, N'Have', N'Have', 2021, N'China', 30, N'Android Tivi AQUA 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'AQ-LE58AQT6600UG', N'LE58AQT6600UG', N'AQ-AQUA', N'True', N'TV', 50, 2, 30, 58, N'Have', N'Have', 2021, N'China', 20, N'Android Tivi AQUA 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'AQ-LE65AQT6600UG', N'LE65AQT6600UG', N'AQ-AQUA', N'True', N'TV', 52, 2.1, 30.1, 65, N'Have', N'Have', 2021, N'China', 30, N'Android Tivi AQUA 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'AQ-LE65AQTS6UG', N'LE65AQTS6UG', N'AQ-AQUA', N'True', N'TV', 52, 2.1, 30.1, 65, N'Have', N'Have', 2021, N'China', 10, N'Android Tivi AQUA 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'CP-43FX6200', N'43FX6200', N'CP-CASPER', N'True', N'TV', 41, 1.6, 27.5, 43, N'No', N'No', 2020, N'ThaiLand', 20, N'Smart Tivi Casper')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'LG-43NANO75TPA', N'43NANO75TPA', N'LG-LUCKY GOLDSTAR', N'True', N'TV', 49, 2.5, 29, 50, N'No', N'No', 2022, N'Korea', 10, N'Smart Tivi NanoCell LG 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'LG-48A1PTA', N'48A1PTA', N'LG-LUCKY GOLDSTAR', N'True', N'TV', 50.5, 1.8, 29.3, 54.5, N'Have', N'Have', 2021, N'Korea', 10, N'Smart Tivi OLED LG 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'LG-55NANO75TPA', N'55NANO75TPA', N'LG-LUCKY GOLDSTAR', N'True', N'TV', 50, 2.7, 27, 55, N'Have', N'Have', 2021, N'Korea', 10, N'Smart Tivi NanoCell LG 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'LG-55UP7550PTC', N'55UP7550PTC', N'LG-LUCKY GOLDSTAR', N'True', N'TV', 49.3, 2.5, 27, 55, N'No', N'No', 2021, N'Korea', 10, N'Smart Tivi LG 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'LG-55UP7750PTB', N'55UP7750PTB', N'LG-LUCKY GOLDSTAR', N'True', N'TV', 48, 2.9, 28.3, 55, N'Have', N'Have', 2021, N'Korea', 10, N'Smart Tivi LG 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-32W830K', N'32W830K', N'SN-SONY', N'True', N'TV', 50, 1.9, 30, 45, N'No', N'No', 2020, N'Japan', 20, N'Google Tivi Sony')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-43X75', N'43X75', N'SN-SONY', N'True', N'TV', 38.2, 2, 28, 43, N'No ', N'No', 2020, N'Japan', 50, N'Android Tivi Sony 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-43X75K', N'43X75K', N'SN-SONY', N'True', N'TV', 47, 1.7, 27.8, 43, N'No', N'No', 2022, N'Japan', 20, N'Google Tivi Sony 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-50X75', N'50X75', N'SN-SONY', N'True', N'TV', 50, 2.3, 29.5, 50, N'Have', N'Have', 2022, N'Japan', 10, N'Android Tivi Sony 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-55X75K', N'55X75K', N'SN-SONY', N'True', N'TV', 45, 2.1, 30, 55, N'Have', N'Have', 2021, N'Japan', 30, N'Google Tivi Sony 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-55X80J', N'55X80J', N'SN-SONY', N'True', N'TV', 49.5, 2.3, 30, 55, N'Have', N'Have', 2021, N'Japan', 20, N'Android Tivi Sony 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-55X85J', N'55X85J', N'SN-SONY', N'True', N'TV', 50.1, 2, 26.8, 55, N'No', N'No', 2022, N'Japan', 10, N'Android Tivi Sony 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-55X90J', N'55X90J', N'SN-SONY', N'True', N'TV', 51, 2, 28.6, 55, N'Have', N'Have', 2021, N'Japan', 30, N'Android Tivi Sony 4K ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-65X75K', N'65X75K', N'SN-SONY', N'True', N'TV', 53, 2, 30, 65, N'Have', N'Have', 2022, N'Japan', 10, N'Google Tivi Sony 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-65X85J', N'65X85J', N'SN-SONY', N'True', N'TV', 53, 1.9, 30, 65, N'Have', N'Have', 2021, N'Japan', 20, N'Android Tivi Sony 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SN-75X80K', N'75X80K', N'SN-SONY', N'True', N'TV', 55, 2.1, 31, 74, N'Have', N'Have', 2021, N'Japan', 20, N'Google Tivi Sony')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SS-AU7200 ', N'AU7200 ', N'SS-SAMSUNG', N'True', N'TV', 48.4, 2, 27.3, 55, N'No', N'No', 2021, N'Korea', 10, N'Smart Tivi Samsung 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SS-AU8100', N'AU8100', N'SS-SAMSUNG', N'True', N'TV', 48.5, 2, 30.2, 55, N'Have', N'Have', 2021, N'Korea', 50, N'Smart Tivi Samsung 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SS-Q65A', N'Q65A', N'SS-SAMSUNG', N'True', N'TV', 40.2, 1.8, 30, 50, N'Have', N'Have', 2021, N'Korea', 10, N'Smart Tivi QLED ')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SS-T4500 ', N'T4500 ', N'SS-SAMSUNG', N'True', N'TV', 51, 3.1, 29.5, 44.5, N'Have', N'Have', 2020, N'Korea', 10, N'Smart Tivi Samsung')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'SS-T6500 ', N'T6500 ', N'SS-SAMSUNG', N'True', N'TV', 50, 3, 27, 43, N'No', N'No', 2020, N'Korea', 20, N'Smart Tivi Samsung')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'TCL-43P615', N'43P615', N'TCL-Telephone Communication Limited', N'True', N'TV', 48, 1.5, 28, 43, N'Have', N'Have', 2021, N'China', 20, N'Android Tivi TCL')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'TCL-43P737', N'43P737', N'TCL-Telephone Communication Limited', N'True', N'TV', 38, 1.6, 25, 43, N'No', N'No', 2022, N'China', 10, N'Google Tivi TCL 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'TCL-55P615', N'55P615', N'TCL-Telephone Communication Limited', N'True', N'TV', 48.5, 1.7, 29, 55, N'No', N'No', 2022, N'China', 50, N'Android Tivi TCL 4K')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'TCL-L32S66A', N'L32S66A', N'TCL-Telephone Communication Limited', N'True', N'TV', 37, 1.2, 24, 32, N'No', N'No', 2022, N'China', 10, N'Android Tivi TCL')
INSERT [dbo].[Product] ([productID], [model], [brand], [status], [type], [width], [depth], [height], [screenSize], [voiceRemote], [bluetooth], [manufacturingDate], [madeIn], [quantity], [name]) VALUES (N'TCL-L43S5200', N'L43S5200', N'TCL-Telephone Communication Limited', N'True', N'TV', 48, 1.5, 28, 43, N'Have', N'Have', 2021, N'China', 10, N'Android Tivi TCL')
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (1, CAST(N'2022-07-29' AS Date), N'False', 50, NULL, N'ac123', N'sk123')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (3, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac123', N'sk123')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (4, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac123', N'sk123')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (5, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac123', N'sk123')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (6, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac123', N'sk123')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (7, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac456', N'sk456')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (8, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac456', N'sk456')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (9, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac456', N'sk456')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (10, CAST(N'2022-07-31' AS Date), N'True', 50, NULL, N'ac456', N'sk456')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (11, CAST(N'2022-07-31' AS Date), N'False', 50, NULL, N'ac456', N'sk456')
INSERT [dbo].[Receipt] ([receiptID], [inputDate], [status], [totalQuantity], [note], [accountantID], [stockKeeperID]) VALUES (12, CAST(N'2022-08-02' AS Date), N'False', 10, N'', N'ac123', N'sk456')
SET IDENTITY_INSERT [dbo].[Receipt] OFF
SET IDENTITY_INSERT [dbo].[ReceiptDetail] ON 

INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (1, 50, 40, N'SS-AU8100', 1, N'Compensate 10 SS-AU8100 next time')
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (3, 50, 50, N'AQ-LE43AQT6600UG', 1, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (4, 50, 50, N'AQ-LE58AQT6600UG', 3, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (7, 50, 50, N'AQ-LE43AQT6600UG', 3, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (9, 50, 50, N'AQ-LE65AQT6600UG', 4, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (11, 50, 50, N'AQ-LE43AQT6600UG', 4, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (12, 50, 50, N'CP-43FX6200', 5, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (13, 50, 50, N'LG-43NANO75TPA', 5, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (15, 50, 50, N'LG-48A1PTA', 6, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (17, 50, 50, N'LG-55NANO75TPA', 6, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (19, 50, 50, N'AQ-LE43AQT6600UG', 7, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (20, 50, 50, N'LG-55UP7550PTC', 7, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (21, 50, 50, N'SN-32W830K', 8, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (22, 50, 50, N'SN-43X75', 8, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (24, 50, 50, N'SN-43X75K', 9, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (25, 50, 50, N'SS-AU7200 ', 9, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (26, 50, 50, N'SS-AU8100', 10, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (27, 50, 50, N'SS-Q65A', 10, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (28, 50, 50, N'TCL-43P615', 11, NULL)
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (29, 50, 35, N'TCL-55P615', 11, N'Compensate 15 TCL-55P615G next time')
INSERT [dbo].[ReceiptDetail] ([receiptDetailID], [quantityInBill], [quantityInShipping], [productID], [receiptID], [solution]) VALUES (30, 10, 12, N'AQ-LE50AQT6600UG', 12, N'hang giao du')
SET IDENTITY_INSERT [dbo].[ReceiptDetail] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (1, CAST(N'2022-07-30' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (2, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (3, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (4, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (5, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (6, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (7, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (8, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (9, CAST(N'2022-08-02' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (10, CAST(N'2022-07-31' AS Date))
INSERT [dbo].[Report] ([reportID], [checkingDate]) VALUES (11, CAST(N'2022-08-02' AS Date))
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[ReportDetail] ON 

INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (1, 1, N'AQ-LE43AQT6600UG', 100, 180, 200, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (2, 1, N'AQ-LE50AQT6600UG', 40, 40, 40, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (3, 2, N'AQ-LE55AQTS6UG', 30, 30, 30, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (4, 2, N'AQ-LE58AQT6600UG', 20, 20, 20, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (5, 3, N'CP-43FX6200', 20, 20, 20, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (6, 3, N'LG-43NANO75TPA', 40, 40, 40, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (7, 4, N'LG-48A1PTA', 30, 30, 30, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (8, 4, N'LG-55NANO75TPA', 10, 10, 10, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (9, 5, N'LG-55UP7550PTC', 20, 20, 20, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (10, 5, N'SN-32W830K', 20, 20, 20, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (11, 6, N'SN-43X75', 10, 10, 10, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (12, 6, N'SN-43X75K', 40, 40, 40, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (13, 7, N'SN-50X75', 10, 10, 10, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (14, 7, N'SN-55X75K', 40, 40, 40, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (15, 8, N'SS-AU7200 ', 10, 10, 10, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (16, 8, N'SS-AU8100', 50, 50, 50, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (17, 9, N'SS-Q65A', 10, 10, 10, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (18, 9, N'TCL-43P615', 20, 20, 20, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (19, 10, N'TCL-43P737', 10, 10, 10, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (20, 10, N'TCL-55P615', 50, 50, 50, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (21, 10, N'TCL-L32S66A', 10, 10, 10, NULL)
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (22, 11, N'AQ-LE50AQT6600UG', 30, 35, 40, N'thieu hang')
INSERT [dbo].[ReportDetail] ([reportDetailID], [reportID], [productID], [quality], [quantityInChecking], [quantity], [note]) VALUES (23, 11, N'AQ-LE43AQT6600UG', 30, 20, 20, N'')
SET IDENTITY_INSERT [dbo].[ReportDetail] OFF
ALTER TABLE [dbo].[Bin]  WITH CHECK ADD FOREIGN KEY([inventoryID])
REFERENCES [dbo].[Inventory] ([inventoryID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD FOREIGN KEY([accountantID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD FOREIGN KEY([sellerID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([sellerID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD FOREIGN KEY([accountantID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD FOREIGN KEY([stockKeeperID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD FOREIGN KEY([receiptID])
REFERENCES [dbo].[Receipt] ([receiptID])
GO
ALTER TABLE [dbo].[ReportDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ReportDetail]  WITH CHECK ADD FOREIGN KEY([reportID])
REFERENCES [dbo].[Report] ([reportID])
GO
USE [master]
GO
ALTER DATABASE [SWP392] SET  READ_WRITE 
GO

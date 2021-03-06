USE [master]
GO
/****** Object:  Database [GoodsInShop]    Script Date: 15.12.2013 20:24:03 ******/
CREATE DATABASE [GoodsInShop]
 CONTAINMENT = NONE
GO
ALTER DATABASE [GoodsInShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GoodsInShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GoodsInShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GoodsInShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GoodsInShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GoodsInShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GoodsInShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [GoodsInShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GoodsInShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GoodsInShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GoodsInShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GoodsInShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GoodsInShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GoodsInShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GoodsInShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GoodsInShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GoodsInShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GoodsInShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GoodsInShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GoodsInShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GoodsInShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GoodsInShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GoodsInShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GoodsInShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GoodsInShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GoodsInShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GoodsInShop] SET  MULTI_USER 
GO
ALTER DATABASE [GoodsInShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GoodsInShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GoodsInShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GoodsInShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [GoodsInShop]
GO
/****** Object:  Table [dbo].[Contractors]    Script Date: 15.12.2013 20:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[EMail] [nvarchar](max) NULL,
	[ContractorTypeId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Contractors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractorTypes]    Script Date: 15.12.2013 20:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractorTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ContractorTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsDescriptions]    Script Date: 15.12.2013 20:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsDescriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CurrentPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.GoodsDescriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsRecords]    Script Date: 15.12.2013 20:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionPrice] [decimal](18, 2) NULL,
	[ActionDateTime] [datetime] NULL,
	[Amount] [int] NOT NULL,
	[GoodsRecordsTypeId] [int] NOT NULL,
	[ContractorId] [int] NULL,
	[GoodsDescriptionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.GoodsRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsRecordsTypes]    Script Date: 15.12.2013 20:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsRecordsTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.GoodsRecordsTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_ContractorTypeId]    Script Date: 15.12.2013 20:24:03 ******/
CREATE NONCLUSTERED INDEX [IX_ContractorTypeId] ON [dbo].[Contractors]
(
	[ContractorTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContractorId]    Script Date: 15.12.2013 20:24:03 ******/
CREATE NONCLUSTERED INDEX [IX_ContractorId] ON [dbo].[GoodsRecords]
(
	[ContractorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsDescriptionId]    Script Date: 15.12.2013 20:24:03 ******/
CREATE NONCLUSTERED INDEX [IX_GoodsDescriptionId] ON [dbo].[GoodsRecords]
(
	[GoodsDescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsRecordsTypeId]    Script Date: 15.12.2013 20:24:03 ******/
CREATE NONCLUSTERED INDEX [IX_GoodsRecordsTypeId] ON [dbo].[GoodsRecords]
(
	[GoodsRecordsTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contractors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contractors_dbo.ContractorTypes_ContractorTypeId] FOREIGN KEY([ContractorTypeId])
REFERENCES [dbo].[ContractorTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contractors] CHECK CONSTRAINT [FK_dbo.Contractors_dbo.ContractorTypes_ContractorTypeId]
GO
ALTER TABLE [dbo].[GoodsRecords]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GoodsRecords_dbo.Contractors_ContractorId] FOREIGN KEY([ContractorId])
REFERENCES [dbo].[Contractors] ([Id])
GO
ALTER TABLE [dbo].[GoodsRecords] CHECK CONSTRAINT [FK_dbo.GoodsRecords_dbo.Contractors_ContractorId]
GO
ALTER TABLE [dbo].[GoodsRecords]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GoodsRecords_dbo.GoodsDescriptions_GoodsDescriptionId] FOREIGN KEY([GoodsDescriptionId])
REFERENCES [dbo].[GoodsDescriptions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsRecords] CHECK CONSTRAINT [FK_dbo.GoodsRecords_dbo.GoodsDescriptions_GoodsDescriptionId]
GO
ALTER TABLE [dbo].[GoodsRecords]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GoodsRecords_dbo.GoodsRecordsTypes_GoodsRecordsTypeId] FOREIGN KEY([GoodsRecordsTypeId])
REFERENCES [dbo].[GoodsRecordsTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsRecords] CHECK CONSTRAINT [FK_dbo.GoodsRecords_dbo.GoodsRecordsTypes_GoodsRecordsTypeId]
GO
USE [master]
GO
ALTER DATABASE [GoodsInShop] SET  READ_WRITE 
GO

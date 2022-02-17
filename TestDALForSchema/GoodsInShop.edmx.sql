
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/15/2013 16:37:03
-- Generated from EDMX file: E:\Work_freelance\HomeWork_By_C#\HomeWorkCSharp\HomeWorkCSharp.DataAccessLayer\GoodsInShop.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GoodsInShop];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ContractorContractorType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contractor] DROP CONSTRAINT [FK_ContractorContractorType];
GO
IF OBJECT_ID(N'[dbo].[FK_GoodsRecordsContractor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GoodsRecords] DROP CONSTRAINT [FK_GoodsRecordsContractor];
GO
IF OBJECT_ID(N'[dbo].[FK_GoodsRecordsGoodsRecordsType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GoodsRecords] DROP CONSTRAINT [FK_GoodsRecordsGoodsRecordsType];
GO
IF OBJECT_ID(N'[dbo].[FK_GoodsRecordsGoodsDescription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GoodsRecords] DROP CONSTRAINT [FK_GoodsRecordsGoodsDescription];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[GoodsDescription]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GoodsDescription];
GO
IF OBJECT_ID(N'[dbo].[Contractor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contractor];
GO
IF OBJECT_ID(N'[dbo].[GoodsRecords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GoodsRecords];
GO
IF OBJECT_ID(N'[dbo].[ContractorType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContractorType];
GO
IF OBJECT_ID(N'[dbo].[GoodsRecordsType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GoodsRecordsType];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'GoodsDescription'
CREATE TABLE [dbo].[GoodsDescription] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CurrentPrice] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Contractor'
CREATE TABLE [dbo].[Contractor] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NULL,
    [EMail] nvarchar(max)  NULL,
    [ContractorTypeId] int  NOT NULL
);
GO

-- Creating table 'GoodsRecords'
CREATE TABLE [dbo].[GoodsRecords] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ActionPrice] decimal(18,0)  NULL,
    [ActionDateTime] datetime  NULL,
    [Amount] int  NOT NULL,
    [ContractorId] int  NULL,
    [GoodsRecordsTypeId] int  NOT NULL,
    [GoodsDescriptionId] int  NOT NULL
);
GO

-- Creating table 'ContractorType'
CREATE TABLE [dbo].[ContractorType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'GoodsRecordsType'
CREATE TABLE [dbo].[GoodsRecordsType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'GoodsDescription'
ALTER TABLE [dbo].[GoodsDescription]
ADD CONSTRAINT [PK_GoodsDescription]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contractor'
ALTER TABLE [dbo].[Contractor]
ADD CONSTRAINT [PK_Contractor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GoodsRecords'
ALTER TABLE [dbo].[GoodsRecords]
ADD CONSTRAINT [PK_GoodsRecords]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ContractorType'
ALTER TABLE [dbo].[ContractorType]
ADD CONSTRAINT [PK_ContractorType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GoodsRecordsType'
ALTER TABLE [dbo].[GoodsRecordsType]
ADD CONSTRAINT [PK_GoodsRecordsType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ContractorTypeId] in table 'Contractor'
ALTER TABLE [dbo].[Contractor]
ADD CONSTRAINT [FK_ContractorContractorType]
    FOREIGN KEY ([ContractorTypeId])
    REFERENCES [dbo].[ContractorType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ContractorContractorType'
CREATE INDEX [IX_FK_ContractorContractorType]
ON [dbo].[Contractor]
    ([ContractorTypeId]);
GO

-- Creating foreign key on [ContractorId] in table 'GoodsRecords'
ALTER TABLE [dbo].[GoodsRecords]
ADD CONSTRAINT [FK_GoodsRecordsContractor]
    FOREIGN KEY ([ContractorId])
    REFERENCES [dbo].[Contractor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GoodsRecordsContractor'
CREATE INDEX [IX_FK_GoodsRecordsContractor]
ON [dbo].[GoodsRecords]
    ([ContractorId]);
GO

-- Creating foreign key on [GoodsRecordsTypeId] in table 'GoodsRecords'
ALTER TABLE [dbo].[GoodsRecords]
ADD CONSTRAINT [FK_GoodsRecordsGoodsRecordsType]
    FOREIGN KEY ([GoodsRecordsTypeId])
    REFERENCES [dbo].[GoodsRecordsType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GoodsRecordsGoodsRecordsType'
CREATE INDEX [IX_FK_GoodsRecordsGoodsRecordsType]
ON [dbo].[GoodsRecords]
    ([GoodsRecordsTypeId]);
GO

-- Creating foreign key on [GoodsDescriptionId] in table 'GoodsRecords'
ALTER TABLE [dbo].[GoodsRecords]
ADD CONSTRAINT [FK_GoodsRecordsGoodsDescription]
    FOREIGN KEY ([GoodsDescriptionId])
    REFERENCES [dbo].[GoodsDescription]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GoodsRecordsGoodsDescription'
CREATE INDEX [IX_FK_GoodsRecordsGoodsDescription]
ON [dbo].[GoodsRecords]
    ([GoodsDescriptionId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
USE [GoodsInShop];
GO

if not exists (select * from ContractorType where Value = '���������')
	INSERT INTO ContractorType ([Value]) VALUES ( '���������')
GO

if not exists (select * from ContractorType where Value = '����������')
	INSERT INTO ContractorType ([Value]) VALUES ( '����������')
GO

if not exists (select * from GoodsRecordsType where Value = '����������� ������')
	INSERT INTO GoodsRecordsType ([Value]) VALUES ( '����������� ������')
GO

if not exists (select * from GoodsRecordsType where Value = '���������� ������')
	INSERT INTO GoodsRecordsType ([Value]) VALUES ( '���������� ������')
GO

if not exists (select * from GoodsRecordsType where Value = '������ � ��������')
	INSERT INTO GoodsRecordsType ([Value]) VALUES ( '������ � ��������')
GO

DECLARE @ContractorTypeSupplier AS INT
SET @ContractorTypeSupplier = ( SELECT Id FROM ContractorType WHERE Value = '���������' )

DECLARE @ContractorTypeCustomer AS INT
SET @ContractorTypeCustomer = ( SELECT Id FROM ContractorType WHERE Value = '����������' )


DECLARE @GoodsRecordsTypeSuppliedGoods AS INT
SET @GoodsRecordsTypeSuppliedGoods = ( SELECT Id FROM GoodsRecordsType WHERE Value = '����������� ������' )

DECLARE @GoodsRecordsTypeShippedGoods AS INT
SET @GoodsRecordsTypeShippedGoods = ( SELECT Id FROM GoodsRecordsType WHERE Value = '���������� ������' )

DECLARE @GoodsRecordsTypeStoredGoods AS INT
SET @GoodsRecordsTypeStoredGoods = ( SELECT Id FROM GoodsRecordsType WHERE Value = '������ � ��������' )


if not exists (select * from [dbo].[Contractor] where Name = '��� ���� �����')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ���� �����'
           ,'8-836-555-45-76'
           ,'cuba_libre@mail.ru'
           , @ContractorTypeSupplier)

if not exists (select * from [dbo].[Contractor] where Name = '��� ������')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ������'
           ,'8-836-332-34-67'
           ,'meaty@mail.ru'
           ,@ContractorTypeSupplier)

if not exists (select * from [dbo].[Contractor] where Name = '��� �������� ������')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� �������� ������'
           ,'8-836-346-12-58'
           ,'seltov@mail.ru'
           ,@ContractorTypeSupplier)

if not exists (select * from [dbo].[Contractor] where Name = '��� ��������� ����')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ��������� ����'
           ,'8-833-475-33-22'
           ,'rohan_vines@mail.ru'
           ,@ContractorTypeCustomer)

if not exists (select * from [dbo].[Contractor] where Name = '��� ��� ��������')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ��� ��������'
           ,'8-836-142-56-12'
           ,'tri_bogatirja@mail.ru'
           ,@ContractorTypeCustomer)

if not exists (select * from [dbo].[Contractor] where Name = '��� ��������')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ��������'
           ,'8-836-657-33-92'
           ,'pivodrom@mail.ru'
           ,@ContractorTypeCustomer)

DECLARE @ContractorCubaLibre AS INT
SET @ContractorCubaLibre = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = '��� ���� �����' )

DECLARE @ContractorMeaty AS INT
SET @ContractorMeaty = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = '��� ������' )

DECLARE @ContractorFarmersGoods AS INT
SET @ContractorFarmersGoods = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = '��� �������� ������' )

DECLARE @ContractorRohanVines AS INT
SET @ContractorRohanVines = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = '��� ��������� ����' )

DECLARE @ContractorTriBogatirja AS INT
SET @ContractorTriBogatirja = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = '��� ��� ��������' )

DECLARE @ContractorPivodrom AS INT
SET @ContractorPivodrom = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = '��� ��������' )

if not exists (select * from [dbo].[GoodsDescription] where Name = '����� \"��������\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('����� \"��������\"'
           ,'38')

if not exists (select * from [dbo].[GoodsDescription] where Name = '�������� \"����������\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('�������� \"����������\"'
           ,'235')

if not exists (select * from [dbo].[GoodsDescription] where Name = '������� \"���������\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('������� \"���������\"'
           ,'330')

if not exists (select * from [dbo].[GoodsDescription] where Name = '�������� \"���� ������\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('�������� \"���� ������\"'
           ,'135')

if not exists (select * from [dbo].[GoodsDescription] where Name = '������� \"������ �����\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('������� \"������ �����\"'
           ,'195')


if not exists (select * from [dbo].[GoodsDescription] where Name = '���� \"��������\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('���� \"��������\"'
           ,'150')

DECLARE @GoodsDescriptionCheaps AS INT
SET @GoodsDescriptionCheaps = ( SELECT Id FROM GoodsDescription WHERE Name = '����� \"��������\"' )

DECLARE @GoodsDescriptionStreleckaja AS INT
SET @GoodsDescriptionStreleckaja = ( SELECT Id FROM GoodsDescription WHERE Name = '�������� \"����������\"' )

DECLARE @GoodsDescriptionCubanskij AS INT
SET @GoodsDescriptionCubanskij = ( SELECT Id FROM GoodsDescription WHERE Name = '������� \"���������\"' )

DECLARE @GoodsDescriptionPistachios AS INT
SET @GoodsDescriptionPistachios = ( SELECT Id FROM GoodsDescription WHERE Name = '�������� \"���� ������\"' )

DECLARE @GoodsDescriptionKingArtur AS INT
SET @GoodsDescriptionKingArtur = ( SELECT Id FROM GoodsDescription WHERE Name = '������� \"������ �����\"' )

DECLARE @GoodsDescriptionHeiniken AS INT
SET @GoodsDescriptionHeiniken = ( SELECT Id FROM GoodsDescription WHERE Name = '���� \"��������\"' )

-- ������������ ������ ������� ---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (25
           ,GETDATE()
           ,110
           ,@ContractorFarmersGoods
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionCheaps)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (25
           ,GETDATE()
           ,50
           ,@ContractorFarmersGoods
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionCheaps)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (150
           ,GETDATE()
           ,10
           ,@ContractorCubaLibre
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionStreleckaja)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (150
           ,GETDATE()
           ,15
           ,@ContractorCubaLibre
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionStreleckaja)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (250
           ,GETDATE()
           ,20
           ,@ContractorCubaLibre
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionCubanskij)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (95
           ,GETDATE()
           ,200
           ,@ContractorFarmersGoods
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionPistachios)
		   
INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (150
           ,GETDATE()
           ,100
           ,@ContractorMeaty
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionKingArtur)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (100
           ,GETDATE()
           ,100
           ,@ContractorMeaty
           ,@GoodsRecordsTypeSuppliedGoods
           ,@GoodsDescriptionHeiniken)

-- ������ ������� ����������� � �������� -----------------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]           
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (80
           ,@GoodsRecordsTypeStoredGoods
           ,@GoodsDescriptionCheaps)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (18
           ,@GoodsRecordsTypeStoredGoods
           ,@GoodsDescriptionStreleckaja)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (12
           ,@GoodsRecordsTypeStoredGoods
           ,@GoodsDescriptionCubanskij)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (80
           ,@GoodsRecordsTypeStoredGoods
           ,@GoodsDescriptionPistachios)
		   
INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (40
           ,@GoodsRecordsTypeStoredGoods
           ,@GoodsDescriptionKingArtur)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (60
           ,@GoodsRecordsTypeStoredGoods
           ,@GoodsDescriptionHeiniken)

-- ��������� ������ �������, ������������ ����������� ----------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (38
           ,GETDATE()
           ,30
           ,@ContractorPivodrom
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionCheaps)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (38
           ,GETDATE()
           ,50
           ,@ContractorTriBogatirja
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionCheaps)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (235
           ,GETDATE()
           ,3
           ,@ContractorRohanVines
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionStreleckaja)
		   
INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (235
           ,GETDATE()
           ,4
           ,@ContractorTriBogatirja
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionStreleckaja)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (330
           ,GETDATE()
           ,8
           ,@ContractorRohanVines
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionCubanskij)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (135
           ,GETDATE()
           ,120
           ,@ContractorPivodrom
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionPistachios)
		   
INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (195
           ,GETDATE()
           ,60
           ,@ContractorTriBogatirja
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionKingArtur)

INSERT INTO [dbo].[GoodsRecords]
           ([ActionPrice]
           ,[ActionDateTime]
           ,[Amount]
           ,[ContractorId]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (150
           ,GETDATE()
           ,40
           ,@ContractorPivodrom
           ,@GoodsRecordsTypeShippedGoods
           ,@GoodsDescriptionHeiniken)
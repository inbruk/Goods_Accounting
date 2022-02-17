USE [GoodsInShop];
GO
-- �������������� ����� ��������� �� �����, ��� ������� � �������������, � ����� Seed()

--if not exists (select * from ContractorTypes where Value = '���������')
--	INSERT INTO ContractorTypes ([Value]) VALUES ( '���������')
--GO

--if not exists (select * from ContractorTypes where Value = '����������')
--	INSERT INTO ContractorTypes ([Value]) VALUES ( '����������')
--GO

--if not exists (select * from GoodsRecordsTypes where Value = '����������� ������')
--	INSERT INTO GoodsRecordsTypes ([Value]) VALUES ( '����������� ������')
--GO

--if not exists (select * from GoodsRecordsTypes where Value = '���������� ������')
--	INSERT INTO GoodsRecordsTypes ([Value]) VALUES ( '���������� ������')
--GO

--if not exists (select * from GoodsRecordsTypes where Value = '������ � ��������')
--	INSERT INTO GoodsRecordsTypes ([Value]) VALUES ( '������ � ��������')
--GO

DECLARE @ContractorTypesSupplier AS INT
SET @ContractorTypesSupplier = ( SELECT Id FROM ContractorTypes WHERE Value = '���������' )

DECLARE @ContractorTypesCustomer AS INT
SET @ContractorTypesCustomer = ( SELECT Id FROM ContractorTypes WHERE Value = '����������' )


DECLARE @GoodsRecordsTypesSuppliedGoods AS INT
SET @GoodsRecordsTypesSuppliedGoods = ( SELECT Id FROM GoodsRecordsTypes WHERE Value = '����������� ������' )

DECLARE @GoodsRecordsTypesShippedGoods AS INT
SET @GoodsRecordsTypesShippedGoods = ( SELECT Id FROM GoodsRecordsTypes WHERE Value = '���������� ������' )

DECLARE @GoodsRecordsTypesStoredGoods AS INT
SET @GoodsRecordsTypesStoredGoods = ( SELECT Id FROM GoodsRecordsTypes WHERE Value = '������ � ��������' )


if not exists (select * from [dbo].[Contractors] where Name = '��� ���� �����')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ���� �����'
           ,'8-836-555-45-76'
           ,'cuba_libre@mail.ru'
           , @ContractorTypesSupplier)

if not exists (select * from [dbo].[Contractors] where Name = '��� ������')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ������'
           ,'8-836-332-34-67'
           ,'meaty@mail.ru'
           ,@ContractorTypesSupplier)

if not exists (select * from [dbo].[Contractors] where Name = '��� �������� ������')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� �������� ������'
           ,'8-836-346-12-58'
           ,'seltov@mail.ru'
           ,@ContractorTypesSupplier)

if not exists (select * from [dbo].[Contractors] where Name = '��� ��������� ����')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ��������� ����'
           ,'8-833-475-33-22'
           ,'rohan_vines@mail.ru'
           ,@ContractorTypesCustomer)

if not exists (select * from [dbo].[Contractors] where Name = '��� ��� ��������')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ��� ��������'
           ,'8-836-142-56-12'
           ,'tri_boga@mail.ru'
           ,@ContractorTypesCustomer)

if not exists (select * from [dbo].[Contractors] where Name = '��� ��������')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    '��� ��������'
           ,'8-836-657-33-92'
           ,'pivodrom@mail.ru'
           ,@ContractorTypesCustomer)

DECLARE @ContractorCubaLibre AS INT
SET @ContractorCubaLibre = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = '��� ���� �����' )

DECLARE @ContractorMeaty AS INT
SET @ContractorMeaty = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = '��� ������' )

DECLARE @ContractorFarmersGoods AS INT
SET @ContractorFarmersGoods = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = '��� �������� ������' )

DECLARE @ContractorRohanVines AS INT
SET @ContractorRohanVines = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = '��� ��������� ����' )

DECLARE @ContractorTriBogatirja AS INT
SET @ContractorTriBogatirja = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = '��� ��� ��������' )

DECLARE @ContractorPivodrom AS INT
SET @ContractorPivodrom = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = '��� ��������' )

if not exists (select * from [dbo].[GoodsDescriptions] where Name = '����� "��������"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('����� "��������"'
           ,'38')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = '�������� "����������"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('�������� "����������"'
           ,'235')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = '������� "���������"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('������� "���������"'
           ,'330')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = '�������� "���� ������"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('�������� "���� ������"'
           ,'135')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = '������� "������ �����"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('������� "������ �����"'
           ,'195')


if not exists (select * from [dbo].[GoodsDescriptions] where Name = '���� "��������"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('���� "��������"'
           ,'150')

DECLARE @GoodsDescriptionCheaps AS INT
SET @GoodsDescriptionCheaps = ( SELECT Id FROM GoodsDescriptions WHERE Name = '����� "��������"' )

DECLARE @GoodsDescriptionStreleckaja AS INT
SET @GoodsDescriptionStreleckaja = ( SELECT Id FROM GoodsDescriptions WHERE Name = '�������� "����������"' )

DECLARE @GoodsDescriptionCubanskij AS INT
SET @GoodsDescriptionCubanskij = ( SELECT Id FROM GoodsDescriptions WHERE Name = '������� "���������"' )

DECLARE @GoodsDescriptionPistachios AS INT
SET @GoodsDescriptionPistachios = ( SELECT Id FROM GoodsDescriptions WHERE Name = '�������� "���� ������"' )

DECLARE @GoodsDescriptionKingArtur AS INT
SET @GoodsDescriptionKingArtur = ( SELECT Id FROM GoodsDescriptions WHERE Name = '������� "������ �����"' )

DECLARE @GoodsDescriptionHeiniken AS INT
SET @GoodsDescriptionHeiniken = ( SELECT Id FROM GoodsDescriptions WHERE Name = '���� "��������"' )

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
           ,@GoodsRecordsTypesSuppliedGoods
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
           ,@GoodsRecordsTypesSuppliedGoods
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
           ,@GoodsRecordsTypesSuppliedGoods
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
           ,@GoodsRecordsTypesSuppliedGoods
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
           ,@GoodsRecordsTypesSuppliedGoods
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
           ,@GoodsRecordsTypesSuppliedGoods
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
           ,@GoodsRecordsTypesSuppliedGoods
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
           ,@GoodsRecordsTypesSuppliedGoods
           ,@GoodsDescriptionHeiniken)

-- ������ ������� ����������� � �������� -----------------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]           
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (80
           ,@GoodsRecordsTypesStoredGoods
           ,@GoodsDescriptionCheaps)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (18
           ,@GoodsRecordsTypesStoredGoods
           ,@GoodsDescriptionStreleckaja)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (12
           ,@GoodsRecordsTypesStoredGoods
           ,@GoodsDescriptionCubanskij)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (80
           ,@GoodsRecordsTypesStoredGoods
           ,@GoodsDescriptionPistachios)
		   
INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (40
           ,@GoodsRecordsTypesStoredGoods
           ,@GoodsDescriptionKingArtur)

INSERT INTO [dbo].[GoodsRecords]
           ([Amount]
           ,[GoodsRecordsTypeId]
           ,[GoodsDescriptionId])
     VALUES
           (60
           ,@GoodsRecordsTypesStoredGoods
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
           ,@GoodsRecordsTypesShippedGoods
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
           ,@GoodsRecordsTypesShippedGoods
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
           ,@GoodsRecordsTypesShippedGoods
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
           ,@GoodsRecordsTypesShippedGoods
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
           ,@GoodsRecordsTypesShippedGoods
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
           ,@GoodsRecordsTypesShippedGoods
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
           ,@GoodsRecordsTypesShippedGoods
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
           ,@GoodsRecordsTypesShippedGoods
           ,@GoodsDescriptionHeiniken)
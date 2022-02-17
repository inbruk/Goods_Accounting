USE [GoodsInShop];
GO

if not exists (select * from ContractorType where Value = 'Поставщик')
	INSERT INTO ContractorType ([Value]) VALUES ( 'Поставщик')
GO

if not exists (select * from ContractorType where Value = 'Покупатель')
	INSERT INTO ContractorType ([Value]) VALUES ( 'Покупатель')
GO

if not exists (select * from GoodsRecordsType where Value = 'Поставленые товары')
	INSERT INTO GoodsRecordsType ([Value]) VALUES ( 'Поставленые товары')
GO

if not exists (select * from GoodsRecordsType where Value = 'Отгруженые товары')
	INSERT INTO GoodsRecordsType ([Value]) VALUES ( 'Отгруженые товары')
GO

if not exists (select * from GoodsRecordsType where Value = 'Товары в магазине')
	INSERT INTO GoodsRecordsType ([Value]) VALUES ( 'Товары в магазине')
GO

DECLARE @ContractorTypeSupplier AS INT
SET @ContractorTypeSupplier = ( SELECT Id FROM ContractorType WHERE Value = 'Поставщик' )

DECLARE @ContractorTypeCustomer AS INT
SET @ContractorTypeCustomer = ( SELECT Id FROM ContractorType WHERE Value = 'Покупатель' )


DECLARE @GoodsRecordsTypeSuppliedGoods AS INT
SET @GoodsRecordsTypeSuppliedGoods = ( SELECT Id FROM GoodsRecordsType WHERE Value = 'Поставленые товары' )

DECLARE @GoodsRecordsTypeShippedGoods AS INT
SET @GoodsRecordsTypeShippedGoods = ( SELECT Id FROM GoodsRecordsType WHERE Value = 'Отгруженые товары' )

DECLARE @GoodsRecordsTypeStoredGoods AS INT
SET @GoodsRecordsTypeStoredGoods = ( SELECT Id FROM GoodsRecordsType WHERE Value = 'Товары в магазине' )


if not exists (select * from [dbo].[Contractor] where Name = 'ООО Куба Либре')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Куба Либре'
           ,'8-836-555-45-76'
           ,'cuba_libre@mail.ru'
           , @ContractorTypeSupplier)

if not exists (select * from [dbo].[Contractor] where Name = 'ООО Мясной')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Мясной'
           ,'8-836-332-34-67'
           ,'meaty@mail.ru'
           ,@ContractorTypeSupplier)

if not exists (select * from [dbo].[Contractor] where Name = 'ООО Сельские товары')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Сельские товары'
           ,'8-836-346-12-58'
           ,'seltov@mail.ru'
           ,@ContractorTypeSupplier)

if not exists (select * from [dbo].[Contractor] where Name = 'ООО Роханские вина')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Роханские вина'
           ,'8-833-475-33-22'
           ,'rohan_vines@mail.ru'
           ,@ContractorTypeCustomer)

if not exists (select * from [dbo].[Contractor] where Name = 'ООО Три богатыря')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Три богатыря'
           ,'8-836-142-56-12'
           ,'tri_bogatirja@mail.ru'
           ,@ContractorTypeCustomer)

if not exists (select * from [dbo].[Contractor] where Name = 'ЗАО ПИВОДРОМ')
INSERT INTO [dbo].[Contractor]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ЗАО ПИВОДРОМ'
           ,'8-836-657-33-92'
           ,'pivodrom@mail.ru'
           ,@ContractorTypeCustomer)

DECLARE @ContractorCubaLibre AS INT
SET @ContractorCubaLibre = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = 'ООО Куба Либре' )

DECLARE @ContractorMeaty AS INT
SET @ContractorMeaty = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = 'ООО Мясной' )

DECLARE @ContractorFarmersGoods AS INT
SET @ContractorFarmersGoods = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = 'ООО Сельские товары' )

DECLARE @ContractorRohanVines AS INT
SET @ContractorRohanVines = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = 'ООО Роханские вина' )

DECLARE @ContractorTriBogatirja AS INT
SET @ContractorTriBogatirja = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = 'ООО Три богатыря' )

DECLARE @ContractorPivodrom AS INT
SET @ContractorPivodrom = ( SELECT Id FROM [dbo].[Contractor] WHERE Name = 'ЗАО ПИВОДРОМ' )

if not exists (select * from [dbo].[GoodsDescription] where Name = 'Чипсы \"Душистые\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Чипсы \"Душистые\"'
           ,'38')

if not exists (select * from [dbo].[GoodsDescription] where Name = 'Настойка \"Стрелецкая\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Настойка \"Стрелецкая\"'
           ,'235')

if not exists (select * from [dbo].[GoodsDescription] where Name = 'Самогон \"Кубанский\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Самогон \"Кубанский\"'
           ,'330')

if not exists (select * from [dbo].[GoodsDescription] where Name = 'Фисташки \"Путь Ильича\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Фисташки \"Путь Ильича\"'
           ,'135')

if not exists (select * from [dbo].[GoodsDescription] where Name = 'Колбаса \"Король Артур\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Колбаса \"Король Артур\"'
           ,'195')


if not exists (select * from [dbo].[GoodsDescription] where Name = 'Пиво \"Хайникен\"')
INSERT INTO [dbo].[GoodsDescription]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Пиво \"Хайникен\"'
           ,'150')

DECLARE @GoodsDescriptionCheaps AS INT
SET @GoodsDescriptionCheaps = ( SELECT Id FROM GoodsDescription WHERE Name = 'Чипсы \"Душистые\"' )

DECLARE @GoodsDescriptionStreleckaja AS INT
SET @GoodsDescriptionStreleckaja = ( SELECT Id FROM GoodsDescription WHERE Name = 'Настойка \"Стрелецкая\"' )

DECLARE @GoodsDescriptionCubanskij AS INT
SET @GoodsDescriptionCubanskij = ( SELECT Id FROM GoodsDescription WHERE Name = 'Самогон \"Кубанский\"' )

DECLARE @GoodsDescriptionPistachios AS INT
SET @GoodsDescriptionPistachios = ( SELECT Id FROM GoodsDescription WHERE Name = 'Фисташки \"Путь Ильича\"' )

DECLARE @GoodsDescriptionKingArtur AS INT
SET @GoodsDescriptionKingArtur = ( SELECT Id FROM GoodsDescription WHERE Name = 'Колбаса \"Король Артур\"' )

DECLARE @GoodsDescriptionHeiniken AS INT
SET @GoodsDescriptionHeiniken = ( SELECT Id FROM GoodsDescription WHERE Name = 'Пиво \"Хайникен\"' )

-- поставленные партии товаров ---------------------------------------------------------------------------------------------------------------------------------

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

-- партии товаров находящиеся в магазине -----------------------------------------------------------------------------------------------------------------------

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

-- проданные партии товаров, отправленные покупателям ----------------------------------------------------------------------------------------------------------

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
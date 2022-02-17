USE [GoodsInShop];
GO
-- закоментареное здесь добавлять не нужно, оно перешло в инициализатор, в метод Seed()

--if not exists (select * from ContractorTypes where Value = 'Поставщик')
--	INSERT INTO ContractorTypes ([Value]) VALUES ( 'Поставщик')
--GO

--if not exists (select * from ContractorTypes where Value = 'Покупатель')
--	INSERT INTO ContractorTypes ([Value]) VALUES ( 'Покупатель')
--GO

--if not exists (select * from GoodsRecordsTypes where Value = 'Поставленые товары')
--	INSERT INTO GoodsRecordsTypes ([Value]) VALUES ( 'Поставленые товары')
--GO

--if not exists (select * from GoodsRecordsTypes where Value = 'Отгруженые товары')
--	INSERT INTO GoodsRecordsTypes ([Value]) VALUES ( 'Отгруженые товары')
--GO

--if not exists (select * from GoodsRecordsTypes where Value = 'Товары в магазине')
--	INSERT INTO GoodsRecordsTypes ([Value]) VALUES ( 'Товары в магазине')
--GO

DECLARE @ContractorTypesSupplier AS INT
SET @ContractorTypesSupplier = ( SELECT Id FROM ContractorTypes WHERE Value = 'Поставщик' )

DECLARE @ContractorTypesCustomer AS INT
SET @ContractorTypesCustomer = ( SELECT Id FROM ContractorTypes WHERE Value = 'Покупатель' )


DECLARE @GoodsRecordsTypesSuppliedGoods AS INT
SET @GoodsRecordsTypesSuppliedGoods = ( SELECT Id FROM GoodsRecordsTypes WHERE Value = 'Поставленые товары' )

DECLARE @GoodsRecordsTypesShippedGoods AS INT
SET @GoodsRecordsTypesShippedGoods = ( SELECT Id FROM GoodsRecordsTypes WHERE Value = 'Отгруженые товары' )

DECLARE @GoodsRecordsTypesStoredGoods AS INT
SET @GoodsRecordsTypesStoredGoods = ( SELECT Id FROM GoodsRecordsTypes WHERE Value = 'Товары в магазине' )


if not exists (select * from [dbo].[Contractors] where Name = 'ООО Куба Либре')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Куба Либре'
           ,'8-836-555-45-76'
           ,'cuba_libre@mail.ru'
           , @ContractorTypesSupplier)

if not exists (select * from [dbo].[Contractors] where Name = 'ООО Мясной')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Мясной'
           ,'8-836-332-34-67'
           ,'meaty@mail.ru'
           ,@ContractorTypesSupplier)

if not exists (select * from [dbo].[Contractors] where Name = 'ООО Сельские товары')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Сельские товары'
           ,'8-836-346-12-58'
           ,'seltov@mail.ru'
           ,@ContractorTypesSupplier)

if not exists (select * from [dbo].[Contractors] where Name = 'ООО Роханские вина')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Роханские вина'
           ,'8-833-475-33-22'
           ,'rohan_vines@mail.ru'
           ,@ContractorTypesCustomer)

if not exists (select * from [dbo].[Contractors] where Name = 'ООО Три богатыря')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ООО Три богатыря'
           ,'8-836-142-56-12'
           ,'tri_boga@mail.ru'
           ,@ContractorTypesCustomer)

if not exists (select * from [dbo].[Contractors] where Name = 'ЗАО ПИВОДРОМ')
INSERT INTO [dbo].[Contractors]
           ([Name]
           ,[Phone]
           ,[EMail]
           ,[ContractorTypeId])
     VALUES
           (
		    'ЗАО ПИВОДРОМ'
           ,'8-836-657-33-92'
           ,'pivodrom@mail.ru'
           ,@ContractorTypesCustomer)

DECLARE @ContractorCubaLibre AS INT
SET @ContractorCubaLibre = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = 'ООО Куба Либре' )

DECLARE @ContractorMeaty AS INT
SET @ContractorMeaty = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = 'ООО Мясной' )

DECLARE @ContractorFarmersGoods AS INT
SET @ContractorFarmersGoods = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = 'ООО Сельские товары' )

DECLARE @ContractorRohanVines AS INT
SET @ContractorRohanVines = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = 'ООО Роханские вина' )

DECLARE @ContractorTriBogatirja AS INT
SET @ContractorTriBogatirja = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = 'ООО Три богатыря' )

DECLARE @ContractorPivodrom AS INT
SET @ContractorPivodrom = ( SELECT Id FROM [dbo].[Contractors] WHERE Name = 'ЗАО ПИВОДРОМ' )

if not exists (select * from [dbo].[GoodsDescriptions] where Name = 'Чипсы "Душистые"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Чипсы "Душистые"'
           ,'38')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = 'Настойка "Стрелецкая"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Настойка "Стрелецкая"'
           ,'235')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = 'Самогон "Кубанский"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Самогон "Кубанский"'
           ,'330')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = 'Фисташки "Путь Ильича"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Фисташки "Путь Ильича"'
           ,'135')

if not exists (select * from [dbo].[GoodsDescriptions] where Name = 'Колбаса "Король Артур"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Колбаса "Король Артур"'
           ,'195')


if not exists (select * from [dbo].[GoodsDescriptions] where Name = 'Пиво "Хайникен"')
INSERT INTO [dbo].[GoodsDescriptions]
           ([Name]
           ,[CurrentPrice])
     VALUES
           ('Пиво "Хайникен"'
           ,'150')

DECLARE @GoodsDescriptionCheaps AS INT
SET @GoodsDescriptionCheaps = ( SELECT Id FROM GoodsDescriptions WHERE Name = 'Чипсы "Душистые"' )

DECLARE @GoodsDescriptionStreleckaja AS INT
SET @GoodsDescriptionStreleckaja = ( SELECT Id FROM GoodsDescriptions WHERE Name = 'Настойка "Стрелецкая"' )

DECLARE @GoodsDescriptionCubanskij AS INT
SET @GoodsDescriptionCubanskij = ( SELECT Id FROM GoodsDescriptions WHERE Name = 'Самогон "Кубанский"' )

DECLARE @GoodsDescriptionPistachios AS INT
SET @GoodsDescriptionPistachios = ( SELECT Id FROM GoodsDescriptions WHERE Name = 'Фисташки "Путь Ильича"' )

DECLARE @GoodsDescriptionKingArtur AS INT
SET @GoodsDescriptionKingArtur = ( SELECT Id FROM GoodsDescriptions WHERE Name = 'Колбаса "Король Артур"' )

DECLARE @GoodsDescriptionHeiniken AS INT
SET @GoodsDescriptionHeiniken = ( SELECT Id FROM GoodsDescriptions WHERE Name = 'Пиво "Хайникен"' )

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

-- партии товаров находящиеся в магазине -----------------------------------------------------------------------------------------------------------------------

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
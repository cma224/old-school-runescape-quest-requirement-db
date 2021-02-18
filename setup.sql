
-- Create a new database called 'OsrsQuests'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
FROM sys.databases
WHERE [name] = N'OsrsQuests'
)
CREATE DATABASE OsrsQuests
GO
USE OsrsQuests
GO
-- Create a new table called '[Quests]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Quests]', 'U') IS NOT NULL
DROP TABLE [dbo].[Quests]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Quests]
(
    [QuestId] INT IDENTITY(1,1) PRIMARY KEY, -- Primary Key column
    [QuestName] NVARCHAR(50) NOT NULL,
    [QuestPoints] INT NOT NULL,
    [IsMembersQuest] BIT NOT NULL,
    [AgilityLvl] INT NOT NULL,
    [AttackLvl] INT NOT NULL,
    [ConstructionLvl] INT NOT NULL,
    [CookingLvl] INT NOT NULL,
    [CraftingLvl] INT NOT NULL,
    [DefenceLvl] INT NOT NULL,
    [FarmingLvl] INT NOT NULL,
    [FiremakingLvl] INT NOT NULL,
    [FishingLvl] INT NOT NULL,
    [FletchingLvl] INT NOT NULL,
    [HerbloreLvl] INT NOT NULL,
    [HitpointsLvl] INT NOT NULL,
    [HunterLvl] INT NOT NULL,
    [MagicLvl] INT NOT NULL,
    [MiningLvl] INT NOT NULL,
    [PrayerLvl] INT NOT NULL,
    [RangeLvl] INT NOT NULL,
    [RunecraftLvl] INT NOT NULL,
    [SlayerLvl] INT NOT NULL,
    [SmithingLvl] INT NOT NULL,
    [StrengthLvl] INT NOT NULL,
    [ThievingLvl] INT NOT NULL,
    [WoodcuttingLvl] INT NOT NULL
);
GO

BULK INSERT Quests
FROM '/questList.csv'
 WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', FIRSTROW=2)
GO
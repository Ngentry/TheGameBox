CREATE TABLE [dbo].[Games] (
    [Game_Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Game_Title]       NVARCHAR (50)  NOT NULL,
    [Gane_Genre]       NVARCHAR (50)  NULL,
    [Game_Publisher]   NVARCHAR (50)  NULL,
    [Game_Author]      NVARCHAR (50)  NULL,
    [Game_Version]     DECIMAL (5)    NULL,
    [Game_Image]       NVARCHAR (50)  NULL,
    [Game_MinPlayers]  INT            NULL,
    [Game_MaxPlayers]  INT            NULL,
    [Game_Description] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Game_Id] ASC)
);


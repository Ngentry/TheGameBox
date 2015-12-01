CREATE TABLE [dbo].[Games_Owned] (
    [User_Id] INT NOT NULL,
    [Game_ID] INT NOT NULL,
    CONSTRAINT [PK_Games_Owned] PRIMARY KEY CLUSTERED ([Game_ID] ASC, [User_Id] ASC)
);


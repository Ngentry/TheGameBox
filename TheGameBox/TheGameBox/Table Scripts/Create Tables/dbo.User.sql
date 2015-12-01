CREATE TABLE [dbo].[User] (
    [User_ID]         INT           IDENTITY (1, 1) NOT NULL,
    [User_ScreenName] NVARCHAR (50) NOT NULL,
    [User_FName]      NVARCHAR (50) NOT NULL,
    [User_LName]      NVARCHAR (50) NOT NULL,
    [User_Email]      NVARCHAR (50) NOT NULL,
    [User_Password]   NVARCHAR (50) NOT NULL,
    [User_GroupID]    INT           DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([User_ID] ASC)
);


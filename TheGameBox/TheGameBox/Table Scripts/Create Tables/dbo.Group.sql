CREATE TABLE [dbo].[Group] (
    [Group_Id]      INT           IDENTITY (1, 1) NOT NULL,
    [Group_Name]    NVARCHAR (50) NOT NULL,
    [Group_Image]   NVARCHAR (50) NULL,
    [Group_Creater] INT           NULL,
    PRIMARY KEY CLUSTERED ([Group_Id] ASC)
);


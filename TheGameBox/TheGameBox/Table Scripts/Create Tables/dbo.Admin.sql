CREATE TABLE [dbo].[Admin] (
    [Admin_AdminID]   INT           IDENTITY (1, 1) NOT NULL,
    [Admin_AdminName] NVARCHAR (50) NOT NULL,
    [Admin_FName]     NVARCHAR (50) NOT NULL,
    [Admin_LName]     NVARCHAR (50) NOT NULL,
    [Admin_Email]     NVARCHAR (50) NOT NULL,
    [Admin_Password]  NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Admin_AdminID] ASC)
);


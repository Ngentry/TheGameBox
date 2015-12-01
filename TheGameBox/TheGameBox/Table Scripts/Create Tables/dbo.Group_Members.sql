CREATE TABLE [dbo].[Group_Members] (
    [Group_ID]      INT NOT NULL,
    [User_ID]       INT NOT NULL,
    [Group_Admin]   BIT NULL,
    [Group_Pending] BIT NULL,
    CONSTRAINT [PK_Group_Members] PRIMARY KEY CLUSTERED ([Group_ID] ASC, [User_ID] ASC)
);


CREATE TABLE [dbo].[Calendar] (
    [Calendar_EventID]      INT           IDENTITY (1, 1) NOT NULL,
    [Calendar_EventDate]    DATE          NOT NULL,
    [Calendar_EventName]    NVARCHAR (50) NOT NULL,
    [Calendar_EventSummary] NVARCHAR (50) NOT NULL,
    [Calendar_UserID]       INT           NOT NULL,
    [Calendar_TimeStart]    VARCHAR (50)  NOT NULL,
    [Calendar_TimeEnd]      NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Calendar_EventID] ASC)
);


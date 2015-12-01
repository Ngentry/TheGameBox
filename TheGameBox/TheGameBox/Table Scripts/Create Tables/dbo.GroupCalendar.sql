CREATE TABLE [dbo].[GroupCalendar] (
    [GroupCalendar_EventID]      INT           IDENTITY (1, 1) NOT NULL,
    [GroupCalendar_EventName]    NVARCHAR (50) NOT NULL,
    [GroupCalendar_EventDate]    DATE          NOT NULL,
    [GroupCalendar_EventSummary] NVARCHAR (50) NOT NULL,
    [GroupCalendar_GroupID]      INT           NOT NULL,
    [GroupCalendar_TimeStart]    NVARCHAR (50) NOT NULL,
    [GroupCalendar_TimeEnd]      NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([GroupCalendar_EventID] ASC)
);


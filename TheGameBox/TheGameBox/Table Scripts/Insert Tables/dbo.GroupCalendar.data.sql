SET IDENTITY_INSERT [dbo].[GroupCalendar] ON
INSERT INTO [dbo].[GroupCalendar] ([GroupCalendar_EventID], [GroupCalendar_EventName], [GroupCalendar_EventDate], [GroupCalendar_EventSummary], [GroupCalendar_GroupID], [GroupCalendar_TimeStart], [GroupCalendar_TimeEnd]) VALUES (1, N'TestEventGroup', N'2015-11-30', N'Summary for group 1', 1, N'6:00 AM', N'6:00 PM')
INSERT INTO [dbo].[GroupCalendar] ([GroupCalendar_EventID], [GroupCalendar_EventName], [GroupCalendar_EventDate], [GroupCalendar_EventSummary], [GroupCalendar_GroupID], [GroupCalendar_TimeStart], [GroupCalendar_TimeEnd]) VALUES (2, N'TestEvent2', N'2015-12-02', N'Summary for Group 1', 1, N'6:00 AM', N'6:00 PM')
INSERT INTO [dbo].[GroupCalendar] ([GroupCalendar_EventID], [GroupCalendar_EventName], [GroupCalendar_EventDate], [GroupCalendar_EventSummary], [GroupCalendar_GroupID], [GroupCalendar_TimeStart], [GroupCalendar_TimeEnd]) VALUES (3, N'TestEvent3', N'2015-12-05', N'Summary for Group 2', 3, N'6:00 AM', N'6:00 PM')
INSERT INTO [dbo].[GroupCalendar] ([GroupCalendar_EventID], [GroupCalendar_EventName], [GroupCalendar_EventDate], [GroupCalendar_EventSummary], [GroupCalendar_GroupID], [GroupCalendar_TimeStart], [GroupCalendar_TimeEnd]) VALUES (6, N'Hello', N'2015-12-03', N'Hello', 1, N'12:00 AM', N'4:00 AM')
SET IDENTITY_INSERT [dbo].[GroupCalendar] OFF
SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT INTO [dbo].[Admin] ([Admin_AdminID], [Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password]) VALUES (1, N'Admin', N'Power', N'User', N'Admin@admin.com', N'Admin1234')
INSERT INTO [dbo].[Admin] ([Admin_AdminID], [Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password]) VALUES (2, N'Admin2', N'Power', N'User', N'Admin2@admin.edu', N'1234Admin')
INSERT INTO [dbo].[Admin] ([Admin_AdminID], [Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password]) VALUES (3, N'Admin4', N'First', N'Last', N'Email@Email.com', N'Password123')
SET IDENTITY_INSERT [dbo].[Admin] OFF

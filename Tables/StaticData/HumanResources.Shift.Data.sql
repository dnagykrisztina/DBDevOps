SET IDENTITY_INSERT HumanResources.Shift ON
GO
INSERT HumanResources.Shift(ShiftID, Name, StartTime, EndTime, ModifiedDate) VALUES (1, N'Day', '07:00:00', '15:00:00', '2008-04-30 00:00:00.000')
INSERT HumanResources.Shift(ShiftID, Name, StartTime, EndTime, ModifiedDate) VALUES (2, N'Evening', '15:00:00', '23:00:00', '2008-04-30 00:00:00.000')
INSERT HumanResources.Shift(ShiftID, Name, StartTime, EndTime, ModifiedDate) VALUES (3, N'Night', '23:00:00', '07:00:00', '2008-04-30 00:00:00.000')
GO
SET IDENTITY_INSERT HumanResources.Shift OFF
GO
SET IDENTITY_INSERT Person.PhoneNumberType ON
GO
INSERT Person.PhoneNumberType(PhoneNumberTypeID, Name, ModifiedDate) VALUES (1, N'Cell', '2017-12-13 13:19:22.273')
INSERT Person.PhoneNumberType(PhoneNumberTypeID, Name, ModifiedDate) VALUES (2, N'Home', '2017-12-13 13:19:22.273')
INSERT Person.PhoneNumberType(PhoneNumberTypeID, Name, ModifiedDate) VALUES (3, N'Work', '2017-12-13 13:19:22.273')
GO
SET IDENTITY_INSERT Person.PhoneNumberType OFF
GO
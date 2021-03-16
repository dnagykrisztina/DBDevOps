SET IDENTITY_INSERT Purchasing.ShipMethod ON
GO
INSERT Purchasing.ShipMethod(ShipMethodID, Name, ShipBase, ShipRate, rowguid, ModifiedDate) VALUES (1, N'XRQ - TRUCK GROUND', 3.95, 0.99, '6be756d9-d7be-4463-8f2c-ae60c710d606', '2008-04-30 00:00:00.000')
INSERT Purchasing.ShipMethod(ShipMethodID, Name, ShipBase, ShipRate, rowguid, ModifiedDate) VALUES (2, N'ZY - EXPRESS', 9.95, 1.99, '3455079b-f773-4dc6-8f1e-2a58649c4ab8', '2008-04-30 00:00:00.000')
INSERT Purchasing.ShipMethod(ShipMethodID, Name, ShipBase, ShipRate, rowguid, ModifiedDate) VALUES (3, N'OVERSEAS - DELUXE', 29.95, 2.99, '22f4e461-28cf-4ace-a980-f686cf112ec8', '2008-04-30 00:00:00.000')
INSERT Purchasing.ShipMethod(ShipMethodID, Name, ShipBase, ShipRate, rowguid, ModifiedDate) VALUES (4, N'OVERNIGHT J-FAST', 21.95, 1.29, '107e8356-e7a8-463d-b60c-079fff467f3f', '2008-04-30 00:00:00.000')
INSERT Purchasing.ShipMethod(ShipMethodID, Name, ShipBase, ShipRate, rowguid, ModifiedDate) VALUES (5, N'CARGO TRANSPORT 5', 8.99, 1.49, 'b166019a-b134-4e76-b957-2b0490c610ed', '2008-04-30 00:00:00.000')
GO
SET IDENTITY_INSERT Purchasing.ShipMethod OFF
GO
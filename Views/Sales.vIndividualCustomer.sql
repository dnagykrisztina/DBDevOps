SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [Sales].[vIndividualCustomer]
AS
SELECT        p.BusinessEntityID, p.Title, p.FirstName, p.MiddleName, p.LastName, pp.PhoneNumber, pnt.Name AS PhoneNumberType, ea.EmailAddress, p.EmailPromotion, at.Name AS AddressType, a.AddressLine1, a.AddressLine2, a.City, 
                         sp.Name AS StateProvinceName, a.PostalCode, cr.Name AS CountryRegionName, p.Demographics
FROM            Person.Person AS p INNER JOIN
                         Person.BusinessEntityAddress AS bea ON bea.BusinessEntityID = p.BusinessEntityID INNER JOIN
                         Person.Address AS a ON a.AddressID = bea.AddressID INNER JOIN
                         Person.StateProvince AS sp ON sp.StateProvinceID = a.StateProvinceID INNER JOIN
                         Person.CountryRegion AS cr ON cr.CountryRegionCode = sp.CountryRegionCode INNER JOIN
                         Person.AddressType AS at ON at.AddressTypeID = bea.AddressTypeID INNER JOIN
                         Sales.Customer AS c ON c.PersonID = p.BusinessEntityID LEFT OUTER JOIN
                         Person.EmailAddress AS ea ON ea.BusinessEntityID = p.BusinessEntityID LEFT OUTER JOIN
                         Person.PersonPhone AS pp ON pp.BusinessEntityID = p.BusinessEntityID LEFT OUTER JOIN
                         Person.PhoneNumberType AS pnt ON pnt.PhoneNumberTypeID = pp.PhoneNumberTypeID
WHERE        (c.StoreID IS NULL)
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Individual customers (names and addresses) that purchase Adventure Works Cycles products online.', 'SCHEMA', N'Sales', 'VIEW', N'vIndividualCustomer'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "bea"
            Begin Extent = 
               Top = 6
               Left = 283
               Bottom = 136
               Right = 458
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sp"
            Begin Extent = 
               Top = 138
               Left = 248
               Bottom = 268
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cr"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 383
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "at"
            Begin Extent = 
               Top = 270
               Left = 273
               Bottom = 400
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 384
               Left = 38
               Bottom = 514
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         E', 'SCHEMA', N'Sales', 'VIEW', N'vIndividualCustomer'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'nd
         Begin Table = "ea"
            Begin Extent = 
               Top = 402
               Left = 254
               Bottom = 532
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pp"
            Begin Extent = 
               Top = 516
               Left = 38
               Bottom = 646
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pnt"
            Begin Extent = 
               Top = 648
               Left = 38
               Bottom = 761
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'Sales', 'VIEW', N'vIndividualCustomer'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'Sales', 'VIEW', N'vIndividualCustomer'
GO
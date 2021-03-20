SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [HumanResources].[vEmployee]
AS
SELECT        e.BusinessEntityID, p.Title, p.FirstName, p.MiddleName, p.LastName, e.JobTitle, pp.PhoneNumber, pnt.Name AS PhoneNumberType, ea.EmailAddress, p.EmailPromotion, a.AddressLine1, a.AddressLine2, a.City, 
                         sp.Name AS StateProvinceName, a.PostalCode, cr.Name AS CountryRegionName, p.AdditionalContactInfo
FROM            HumanResources.Employee AS e INNER JOIN
                         Person.Person AS p ON p.BusinessEntityID = e.BusinessEntityID INNER JOIN
                         Person.BusinessEntityAddress AS bea ON bea.BusinessEntityID = e.BusinessEntityID INNER JOIN
                         Person.Address AS a ON a.AddressID = bea.AddressID INNER JOIN
                         Person.StateProvince AS sp ON sp.StateProvinceID = a.StateProvinceID INNER JOIN
                         Person.CountryRegion AS cr ON cr.CountryRegionCode = sp.CountryRegionCode LEFT OUTER JOIN
                         Person.PersonPhone AS pp ON pp.BusinessEntityID = p.BusinessEntityID LEFT OUTER JOIN
                         Person.PhoneNumberType AS pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID LEFT OUTER JOIN
                         Person.EmailAddress AS ea ON p.BusinessEntityID = ea.BusinessEntityID
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee names and addresses.', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployee'
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
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "bea"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 136
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 138
               Left = 283
               Bottom = 268
               Right = 455
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sp"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cr"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 515
               Right = 235
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
         En', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployee'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'd
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
         Begin Table = "ea"
            Begin Extent = 
               Top = 270
               Left = 292
               Bottom = 400
               Right = 467
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
', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployee'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployee'
GO
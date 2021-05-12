###### DBDevOps
___
[Project](../../../../../../startpage.md)>[Servers](../../../../../Servers.md)>[LOCALHOST](../../../../LOCALHOST.md)>[User databases](../../../UserDatabases.md)>[AdventureWorks2019](../../AdventureWorks2019.md)>[Programmability](../Programmability.md)>[Stored Procedures](Procedures.md)>dbo.uspSearchCandidateResumes


# ![logo](../../../../../../Images/procedure.svg) dbo.uspSearchCandidateResumes

## <a name="#Description"></a>Description
> 
## <a name="#Properties"></a>Properties
|Name|Value|
|---|---|
|ANSI Nulls ON|True|
|Quoted Identifier ON|True|
|Encrypted|False|
|Execute As||
|Assembly||


## <a name="#Parameters"></a>Parameters
|Name|Data Type|Length|Description
|---|---|---|---
|@searchString|nvarchar|1000||
|@useInflectional|bit|1||
|@useThesaurus|bit|1||
|@language|int|4||

## <a name="#SqlScript"></a>SQL Script
```SQL
SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--A stored procedure which demonstrates integrated full text search

CREATE OR ALTER PROCEDURE dbo.uspSearchCandidateResumes
    @searchString [nvarchar](1000),   
    @useInflectional [bit]=0,
    @useThesaurus [bit]=0,
    @language[int]=0


WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

      DECLARE @string nvarchar(1050)
      --setting the lcid to the default instance LCID if needed
      IF @language = NULL OR @language = 0 
      BEGIN 
            SELECT @language =CONVERT(int, serverproperty('lcid'))  
      END
      

            --FREETEXTTABLE case as inflectional and Thesaurus were required
      IF @useThesaurus = 1 AND @useInflectional = 1  
        BEGIN
                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN FREETEXTTABLE([HumanResources].[JobCandidate],*, @searchString,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
            END

      ELSE IF @useThesaurus = 1
            BEGIN
                  SELECT @string ='FORMSOF(THESAURUS,"'+@searchString +'"'+')'      
                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*, @string,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
        END

      ELSE IF @useInflectional = 1
            BEGIN
                  SELECT @string ='FORMSOF(INFLECTIONAL,"'+@searchString +'"'+')'
                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*, @string,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
        END
  
      ELSE --base case, plain CONTAINSTABLE
            BEGIN
                  SELECT @string='"'+@searchString +'"'
                  SELECT FT_TBL.[JobCandidateID],KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 
                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*,@string,LANGUAGE @language) AS KEY_TBL
                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]
            END

END;
GO
```

## <a name="#DependsOn"></a>Depends On _`1`_
- [HumanResources.JobCandidate](../../Tables/HumanResources.JobCandidate.md)


## <a name="#UsedBy"></a>Used By


___
###### Author: Nagy Krisztina Dalma
###### Copyright © All Rights Reserved
###### Created: 2021. 03. 15

# dbForge Documenter Trial
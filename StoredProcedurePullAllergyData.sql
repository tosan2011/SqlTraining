
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Developer:	Patrick Ejueyitchie
-- Create date: 1/25/2025
-- Description:	Initial process to create procedure to pull allergy data
-- 01/25/2025 Adding parameter @category to the stored procedure using the category field
-- =============================================


Create or Alter PROCEDURE spPullAllergyData
	-- Add the parameters for the stored procedure here
	(@Category VARCHAR(50), 
	@startyear DATE)
	
	--SET @startyear=year(start)

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT [START],
	YEAR START AS STARTYEAR
      ,[STOP]
      ,[PATIENT]
      ,[ENCOUNTER]
      ,[CODE]
      ,[SYSTEM]
      ,[DESCRIPTION]
      ,[TYPE]
      ,[CATEGORY]
      ,[REACTION1]
      ,[DESCRIPTION1]
      ,[SEVERITY1]
      ,[REACTION2]
      ,[DESCRIPTION2]
      ,[SEVERITY2]
      ,[INSERT_DATE]
      ,[UPDATE_DATE]
  FROM [emade_dev].[dbo].[Allergies]
  WHERE category=@Category
  AND YEAR(START)=@startyear
END
GO

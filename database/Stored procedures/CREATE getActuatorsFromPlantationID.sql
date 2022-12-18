/****** Object:  StoredProcedure [dbo].[getActuatorsFromPlantationID]    Script Date: 18/12/2022 19:55:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getActuatorsFromPlantationID]
(
    -- Add the parameters for the stored procedure here
    @plantationID int
    -- <@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	SELECT
	[id] AS 'actuatorID',
	[serial] AS 'actuatorSerial'
	FROM
	actuator
	WHERE
	actuator.id in 
	(SELECT [actuatorID] FROM installation WHERE [plantationID] in
	(SELECT [id] FROM plantation WHERE plantation.id = @plantationID))
END
GO


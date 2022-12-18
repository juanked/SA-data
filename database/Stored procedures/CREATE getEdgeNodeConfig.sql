/****** Object:  StoredProcedure [dbo].[getEdgeNodeConfig]    Script Date: 18/12/2022 19:55:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <David Cristóbal>
-- Create Date: <Create Date, , >
-- Description: <Obtiene toda la información necesaria para el funcionamiento de un edgeNode
-- url: /edgenodes/{id}/config>
-- =============================================
CREATE PROCEDURE [dbo].[getEdgeNodeConfig]
(
    -- Add the parameters for the stored procedure here
    @edgeNodeID int
    -- <@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets FROM
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	SELECT
		[id] AS 'sensorID',
		[serial] AS 'sensorSerial',
		[linearFit] AS 'sensorLinearFit',
		(SELECT DISTINCT [plantationID] FROM installation WHERE [sensorID] = sensor.id) AS 'plantationID',

		(SELECT [fieldCapacity] FROM plantation WHERE plantation.id =
		(SELECT DISTINCT [plantationID] FROM installation WHERE [sensorID] = sensor.id)) AS 'fieldCapacity',

		(SELECT (SELECT [optimalWater] FROM crop WHERE [id] = [cropID]) FROM plantation WHERE plantation.id =
		(SELECT DISTINCT [plantationID] FROM installation WHERE [sensorID] = sensor.id)) AS 'optimalWater'
	FROM
		sensor
	WHERE
		sensor.id in (SELECT [sensorID] FROM installation WHERE [plantationID] in 
			(SELECT [id] FROM plantation WHERE [edgeNodeID] = @edgeNodeID))
    -- Insert statements for procedure here
    
END
GO


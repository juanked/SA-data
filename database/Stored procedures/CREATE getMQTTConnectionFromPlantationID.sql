/****** Object:  StoredProcedure [dbo].[getMQTTConnectionFromPlantationID]    Script Date: 18/12/2022 19:56:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      David Cristóbal
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[getMQTTConnectionFromPlantationID]
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

    -- Insert statements for procedure here
    SELECT 
	[id] AS 'mqttConnID',
	[name] AS 'mqttConnName',
	[clientID] AS 'mqttClientID',
	[userName] AS 'mqttUserName',
	[password] AS 'mqttPassword',
	[host] AS 'mqttHost',
	[port] AS 'mqttPort'
	FROM mqttConnection WHERE id IN 
	(SELECT mqttConnectionID FROM plantation WHERE id = @plantationID)
END
GO


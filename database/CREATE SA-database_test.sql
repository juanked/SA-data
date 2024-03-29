/****** Object:  Database [SA-database_test]    Script Date: 10/01/2023 17:40:25 ******/
CREATE DATABASE [SA-database_test]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [SA-database_test] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [SA-database_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SA-database_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SA-database_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SA-database_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SA-database_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [SA-database_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SA-database_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SA-database_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SA-database_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SA-database_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SA-database_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SA-database_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SA-database_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SA-database_test] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [SA-database_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SA-database_test] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SA-database_test] SET  MULTI_USER 
GO
ALTER DATABASE [SA-database_test] SET ENCRYPTION ON
GO
ALTER DATABASE [SA-database_test] SET QUERY_STORE = ON
GO
ALTER DATABASE [SA-database_test] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[actuator]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actuator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serial] [varchar](20) NOT NULL,
	[actuatorClassID] [int] NOT NULL,
	[available] [bit] NOT NULL,
 CONSTRAINT [PK_actuator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actuatorClass]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actuatorClass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[manufacturer] [varchar](20) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[microController] [varchar](20) NOT NULL,
	[description] [varchar](200) NULL,
 CONSTRAINT [PK_actuatorClass] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[azureResource]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[azureResource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[publicIP] [varchar](15) NULL,
	[privateIP] [varchar](15) NULL,
	[resourceGroup] [varchar](50) NULL,
	[description] [varchar](200) NULL,
 CONSTRAINT [PK_azureResource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contactName] [varchar](50) NOT NULL,
	[societyName] [varchar](50) NULL,
	[TAXid] [varchar](15) NOT NULL,
	[direction] [varchar](50) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[postalCode] [varchar](7) NOT NULL,
	[countryISOCode] [char](2) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telephone] [varchar](15) NOT NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crop]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[optimalWater] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_crop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[edgeNode]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[edgeNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hostname] [varchar](20) NOT NULL,
	[serial] [varchar](20) NULL,
	[edgeNodeClassID] [int] NOT NULL,
	[gatewayID] [int] NOT NULL,
	[IP] [varchar](15) NULL,
	[comments] [varchar](200) NULL,
	[available] [bit] NOT NULL,
 CONSTRAINT [PK_edgeNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_edgeNode] UNIQUE NONCLUSTERED 
(
	[hostname] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[edgeNodeClass]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[edgeNodeClass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [varchar](20) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[architecture] [varchar](10) NOT NULL,
	[RAM] [smallint] NOT NULL,
 CONSTRAINT [PK_edgeNodeClass] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gateway]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gateway](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serial] [varchar](20) NOT NULL,
	[gatewayClassID] [int] NOT NULL,
	[available] [bit] NOT NULL,
 CONSTRAINT [PK_gateway] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gatewayClass]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gatewayClass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [varchar](20) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[connector] [varchar](20) NOT NULL,
	[channels] [tinyint] NOT NULL,
 CONSTRAINT [PK_gatewayClass] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[installation]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[installation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plantationID] [int] NOT NULL,
	[sensorID] [int] NOT NULL,
	[actuatorID] [int] NOT NULL,
	[azureResourceID] [int] NOT NULL,
	[installationDate] [smalldatetime] NOT NULL,
	[comments] [varchar](200) NULL,
 CONSTRAINT [PK_installation] PRIMARY KEY CLUSTERED 
(
	[plantationID] ASC,
	[sensorID] ASC,
	[actuatorID] ASC,
	[azureResourceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mqttConnection]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mqttConnection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[clientID] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[host] [varchar](50) NOT NULL,
	[port] [int] NOT NULL,
 CONSTRAINT [PK_thingsboardConnection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plantation]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[landRegistryReference] [varchar](50) NOT NULL,
	[fieldCapacity] [decimal](7, 3) NOT NULL,
	[clientID] [int] NOT NULL,
	[cropID] [int] NOT NULL,
	[edgeNodeID] [int] NOT NULL,
	[comments] [varchar](200) NULL,
	[mqttConnectionID] [int] NULL,
 CONSTRAINT [PK_plantation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sensor]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sensor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serial] [varchar](20) NOT NULL,
	[linearFit] [varchar](50) NULL,
	[sensorClassID] [int] NOT NULL,
	[available] [bit] NOT NULL,
 CONSTRAINT [PK_sensor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sensorClass]    Script Date: 10/01/2023 17:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sensorClass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[manufacturer] [varchar](20) NOT NULL,
	[model] [varchar](20) NOT NULL,
	[microController] [varchar](20) NOT NULL,
	[description] [varchar](200) NULL,
 CONSTRAINT [PK_sensorClass] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[installation] ADD  CONSTRAINT [DF_installation_installationDate]  DEFAULT (getdate()) FOR [installationDate]
GO
ALTER TABLE [dbo].[actuator]  WITH CHECK ADD  CONSTRAINT [FK_actuator_actuatorClass] FOREIGN KEY([actuatorClassID])
REFERENCES [dbo].[actuatorClass] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actuator] CHECK CONSTRAINT [FK_actuator_actuatorClass]
GO
ALTER TABLE [dbo].[edgeNode]  WITH CHECK ADD  CONSTRAINT [FK_edgeNode_edgeNodeClass] FOREIGN KEY([edgeNodeClassID])
REFERENCES [dbo].[edgeNodeClass] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[edgeNode] CHECK CONSTRAINT [FK_edgeNode_edgeNodeClass]
GO
ALTER TABLE [dbo].[edgeNode]  WITH CHECK ADD  CONSTRAINT [FK_edgeNode_gateway] FOREIGN KEY([gatewayID])
REFERENCES [dbo].[gateway] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[edgeNode] CHECK CONSTRAINT [FK_edgeNode_gateway]
GO
ALTER TABLE [dbo].[gateway]  WITH CHECK ADD  CONSTRAINT [FK_gateway_gatewayClass] FOREIGN KEY([gatewayClassID])
REFERENCES [dbo].[gatewayClass] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[gateway] CHECK CONSTRAINT [FK_gateway_gatewayClass]
GO
ALTER TABLE [dbo].[installation]  WITH CHECK ADD  CONSTRAINT [FK_installation_actuator] FOREIGN KEY([actuatorID])
REFERENCES [dbo].[actuator] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[installation] CHECK CONSTRAINT [FK_installation_actuator]
GO
ALTER TABLE [dbo].[installation]  WITH CHECK ADD  CONSTRAINT [FK_installation_azureResource] FOREIGN KEY([azureResourceID])
REFERENCES [dbo].[azureResource] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[installation] CHECK CONSTRAINT [FK_installation_azureResource]
GO
ALTER TABLE [dbo].[installation]  WITH CHECK ADD  CONSTRAINT [FK_installation_plantation] FOREIGN KEY([plantationID])
REFERENCES [dbo].[plantation] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[installation] CHECK CONSTRAINT [FK_installation_plantation]
GO
ALTER TABLE [dbo].[installation]  WITH CHECK ADD  CONSTRAINT [FK_installation_sensor] FOREIGN KEY([sensorID])
REFERENCES [dbo].[sensor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[installation] CHECK CONSTRAINT [FK_installation_sensor]
GO
ALTER TABLE [dbo].[plantation]  WITH CHECK ADD  CONSTRAINT [FK_plantation_client] FOREIGN KEY([clientID])
REFERENCES [dbo].[client] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[plantation] CHECK CONSTRAINT [FK_plantation_client]
GO
ALTER TABLE [dbo].[plantation]  WITH CHECK ADD  CONSTRAINT [FK_plantation_crop] FOREIGN KEY([cropID])
REFERENCES [dbo].[crop] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[plantation] CHECK CONSTRAINT [FK_plantation_crop]
GO
ALTER TABLE [dbo].[plantation]  WITH CHECK ADD  CONSTRAINT [FK_plantation_edgeNode] FOREIGN KEY([edgeNodeID])
REFERENCES [dbo].[edgeNode] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[plantation] CHECK CONSTRAINT [FK_plantation_edgeNode]
GO
ALTER TABLE [dbo].[plantation]  WITH CHECK ADD  CONSTRAINT [FK_plantation_mqttConnection] FOREIGN KEY([mqttConnectionID])
REFERENCES [dbo].[mqttConnection] ([id])
GO
ALTER TABLE [dbo].[plantation] CHECK CONSTRAINT [FK_plantation_mqttConnection]
GO
ALTER TABLE [dbo].[sensor]  WITH CHECK ADD  CONSTRAINT [FK_sensor_sensorClass] FOREIGN KEY([sensorClassID])
REFERENCES [dbo].[sensorClass] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sensor] CHECK CONSTRAINT [FK_sensor_sensorClass]
GO
/****** Object:  StoredProcedure [dbo].[getActuatorsFromPlantationID]    Script Date: 10/01/2023 17:40:25 ******/
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
/****** Object:  StoredProcedure [dbo].[getEdgeNodeConfig]    Script Date: 10/01/2023 17:40:25 ******/
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
/****** Object:  StoredProcedure [dbo].[getMQTTConnectionFromPlantationID]    Script Date: 10/01/2023 17:40:25 ******/
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
ALTER DATABASE [SA-database_test] SET  READ_WRITE 
GO

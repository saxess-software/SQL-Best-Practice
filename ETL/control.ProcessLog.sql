
/*
Table for storing process informations
DataFactory 4.0
Gerd Tautenhahn for saxess-software gmbh
02/2017
*/


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[control].[ProcessLog]') AND type in (N'U'))
DROP TABLE [control].[ProcessLog]
GO

CREATE TABLE control.ProcessLog
(
    EntryKey BIGINT NOT NULL IDENTITY (1,1),
	ProcessGroup NVARCHAR(255) NOT NULL,
	ProcessStep NVARCHAR(255) NOT NULL,
	StartDateTime DATETIME NOT NULL,
	EndDateTime DATETIME NOT NULL,
	Status NVARCHAR(255) NOT NULL,
	EffectedRows BIGINT NOT NULL,
	Message NVARCHAR(MAX)

	CONSTRAINT PK_control_ProcessLog PRIMARY KEY CLUSTERED (EntryKey)
)
GO
USE [Raosystem]
GO

DENY SELECT ON [dbo].[Cliente]
TO V_OMAR 
GO

GRANT SELECT ON [dbo].[Cliente]
TO V_OMAR
GO

USE [Raosystem]
GO

REVOKE SELECT ON [dbo].[Cliente]
TO V_OMAR
go







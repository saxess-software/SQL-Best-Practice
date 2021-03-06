/*

DATAOUTPUT Procedure for analysing Userrights
Stefan Lindenlaub 02/2017

*/


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sx_pf_DATAOUTPUT_UserRights]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sx_pf_DATAOUTPUT_UserRights]
GO

CREATE PROCEDURE sx_pf_DATAOUTPUT_UserRights

AS 

SET NOCOUNT ON 

SELECT vUR.UserKey
      ,vUR.UserName
	  ,rU.PersonSurname
	  ,rU.PersonFirstName
	  ,rU.Email
	  ,rU.LDAPIP
	  ,rU.Status AS UserStatus
      ,vUR.FactoryID
	  ,dF.FactoryID + ' ' + dF.NameShort		AS FactoryIDName 
      ,dF.NameShort								AS FactoryName
      ,dF.ResponsiblePerson						AS FResponsiblePerson 
	  ,vUR.ProductLineID
	  ,dPL.ProductLineID + ' ' + dPL.NameShort	AS ProductLineIDName
      ,dPL.NameShort								AS ProductLineName
      ,dPL.ResponsiblePerson						AS PLResponsiblePerson
      ,vUR.[Right]
      ,vUR.ReadCommentMandatory
      ,vUR.WriteCommentMandatory
FROM sx_pf_vUserRights vUR
	LEFT JOIN dbo.sx_pf_dFactories dF		ON dF.FactoryID = vUR.FactoryID
	LEFT JOIN dbo.sx_pf_dProductLines dPL	ON dPL.ProductLineID = vUR.ProductLineID AND dPL.FactoryID = vUR.FactoryID
	LEFT JOIN dbo.sx_pf_rUser rU			ON rU.UserKey = vUR.UserKey
WHERE vUR.FactoryID <> '' AND vUR.ProductLineID <>''
ORDER BY dF.FactoryID


GO

GRANT EXECUTE ON OBJECT ::sx_pf_DATAOUTPUT_UserRights TO pf_PlanningFactoryUser;
GRANT EXECUTE ON OBJECT ::sx_pf_DATAOUTPUT_UserRights TO pf_PlanningFactoryService;
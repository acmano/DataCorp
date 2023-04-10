/* 
 * PROCEDURE: [cep.enderecosTiposProSel] 
 */

CREATE PROCEDURE [cep.enderecosTiposProSel]
(
    @endTipID     int)
AS
BEGIN
    SELECT [endTipID],
           [codigo],
           [nome]
      FROM [cep].[enderecosTipos]
     WHERE [endTipID] = @endTipID

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosTiposProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposProSel >>>'
go



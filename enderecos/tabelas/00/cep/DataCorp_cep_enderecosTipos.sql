/*
* TABELA: [DataCorp].[cep].[enderecosTipos]
*/

USE DataCorp
GO

SET CONCAT_NULL_YIELDS_NULL OFF;
SET NOCOUNT ON ;

DECLARE @mensagem   varchar(100);
DECLARE @erro BIT = 0;

BEGIN TRY
  DECLARE @mensagemP1 varchar(100) = '<<< ';
  DECLARE @mensagemP2 varchar(100);
  DECLARE @mensagemP3 varchar(100);
  DECLARE @mensagemP4 varchar(100);
  
  SET @erro = 1
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[enderecosTipos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'enderecosTipos' )
  BEGIN
    DROP TABLE [cep].[enderecosTipos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[enderecosTipos] >>>'
  CREATE TABLE [cep].[enderecosTipos]
  (

    [endTipId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [enderecosTiposendTipIdNn] NOT NULL

  , [codigo]
      VARCHAR(16)
      CONSTRAINT [enderecosTiposCodigoNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [enderecosTiposDescricaoNn] NOT NULL

  )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[enderecosTipos].[endTipPk] >>>'
  ALTER TABLE [cep].[enderecosTipos]
    ADD CONSTRAINT [endTipPk]
      PRIMARY KEY CLUSTERED
      (
        [endTipId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[enderecosTipos].[endTipIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTipos') AND name='endTipIxAk')
  BEGIN
    DROP INDEX [cep].[enderecosTipos].[endTipIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 5
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[enderecosTipos].[endTipIxAk] >>>'
  CREATE UNIQUE INDEX [endTipIxAk]
    ON [cep].[enderecosTipos]
    (
      [codigo]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

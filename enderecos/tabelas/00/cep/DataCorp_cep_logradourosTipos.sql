/*
* TABELA: [DataCorp].[cep].[logradourosTipos]
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
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[logradourosTipos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'logradourosTipos' )
  BEGIN
    DROP TABLE [cep].[logradourosTipos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[logradourosTipos] >>>'
  CREATE TABLE [cep].[logradourosTipos]
  (

    [logTipId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [logradourosTiposlogTipIdNn] NOT NULL

  , [nome]
      VARCHAR(64)
      CONSTRAINT [logradourosTiposNomeNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [logradourosTiposDescricaoNn] NOT NULL

  , [descricaoAbreviada]
      VARCHAR(32)
      CONSTRAINT [logradourosTiposDescricaoAbreviadaNn] NOT NULL

  )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[logradourosTipos].[logTipPk] >>>'
  ALTER TABLE [cep].[logradourosTipos]
    ADD CONSTRAINT [logTipPk]
      PRIMARY KEY CLUSTERED
      (
        [logTipId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[logradourosTipos].[logTipIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradourosTipos') AND name='logTipIxAk')
  BEGIN
    DROP INDEX [cep].[logradourosTipos].[logTipIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 5
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[logradourosTipos].[logTipIxAk] >>>'
  CREATE UNIQUE INDEX [logTipIxAk]
    ON [cep].[logradourosTipos]
    (
      [nome]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

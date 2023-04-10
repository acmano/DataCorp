/*
* TABELA: [DataCorp].[cep].[enderecosEnderecosTipos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipFkEndTip] >>>'
  IF OBJECT_ID('[cep].[endEndTipFkEndTip]') IS NOT NULL
    ALTER TABLE [cep].[enderecosEnderecosTipos]
      DROP CONSTRAINT [endEndTipFkEndTip]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipFkEnd] >>>'
  IF OBJECT_ID('[cep].[endEndTipFkEnd]') IS NOT NULL
    ALTER TABLE [cep].[enderecosEnderecosTipos]
      DROP CONSTRAINT [endEndTipFkEnd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[enderecosEnderecosTipos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'enderecosEnderecosTipos' )
  BEGIN
    DROP TABLE [cep].[enderecosEnderecosTipos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[enderecosEnderecosTipos]
  (

    [endEndTipId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [enderecosEnderecosTiposendEndTipIdNn] NOT NULL

  , [endTipId]
      BIGINT
      CONSTRAINT [enderecosEnderecosTiposendTipIdNn] NOT NULL

  , [endId]
      BIGINT
      CONSTRAINT [enderecosEnderecosTiposendIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipPk] >>>'
  ALTER TABLE [cep].[enderecosEnderecosTipos]
    ADD CONSTRAINT [endEndTipPk]
      PRIMARY KEY CLUSTERED
      (
        [endEndTipId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosEnderecosTipos') AND name='endEndTipIxAk')
  BEGIN
    DROP INDEX [cep].[enderecosEnderecosTipos].[endEndTipIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipIxAk] >>>'
  CREATE UNIQUE INDEX [endEndTipIxAk]
    ON [cep].[enderecosEnderecosTipos]
    (
      [endTipId]
    , [endId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipIxFkEndTip] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosEnderecosTipos') AND name='endEndTipIxFkEndTip')
  BEGIN
    DROP INDEX [cep].[enderecosEnderecosTipos].[endEndTipIxFkEndTip]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [endEndTipIxFkEndTip]
    ON [cep].[enderecosEnderecosTipos]
    (
      [endTipId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipFkEndTip] >>>'
  ALTER TABLE [cep].[enderecosEnderecosTipos]
    ADD CONSTRAINT [endEndTipFkEndTip]
    FOREIGN KEY
    (
      [endTipId]
    )
    REFERENCES [DataCorp].[cep].[enderecosTipos]
    (
      [endTipId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipIxFkEnd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosEnderecosTipos') AND name='endEndTipIxFkEnd')
  BEGIN
    DROP INDEX [cep].[enderecosEnderecosTipos].[endEndTipIxFkEnd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [endEndTipIxFkEnd]
    ON [cep].[enderecosEnderecosTipos]
    (
      [endId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[enderecosEnderecosTipos].[endEndTipFkEnd] >>>'
  ALTER TABLE [cep].[enderecosEnderecosTipos]
    ADD CONSTRAINT [endEndTipFkEnd]
    FOREIGN KEY
    (
      [endId]
    )
    REFERENCES [DataCorp].[cep].[enderecos]
    (
      [endId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

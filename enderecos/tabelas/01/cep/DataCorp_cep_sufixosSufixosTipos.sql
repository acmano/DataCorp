/*
* TABELA: [DataCorp].[cep].[sufixosSufixosTipos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipFkSufTip] >>>'
  IF OBJECT_ID('[cep].[sufSufTipFkSufTip]') IS NOT NULL
    ALTER TABLE [cep].[sufixosSufixosTipos]
      DROP CONSTRAINT [sufSufTipFkSufTip]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipFkSuf] >>>'
  IF OBJECT_ID('[cep].[sufSufTipFkSuf]') IS NOT NULL
    ALTER TABLE [cep].[sufixosSufixosTipos]
      DROP CONSTRAINT [sufSufTipFkSuf]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[sufixosSufixosTipos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'sufixosSufixosTipos' )
  BEGIN
    DROP TABLE [cep].[sufixosSufixosTipos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[sufixosSufixosTipos]
  (

    [sufSufTipId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [sufixosSufixosTipossufSufTipIdNn] NOT NULL

  , [sufTipId]
      BIGINT
      CONSTRAINT [sufixosSufixosTipossufTipIdNn] NOT NULL

  , [sufId]
      BIGINT
      CONSTRAINT [sufixosSufixosTipossufIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipPk] >>>'
  ALTER TABLE [cep].[sufixosSufixosTipos]
    ADD CONSTRAINT [sufSufTipPk]
      PRIMARY KEY CLUSTERED
      (
        [sufSufTipId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosSufixosTipos') AND name='sufSufTipIxAk')
  BEGIN
    DROP INDEX [cep].[sufixosSufixosTipos].[sufSufTipIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipIxAk] >>>'
  CREATE UNIQUE INDEX [sufSufTipIxAk]
    ON [cep].[sufixosSufixosTipos]
    (
      [sufTipId]
    , [sufId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipIxFkSufTip] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosSufixosTipos') AND name='sufSufTipIxFkSufTip')
  BEGIN
    DROP INDEX [cep].[sufixosSufixosTipos].[sufSufTipIxFkSufTip]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [sufSufTipIxFkSufTip]
    ON [cep].[sufixosSufixosTipos]
    (
      [sufTipId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipFkSufTip] >>>'
  ALTER TABLE [cep].[sufixosSufixosTipos]
    ADD CONSTRAINT [sufSufTipFkSufTip]
    FOREIGN KEY
    (
      [sufTipId]
    )
    REFERENCES [DataCorp].[cep].[sufixosTipos]
    (
      [sufTipId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipIxFkSuf] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosSufixosTipos') AND name='sufSufTipIxFkSuf')
  BEGIN
    DROP INDEX [cep].[sufixosSufixosTipos].[sufSufTipIxFkSuf]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [sufSufTipIxFkSuf]
    ON [cep].[sufixosSufixosTipos]
    (
      [sufId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[sufixosSufixosTipos].[sufSufTipFkSuf] >>>'
  ALTER TABLE [cep].[sufixosSufixosTipos]
    ADD CONSTRAINT [sufSufTipFkSuf]
    FOREIGN KEY
    (
      [sufId]
    )
    REFERENCES [DataCorp].[cep].[sufixos]
    (
      [sufId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

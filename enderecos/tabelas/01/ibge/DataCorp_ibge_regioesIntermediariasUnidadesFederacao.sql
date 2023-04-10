/*
* TABELA: [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedFkUniFed] >>>'
  IF OBJECT_ID('[ibge].[regIntUniFedFkUniFed]') IS NOT NULL
    ALTER TABLE [ibge].[regioesIntermediariasUnidadesFederacao]
      DROP CONSTRAINT [regIntUniFedFkUniFed]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedFkRegInt] >>>'
  IF OBJECT_ID('[ibge].[regIntUniFedFkRegInt]') IS NOT NULL
    ALTER TABLE [ibge].[regioesIntermediariasUnidadesFederacao]
      DROP CONSTRAINT [regIntUniFedFkRegInt]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'regioesIntermediariasUnidadesFederacao' )
  BEGIN
    DROP TABLE [ibge].[regioesIntermediariasUnidadesFederacao]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[regioesIntermediariasUnidadesFederacao]
  (

    [regIntUniFedId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [regioesIntermediariasUnidadesFederacaoregIntUniFedIdNn] NOT NULL

  , [uniFedId]
      BIGINT
      CONSTRAINT [regioesIntermediariasUnidadesFederacaouniFedIdNn] NOT NULL

  , [regIntId]
      BIGINT
      CONSTRAINT [regioesIntermediariasUnidadesFederacaoregIntIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedPk] >>>'
  ALTER TABLE [ibge].[regioesIntermediariasUnidadesFederacao]
    ADD CONSTRAINT [regIntUniFedPk]
      PRIMARY KEY CLUSTERED
      (
        [regIntUniFedId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadesFederacao') AND name='regIntUniFedIxAk')
  BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedIxAk] >>>'
  CREATE UNIQUE INDEX [regIntUniFedIxAk]
    ON [ibge].[regioesIntermediariasUnidadesFederacao]
    (
      [uniFedId]
    , [regIntId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedIxFkUniFed] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadesFederacao') AND name='regIntUniFedIxFkUniFed')
  BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedIxFkUniFed]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [regIntUniFedIxFkUniFed]
    ON [ibge].[regioesIntermediariasUnidadesFederacao]
    (
      [uniFedId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedFkUniFed] >>>'
  ALTER TABLE [ibge].[regioesIntermediariasUnidadesFederacao]
    ADD CONSTRAINT [regIntUniFedFkUniFed]
    FOREIGN KEY
    (
      [uniFedId]
    )
    REFERENCES [DataCorp].[ibge].[unidadesFederacao]
    (
      [uniFedId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedIxFkRegInt] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadesFederacao') AND name='regIntUniFedIxFkRegInt')
  BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedIxFkRegInt]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [regIntUniFedIxFkRegInt]
    ON [ibge].[regioesIntermediariasUnidadesFederacao]
    (
      [regIntId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesIntermediariasUnidadesFederacao].[regIntUniFedFkRegInt] >>>'
  ALTER TABLE [ibge].[regioesIntermediariasUnidadesFederacao]
    ADD CONSTRAINT [regIntUniFedFkRegInt]
    FOREIGN KEY
    (
      [regIntId]
    )
    REFERENCES [DataCorp].[ibge].[regioesIntermediarias]
    (
      [regIntId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

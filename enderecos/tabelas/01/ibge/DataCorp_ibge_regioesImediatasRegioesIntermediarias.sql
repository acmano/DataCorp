/*
* TABELA: [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntFkRegInt] >>>'
  IF OBJECT_ID('[ibge].[regImeRegIntFkRegInt]') IS NOT NULL
    ALTER TABLE [ibge].[regioesImediatasRegioesIntermediarias]
      DROP CONSTRAINT [regImeRegIntFkRegInt]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntFkRegIme] >>>'
  IF OBJECT_ID('[ibge].[regImeRegIntFkRegIme]') IS NOT NULL
    ALTER TABLE [ibge].[regioesImediatasRegioesIntermediarias]
      DROP CONSTRAINT [regImeRegIntFkRegIme]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'regioesImediatasRegioesIntermediarias' )
  BEGIN
    DROP TABLE [ibge].[regioesImediatasRegioesIntermediarias]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[regioesImediatasRegioesIntermediarias]
  (

    [regImeRegIntId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [regioesImediatasRegioesIntermediariasregImeRegIntIdNn] NOT NULL

  , [regIntId]
      BIGINT
      CONSTRAINT [regioesImediatasRegioesIntermediariasregIntIdNn] NOT NULL

  , [regImeId]
      BIGINT
      CONSTRAINT [regioesImediatasRegioesIntermediariasregImeIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntPk] >>>'
  ALTER TABLE [ibge].[regioesImediatasRegioesIntermediarias]
    ADD CONSTRAINT [regImeRegIntPk]
      PRIMARY KEY CLUSTERED
      (
        [regImeRegIntId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegioesIntermediarias') AND name='regImeRegIntIxAk')
  BEGIN
    DROP INDEX [ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntIxAk] >>>'
  CREATE UNIQUE INDEX [regImeRegIntIxAk]
    ON [ibge].[regioesImediatasRegioesIntermediarias]
    (
      [regIntId]
    , [regImeId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntIxFkRegInt] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegioesIntermediarias') AND name='regImeRegIntIxFkRegInt')
  BEGIN
    DROP INDEX [ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntIxFkRegInt]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [regImeRegIntIxFkRegInt]
    ON [ibge].[regioesImediatasRegioesIntermediarias]
    (
      [regIntId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntFkRegInt] >>>'
  ALTER TABLE [ibge].[regioesImediatasRegioesIntermediarias]
    ADD CONSTRAINT [regImeRegIntFkRegInt]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntIxFkRegIme] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegioesIntermediarias') AND name='regImeRegIntIxFkRegIme')
  BEGIN
    DROP INDEX [ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntIxFkRegIme]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [regImeRegIntIxFkRegIme]
    ON [ibge].[regioesImediatasRegioesIntermediarias]
    (
      [regImeId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesImediatasRegioesIntermediarias].[regImeRegIntFkRegIme] >>>'
  ALTER TABLE [ibge].[regioesImediatasRegioesIntermediarias]
    ADD CONSTRAINT [regImeRegIntFkRegIme]
    FOREIGN KEY
    (
      [regImeId]
    )
    REFERENCES [DataCorp].[ibge].[regioesImediatas]
    (
      [regImeId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

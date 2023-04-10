/*
* TABELA: [DataCorp].[ibge].[municipiosRegioesImediatas]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeFkRegIme] >>>'
  IF OBJECT_ID('[ibge].[munRegImeFkRegIme]') IS NOT NULL
    ALTER TABLE [ibge].[municipiosRegioesImediatas]
      DROP CONSTRAINT [munRegImeFkRegIme]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeFkMun] >>>'
  IF OBJECT_ID('[ibge].[munRegImeFkMun]') IS NOT NULL
    ALTER TABLE [ibge].[municipiosRegioesImediatas]
      DROP CONSTRAINT [munRegImeFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[municipiosRegioesImediatas] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'municipiosRegioesImediatas' )
  BEGIN
    DROP TABLE [ibge].[municipiosRegioesImediatas]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[municipiosRegioesImediatas]
  (

    [munRegImeId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [municipiosRegioesImediatasmunRegImeIdNn] NOT NULL

  , [regImeId]
      BIGINT
      CONSTRAINT [municipiosRegioesImediatasregImeIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [municipiosRegioesImediatasmunIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImePk] >>>'
  ALTER TABLE [ibge].[municipiosRegioesImediatas]
    ADD CONSTRAINT [munRegImePk]
      PRIMARY KEY CLUSTERED
      (
        [munRegImeId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegioesImediatas') AND name='munRegImeIxAk')
  BEGIN
    DROP INDEX [ibge].[municipiosRegioesImediatas].[munRegImeIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeIxAk] >>>'
  CREATE UNIQUE INDEX [munRegImeIxAk]
    ON [ibge].[municipiosRegioesImediatas]
    (
      [regImeId]
    , [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeIxFkRegIme] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegioesImediatas') AND name='munRegImeIxFkRegIme')
  BEGIN
    DROP INDEX [ibge].[municipiosRegioesImediatas].[munRegImeIxFkRegIme]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [munRegImeIxFkRegIme]
    ON [ibge].[municipiosRegioesImediatas]
    (
      [regImeId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeFkRegIme] >>>'
  ALTER TABLE [ibge].[municipiosRegioesImediatas]
    ADD CONSTRAINT [munRegImeFkRegIme]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegioesImediatas') AND name='munRegImeIxFkMun')
  BEGIN
    DROP INDEX [ibge].[municipiosRegioesImediatas].[munRegImeIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [munRegImeIxFkMun]
    ON [ibge].[municipiosRegioesImediatas]
    (
      [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosRegioesImediatas].[munRegImeFkMun] >>>'
  ALTER TABLE [ibge].[municipiosRegioesImediatas]
    ADD CONSTRAINT [munRegImeFkMun]
    FOREIGN KEY
    (
      [munId]
    )
    REFERENCES [DataCorp].[ibge].[municipios]
    (
      [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

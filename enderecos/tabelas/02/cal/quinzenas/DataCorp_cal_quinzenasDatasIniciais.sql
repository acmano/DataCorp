/*
* TABELA: [DataCorp].[cal].[quinzenasDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[quiDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[quinzenasDatasIniciais]
      DROP CONSTRAINT [quiDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniFkQui] >>>'
  IF OBJECT_ID('[cal].[quiDatIniFkQui]') IS NOT NULL
    ALTER TABLE [cal].[quinzenasDatasIniciais]
      DROP CONSTRAINT [quiDatIniFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[quinzenasDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'quinzenasDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[quinzenasDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[quinzenasDatasIniciais]
  (

    [quiDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [quinzenasDatasIniciaisquiDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [quinzenasDatasIniciaisdatIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [quinzenasDatasIniciaisquiIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniPk] >>>'
  ALTER TABLE [cal].[quinzenasDatasIniciais]
    ADD CONSTRAINT [quiDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [quiDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasDatasIniciais') AND name='quiDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[quinzenasDatasIniciais].[quiDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [quiDatIniIxAk]
    ON [cal].[quinzenasDatasIniciais]
    (
      [datId]
    , [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasDatasIniciais') AND name='quiDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[quinzenasDatasIniciais].[quiDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [quiDatIniIxFkDat]
    ON [cal].[quinzenasDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniFkDat] >>>'
  ALTER TABLE [cal].[quinzenasDatasIniciais]
    ADD CONSTRAINT [quiDatIniFkDat]
    FOREIGN KEY
    (
      [datId]
    )
    REFERENCES [DataCorp].[cal].[datas]
    (
      [datId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasDatasIniciais') AND name='quiDatIniIxFkQui')
  BEGIN
    DROP INDEX [cal].[quinzenasDatasIniciais].[quiDatIniIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [quiDatIniIxFkQui]
    ON [cal].[quinzenasDatasIniciais]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasIniciais].[quiDatIniFkQui] >>>'
  ALTER TABLE [cal].[quinzenasDatasIniciais]
    ADD CONSTRAINT [quiDatIniFkQui]
    FOREIGN KEY
    (
      [quiId]
    )
    REFERENCES [DataCorp].[cal].[quinzenas]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

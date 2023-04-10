/*
* TABELA: [DataCorp].[cal].[quinzenasDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[quiDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[quinzenasDatasFinais]
      DROP CONSTRAINT [quiDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinFkQui] >>>'
  IF OBJECT_ID('[cal].[quiDatFinFkQui]') IS NOT NULL
    ALTER TABLE [cal].[quinzenasDatasFinais]
      DROP CONSTRAINT [quiDatFinFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[quinzenasDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'quinzenasDatasFinais' )
  BEGIN
    DROP TABLE [cal].[quinzenasDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[quinzenasDatasFinais]
  (

    [quiDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [quinzenasDatasFinaisquiDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [quinzenasDatasFinaisdatIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [quinzenasDatasFinaisquiIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinPk] >>>'
  ALTER TABLE [cal].[quinzenasDatasFinais]
    ADD CONSTRAINT [quiDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [quiDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasDatasFinais') AND name='quiDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[quinzenasDatasFinais].[quiDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [quiDatFinIxAk]
    ON [cal].[quinzenasDatasFinais]
    (
      [datId]
    , [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasDatasFinais') AND name='quiDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[quinzenasDatasFinais].[quiDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [quiDatFinIxFkDat]
    ON [cal].[quinzenasDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinFkDat] >>>'
  ALTER TABLE [cal].[quinzenasDatasFinais]
    ADD CONSTRAINT [quiDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasDatasFinais') AND name='quiDatFinIxFkQui')
  BEGIN
    DROP INDEX [cal].[quinzenasDatasFinais].[quiDatFinIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [quiDatFinIxFkQui]
    ON [cal].[quinzenasDatasFinais]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasDatasFinais].[quiDatFinFkQui] >>>'
  ALTER TABLE [cal].[quinzenasDatasFinais]
    ADD CONSTRAINT [quiDatFinFkQui]
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

/*
* TABELA: [DataCorp].[cal].[trimestresDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasFinais].[triDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[triDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[trimestresDatasFinais]
      DROP CONSTRAINT [triDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasFinais].[triDatFinFkTri] >>>'
  IF OBJECT_ID('[cal].[triDatFinFkTri]') IS NOT NULL
    ALTER TABLE [cal].[trimestresDatasFinais]
      DROP CONSTRAINT [triDatFinFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[trimestresDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'trimestresDatasFinais' )
  BEGIN
    DROP TABLE [cal].[trimestresDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[trimestresDatasFinais]
  (

    [triDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [trimestresDatasFinaistriDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [trimestresDatasFinaisdatIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [trimestresDatasFinaistriIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[trimestresDatasFinais].[triDatFinPk] >>>'
  ALTER TABLE [cal].[trimestresDatasFinais]
    ADD CONSTRAINT [triDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [triDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasFinais].[triDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresDatasFinais') AND name='triDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[trimestresDatasFinais].[triDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasFinais].[triDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [triDatFinIxAk]
    ON [cal].[trimestresDatasFinais]
    (
      [datId]
    , [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasFinais].[triDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresDatasFinais') AND name='triDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[trimestresDatasFinais].[triDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [triDatFinIxFkDat]
    ON [cal].[trimestresDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasFinais].[triDatFinFkDat] >>>'
  ALTER TABLE [cal].[trimestresDatasFinais]
    ADD CONSTRAINT [triDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasFinais].[triDatFinIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresDatasFinais') AND name='triDatFinIxFkTri')
  BEGIN
    DROP INDEX [cal].[trimestresDatasFinais].[triDatFinIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [triDatFinIxFkTri]
    ON [cal].[trimestresDatasFinais]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasFinais].[triDatFinFkTri] >>>'
  ALTER TABLE [cal].[trimestresDatasFinais]
    ADD CONSTRAINT [triDatFinFkTri]
    FOREIGN KEY
    (
      [triId]
    )
    REFERENCES [DataCorp].[cal].[trimestres]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

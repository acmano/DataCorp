/*
* TABELA: [DataCorp].[cal].[mesesDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasFinais].[mesDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[mesDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[mesesDatasFinais]
      DROP CONSTRAINT [mesDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasFinais].[mesDatFinFkMes] >>>'
  IF OBJECT_ID('[cal].[mesDatFinFkMes]') IS NOT NULL
    ALTER TABLE [cal].[mesesDatasFinais]
      DROP CONSTRAINT [mesDatFinFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mesesDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mesesDatasFinais' )
  BEGIN
    DROP TABLE [cal].[mesesDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mesesDatasFinais]
  (

    [mesDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mesesDatasFinaismesDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [mesesDatasFinaisdatIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [mesesDatasFinaismesIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mesesDatasFinais].[mesDatFinPk] >>>'
  ALTER TABLE [cal].[mesesDatasFinais]
    ADD CONSTRAINT [mesDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [mesDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasFinais].[mesDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesDatasFinais') AND name='mesDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[mesesDatasFinais].[mesDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasFinais].[mesDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [mesDatFinIxAk]
    ON [cal].[mesesDatasFinais]
    (
      [datId]
    , [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasFinais].[mesDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesDatasFinais') AND name='mesDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[mesesDatasFinais].[mesDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [mesDatFinIxFkDat]
    ON [cal].[mesesDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasFinais].[mesDatFinFkDat] >>>'
  ALTER TABLE [cal].[mesesDatasFinais]
    ADD CONSTRAINT [mesDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasFinais].[mesDatFinIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesDatasFinais') AND name='mesDatFinIxFkMes')
  BEGIN
    DROP INDEX [cal].[mesesDatasFinais].[mesDatFinIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [mesDatFinIxFkMes]
    ON [cal].[mesesDatasFinais]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasFinais].[mesDatFinFkMes] >>>'
  ALTER TABLE [cal].[mesesDatasFinais]
    ADD CONSTRAINT [mesDatFinFkMes]
    FOREIGN KEY
    (
      [mesId]
    )
    REFERENCES [DataCorp].[cal].[meses]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

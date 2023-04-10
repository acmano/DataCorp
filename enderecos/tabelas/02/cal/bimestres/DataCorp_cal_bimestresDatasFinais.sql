/*
* TABELA: [DataCorp].[cal].[bimestresDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[bimDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[bimestresDatasFinais]
      DROP CONSTRAINT [bimDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinFkBim] >>>'
  IF OBJECT_ID('[cal].[bimDatFinFkBim]') IS NOT NULL
    ALTER TABLE [cal].[bimestresDatasFinais]
      DROP CONSTRAINT [bimDatFinFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[bimestresDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'bimestresDatasFinais' )
  BEGIN
    DROP TABLE [cal].[bimestresDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[bimestresDatasFinais]
  (

    [bimDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [bimestresDatasFinaisbimDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [bimestresDatasFinaisdatIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [bimestresDatasFinaisbimIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinPk] >>>'
  ALTER TABLE [cal].[bimestresDatasFinais]
    ADD CONSTRAINT [bimDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [bimDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresDatasFinais') AND name='bimDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[bimestresDatasFinais].[bimDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [bimDatFinIxAk]
    ON [cal].[bimestresDatasFinais]
    (
      [datId]
    , [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresDatasFinais') AND name='bimDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[bimestresDatasFinais].[bimDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [bimDatFinIxFkDat]
    ON [cal].[bimestresDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinFkDat] >>>'
  ALTER TABLE [cal].[bimestresDatasFinais]
    ADD CONSTRAINT [bimDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresDatasFinais') AND name='bimDatFinIxFkBim')
  BEGIN
    DROP INDEX [cal].[bimestresDatasFinais].[bimDatFinIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [bimDatFinIxFkBim]
    ON [cal].[bimestresDatasFinais]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasFinais].[bimDatFinFkBim] >>>'
  ALTER TABLE [cal].[bimestresDatasFinais]
    ADD CONSTRAINT [bimDatFinFkBim]
    FOREIGN KEY
    (
      [bimId]
    )
    REFERENCES [DataCorp].[cal].[bimestres]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

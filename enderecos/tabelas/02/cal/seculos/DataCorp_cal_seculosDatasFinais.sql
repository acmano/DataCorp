/*
* TABELA: [DataCorp].[cal].[seculosDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasFinais].[secDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[secDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[seculosDatasFinais]
      DROP CONSTRAINT [secDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasFinais].[secDatFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secDatFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosDatasFinais]
      DROP CONSTRAINT [secDatFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosDatasFinais' )
  BEGIN
    DROP TABLE [cal].[seculosDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosDatasFinais]
  (

    [secDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosDatasFinaissecDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [seculosDatasFinaisdatIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosDatasFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosDatasFinais].[secDatFinPk] >>>'
  ALTER TABLE [cal].[seculosDatasFinais]
    ADD CONSTRAINT [secDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasFinais].[secDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDatasFinais') AND name='secDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosDatasFinais].[secDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasFinais].[secDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [secDatFinIxAk]
    ON [cal].[seculosDatasFinais]
    (
      [datId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasFinais].[secDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDatasFinais') AND name='secDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[seculosDatasFinais].[secDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secDatFinIxFkDat]
    ON [cal].[seculosDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasFinais].[secDatFinFkDat] >>>'
  ALTER TABLE [cal].[seculosDatasFinais]
    ADD CONSTRAINT [secDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasFinais].[secDatFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDatasFinais') AND name='secDatFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosDatasFinais].[secDatFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secDatFinIxFkSec]
    ON [cal].[seculosDatasFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasFinais].[secDatFinFkSec] >>>'
  ALTER TABLE [cal].[seculosDatasFinais]
    ADD CONSTRAINT [secDatFinFkSec]
    FOREIGN KEY
    (
      [secId]
    )
    REFERENCES [DataCorp].[cal].[seculos]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

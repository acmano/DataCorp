/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[decOrdDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisDatasFinais]
      DROP CONSTRAINT [decOrdDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdDatFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisDatasFinais]
      DROP CONSTRAINT [decOrdDatFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisDatasFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisDatasFinais]
  (

    [decOrdDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisDatasFinaisdecOrdDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisDatasFinaisdatIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisDatasFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDatasFinais]
    ADD CONSTRAINT [decOrdDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDatasFinais') AND name='decOrdDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdDatFinIxAk]
    ON [cal].[decendiosOrdinaisDatasFinais]
    (
      [datId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDatasFinais') AND name='decOrdDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdDatFinIxFkDat]
    ON [cal].[decendiosOrdinaisDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinFkDat] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDatasFinais]
    ADD CONSTRAINT [decOrdDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDatasFinais') AND name='decOrdDatFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdDatFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisDatasFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDatasFinais].[decOrdDatFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDatasFinais]
    ADD CONSTRAINT [decOrdDatFinFkDecOrd]
    FOREIGN KEY
    (
      [decOrdId]
    )
    REFERENCES [DataCorp].[cal].[decendiosOrdinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

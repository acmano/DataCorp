/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisBimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinFkBim] >>>'
  IF OBJECT_ID('[cal].[decOrdBimFinFkBim]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisBimestresFinais]
      DROP CONSTRAINT [decOrdBimFinFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdBimFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisBimestresFinais]
      DROP CONSTRAINT [decOrdBimFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisBimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisBimestresFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisBimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisBimestresFinais]
  (

    [decOrdBimFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisBimestresFinaisdecOrdBimFinIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisBimestresFinaisbimIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisBimestresFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisBimestresFinais]
    ADD CONSTRAINT [decOrdBimFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdBimFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisBimestresFinais') AND name='decOrdBimFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdBimFinIxAk]
    ON [cal].[decendiosOrdinaisBimestresFinais]
    (
      [bimId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisBimestresFinais') AND name='decOrdBimFinIxFkBim')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdBimFinIxFkBim]
    ON [cal].[decendiosOrdinaisBimestresFinais]
    (
      [bimId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinFkBim] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisBimestresFinais]
    ADD CONSTRAINT [decOrdBimFinFkBim]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisBimestresFinais') AND name='decOrdBimFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdBimFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisBimestresFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisBimestresFinais].[decOrdBimFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisBimestresFinais]
    ADD CONSTRAINT [decOrdBimFinFkDecOrd]
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

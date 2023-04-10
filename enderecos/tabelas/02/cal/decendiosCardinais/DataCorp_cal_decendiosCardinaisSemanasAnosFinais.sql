/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinFkSemAno] >>>'
  IF OBJECT_ID('[cal].[decCarSemAnoFinFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasAnosFinais]
      DROP CONSTRAINT [decCarSemAnoFinFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarSemAnoFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasAnosFinais]
      DROP CONSTRAINT [decCarSemAnoFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisSemanasAnosFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisSemanasAnosFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisSemanasAnosFinais]
  (

    [decCarSemAnoFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisSemanasAnosFinaisdecCarSemAnoFinIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasAnosFinaissemAnoIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasAnosFinaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasAnosFinais]
    ADD CONSTRAINT [decCarSemAnoFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarSemAnoFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasAnosFinais') AND name='decCarSemAnoFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinIxAk] >>>'
  CREATE UNIQUE INDEX [decCarSemAnoFinIxAk]
    ON [cal].[decendiosCardinaisSemanasAnosFinais]
    (
      [semAnoId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasAnosFinais') AND name='decCarSemAnoFinIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarSemAnoFinIxFkSemAno]
    ON [cal].[decendiosCardinaisSemanasAnosFinais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinFkSemAno] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasAnosFinais]
    ADD CONSTRAINT [decCarSemAnoFinFkSemAno]
    FOREIGN KEY
    (
      [semAnoId]
    )
    REFERENCES [DataCorp].[cal].[semanasAnos]
    (
      [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasAnosFinais') AND name='decCarSemAnoFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarSemAnoFinIxFkDecCar]
    ON [cal].[decendiosCardinaisSemanasAnosFinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosFinais].[decCarSemAnoFinFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasAnosFinais]
    ADD CONSTRAINT [decCarSemAnoFinFkDecCar]
    FOREIGN KEY
    (
      [decCarId]
    )
    REFERENCES [DataCorp].[cal].[decendiosCardinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

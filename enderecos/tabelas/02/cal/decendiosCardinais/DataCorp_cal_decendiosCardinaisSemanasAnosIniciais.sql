/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniFkSemAno] >>>'
  IF OBJECT_ID('[cal].[decCarSemAnoIniFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasAnosIniciais]
      DROP CONSTRAINT [decCarSemAnoIniFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarSemAnoIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasAnosIniciais]
      DROP CONSTRAINT [decCarSemAnoIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisSemanasAnosIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisSemanasAnosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisSemanasAnosIniciais]
  (

    [decCarSemAnoIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisSemanasAnosIniciaisdecCarSemAnoIniIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasAnosIniciaissemAnoIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasAnosIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasAnosIniciais]
    ADD CONSTRAINT [decCarSemAnoIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarSemAnoIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasAnosIniciais') AND name='decCarSemAnoIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarSemAnoIniIxAk]
    ON [cal].[decendiosCardinaisSemanasAnosIniciais]
    (
      [semAnoId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasAnosIniciais') AND name='decCarSemAnoIniIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarSemAnoIniIxFkSemAno]
    ON [cal].[decendiosCardinaisSemanasAnosIniciais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniFkSemAno] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasAnosIniciais]
    ADD CONSTRAINT [decCarSemAnoIniFkSemAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasAnosIniciais') AND name='decCarSemAnoIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarSemAnoIniIxFkDecCar]
    ON [cal].[decendiosCardinaisSemanasAnosIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasAnosIniciais].[decCarSemAnoIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasAnosIniciais]
    ADD CONSTRAINT [decCarSemAnoIniFkDecCar]
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

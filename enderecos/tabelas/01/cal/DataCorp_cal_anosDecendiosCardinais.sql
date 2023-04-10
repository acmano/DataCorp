/*
* TABELA: [DataCorp].[cal].[anosDecendiosCardinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarFkDecCar] >>>'
  IF OBJECT_ID('[cal].[anoDecCarFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[anosDecendiosCardinais]
      DROP CONSTRAINT [anoDecCarFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarFkAno] >>>'
  IF OBJECT_ID('[cal].[anoDecCarFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosDecendiosCardinais]
      DROP CONSTRAINT [anoDecCarFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosDecendiosCardinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosDecendiosCardinais' )
  BEGIN
    DROP TABLE [cal].[anosDecendiosCardinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosDecendiosCardinais]
  (

    [anoDecCarId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosDecendiosCardinaisanoDecCarIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [anosDecendiosCardinaisdecCarIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosDecendiosCardinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarPk] >>>'
  ALTER TABLE [cal].[anosDecendiosCardinais]
    ADD CONSTRAINT [anoDecCarPk]
      PRIMARY KEY CLUSTERED
      (
        [anoDecCarId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDecendiosCardinais') AND name='anoDecCarIxAk')
  BEGIN
    DROP INDEX [cal].[anosDecendiosCardinais].[anoDecCarIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarIxAk] >>>'
  CREATE UNIQUE INDEX [anoDecCarIxAk]
    ON [cal].[anosDecendiosCardinais]
    (
      [decCarId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDecendiosCardinais') AND name='anoDecCarIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[anosDecendiosCardinais].[anoDecCarIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoDecCarIxFkDecCar]
    ON [cal].[anosDecendiosCardinais]
    (
      [decCarId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarFkDecCar] >>>'
  ALTER TABLE [cal].[anosDecendiosCardinais]
    ADD CONSTRAINT [anoDecCarFkDecCar]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDecendiosCardinais') AND name='anoDecCarIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosDecendiosCardinais].[anoDecCarIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoDecCarIxFkAno]
    ON [cal].[anosDecendiosCardinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosCardinais].[anoDecCarFkAno] >>>'
  ALTER TABLE [cal].[anosDecendiosCardinais]
    ADD CONSTRAINT [anoDecCarFkAno]
    FOREIGN KEY
    (
      [anoId]
    )
    REFERENCES [DataCorp].[cal].[anos]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

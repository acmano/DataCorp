/*
* TABELA: [DataCorp].[cal].[mileniosDecendiosCardinaisFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[milDecCarFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosCardinaisFinais]
      DROP CONSTRAINT [milDecCarFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milDecCarFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosCardinaisFinais]
      DROP CONSTRAINT [milDecCarFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosDecendiosCardinaisFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosDecendiosCardinaisFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosDecendiosCardinaisFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosDecendiosCardinaisFinais]
  (

    [milDecCarFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosDecendiosCardinaisFinaismilDecCarFinIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [mileniosDecendiosCardinaisFinaisdecCarIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosDecendiosCardinaisFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinPk] >>>'
  ALTER TABLE [cal].[mileniosDecendiosCardinaisFinais]
    ADD CONSTRAINT [milDecCarFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milDecCarFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosCardinaisFinais') AND name='milDecCarFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinIxAk] >>>'
  CREATE UNIQUE INDEX [milDecCarFinIxAk]
    ON [cal].[mileniosDecendiosCardinaisFinais]
    (
      [decCarId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosCardinaisFinais') AND name='milDecCarFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milDecCarFinIxFkDecCar]
    ON [cal].[mileniosDecendiosCardinaisFinais]
    (
      [decCarId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinFkDecCar] >>>'
  ALTER TABLE [cal].[mileniosDecendiosCardinaisFinais]
    ADD CONSTRAINT [milDecCarFinFkDecCar]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosCardinaisFinais') AND name='milDecCarFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milDecCarFinIxFkMil]
    ON [cal].[mileniosDecendiosCardinaisFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisFinais].[milDecCarFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosDecendiosCardinaisFinais]
    ADD CONSTRAINT [milDecCarFinFkMil]
    FOREIGN KEY
    (
      [milId]
    )
    REFERENCES [DataCorp].[cal].[milenios]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

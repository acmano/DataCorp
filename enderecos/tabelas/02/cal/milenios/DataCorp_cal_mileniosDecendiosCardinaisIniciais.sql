/*
* TABELA: [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[milDecCarIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosCardinaisIniciais]
      DROP CONSTRAINT [milDecCarIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milDecCarIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosCardinaisIniciais]
      DROP CONSTRAINT [milDecCarIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosDecendiosCardinaisIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosDecendiosCardinaisIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosDecendiosCardinaisIniciais]
  (

    [milDecCarIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosDecendiosCardinaisIniciaismilDecCarIniIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [mileniosDecendiosCardinaisIniciaisdecCarIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosDecendiosCardinaisIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniPk] >>>'
  ALTER TABLE [cal].[mileniosDecendiosCardinaisIniciais]
    ADD CONSTRAINT [milDecCarIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milDecCarIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosCardinaisIniciais') AND name='milDecCarIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniIxAk] >>>'
  CREATE UNIQUE INDEX [milDecCarIniIxAk]
    ON [cal].[mileniosDecendiosCardinaisIniciais]
    (
      [decCarId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosCardinaisIniciais') AND name='milDecCarIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milDecCarIniIxFkDecCar]
    ON [cal].[mileniosDecendiosCardinaisIniciais]
    (
      [decCarId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniFkDecCar] >>>'
  ALTER TABLE [cal].[mileniosDecendiosCardinaisIniciais]
    ADD CONSTRAINT [milDecCarIniFkDecCar]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosCardinaisIniciais') AND name='milDecCarIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milDecCarIniIxFkMil]
    ON [cal].[mileniosDecendiosCardinaisIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosCardinaisIniciais].[milDecCarIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosDecendiosCardinaisIniciais]
    ADD CONSTRAINT [milDecCarIniFkMil]
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

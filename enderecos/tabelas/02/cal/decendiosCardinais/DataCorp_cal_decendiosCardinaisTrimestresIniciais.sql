/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniFkTri] >>>'
  IF OBJECT_ID('[cal].[decCarTriIniFkTri]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisTrimestresIniciais]
      DROP CONSTRAINT [decCarTriIniFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarTriIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisTrimestresIniciais]
      DROP CONSTRAINT [decCarTriIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisTrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisTrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisTrimestresIniciais]
  (

    [decCarTriIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisTrimestresIniciaisdecCarTriIniIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [decendiosCardinaisTrimestresIniciaistriIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisTrimestresIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisTrimestresIniciais]
    ADD CONSTRAINT [decCarTriIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarTriIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisTrimestresIniciais') AND name='decCarTriIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarTriIniIxAk]
    ON [cal].[decendiosCardinaisTrimestresIniciais]
    (
      [triId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisTrimestresIniciais') AND name='decCarTriIniIxFkTri')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarTriIniIxFkTri]
    ON [cal].[decendiosCardinaisTrimestresIniciais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniFkTri] >>>'
  ALTER TABLE [cal].[decendiosCardinaisTrimestresIniciais]
    ADD CONSTRAINT [decCarTriIniFkTri]
    FOREIGN KEY
    (
      [triId]
    )
    REFERENCES [DataCorp].[cal].[trimestres]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisTrimestresIniciais') AND name='decCarTriIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarTriIniIxFkDecCar]
    ON [cal].[decendiosCardinaisTrimestresIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresIniciais].[decCarTriIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisTrimestresIniciais]
    ADD CONSTRAINT [decCarTriIniFkDecCar]
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

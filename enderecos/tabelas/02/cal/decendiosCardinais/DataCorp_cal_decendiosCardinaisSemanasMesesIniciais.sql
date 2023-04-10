/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniFkSemMes] >>>'
  IF OBJECT_ID('[cal].[decCarSemMesIniFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasMesesIniciais]
      DROP CONSTRAINT [decCarSemMesIniFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarSemMesIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasMesesIniciais]
      DROP CONSTRAINT [decCarSemMesIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisSemanasMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisSemanasMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisSemanasMesesIniciais]
  (

    [decCarSemMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisSemanasMesesIniciaisdecCarSemMesIniIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasMesesIniciaissemMesIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasMesesIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasMesesIniciais]
    ADD CONSTRAINT [decCarSemMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarSemMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasMesesIniciais') AND name='decCarSemMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarSemMesIniIxAk]
    ON [cal].[decendiosCardinaisSemanasMesesIniciais]
    (
      [semMesId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasMesesIniciais') AND name='decCarSemMesIniIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarSemMesIniIxFkSemMes]
    ON [cal].[decendiosCardinaisSemanasMesesIniciais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniFkSemMes] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasMesesIniciais]
    ADD CONSTRAINT [decCarSemMesIniFkSemMes]
    FOREIGN KEY
    (
      [semMesId]
    )
    REFERENCES [DataCorp].[cal].[semanasMeses]
    (
      [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasMesesIniciais') AND name='decCarSemMesIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarSemMesIniIxFkDecCar]
    ON [cal].[decendiosCardinaisSemanasMesesIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesIniciais].[decCarSemMesIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasMesesIniciais]
    ADD CONSTRAINT [decCarSemMesIniFkDecCar]
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

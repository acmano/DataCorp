/*
* TABELA: [DataCorp].[cal].[seculosBimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniFkBim] >>>'
  IF OBJECT_ID('[cal].[secBimIniFkBim]') IS NOT NULL
    ALTER TABLE [cal].[seculosBimestresIniciais]
      DROP CONSTRAINT [secBimIniFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secBimIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosBimestresIniciais]
      DROP CONSTRAINT [secBimIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosBimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosBimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosBimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosBimestresIniciais]
  (

    [secBimIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosBimestresIniciaissecBimIniIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [seculosBimestresIniciaisbimIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosBimestresIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniPk] >>>'
  ALTER TABLE [cal].[seculosBimestresIniciais]
    ADD CONSTRAINT [secBimIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secBimIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosBimestresIniciais') AND name='secBimIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosBimestresIniciais].[secBimIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniIxAk] >>>'
  CREATE UNIQUE INDEX [secBimIniIxAk]
    ON [cal].[seculosBimestresIniciais]
    (
      [bimId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosBimestresIniciais') AND name='secBimIniIxFkBim')
  BEGIN
    DROP INDEX [cal].[seculosBimestresIniciais].[secBimIniIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secBimIniIxFkBim]
    ON [cal].[seculosBimestresIniciais]
    (
      [bimId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniFkBim] >>>'
  ALTER TABLE [cal].[seculosBimestresIniciais]
    ADD CONSTRAINT [secBimIniFkBim]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosBimestresIniciais') AND name='secBimIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosBimestresIniciais].[secBimIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secBimIniIxFkSec]
    ON [cal].[seculosBimestresIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosBimestresIniciais].[secBimIniFkSec] >>>'
  ALTER TABLE [cal].[seculosBimestresIniciais]
    ADD CONSTRAINT [secBimIniFkSec]
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

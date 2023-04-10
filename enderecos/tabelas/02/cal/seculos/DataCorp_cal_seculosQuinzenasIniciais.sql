/*
* TABELA: [DataCorp].[cal].[seculosQuinzenasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniFkQui] >>>'
  IF OBJECT_ID('[cal].[secQuiIniFkQui]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuinzenasIniciais]
      DROP CONSTRAINT [secQuiIniFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secQuiIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuinzenasIniciais]
      DROP CONSTRAINT [secQuiIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosQuinzenasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosQuinzenasIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosQuinzenasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosQuinzenasIniciais]
  (

    [secQuiIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosQuinzenasIniciaissecQuiIniIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [seculosQuinzenasIniciaisquiIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosQuinzenasIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniPk] >>>'
  ALTER TABLE [cal].[seculosQuinzenasIniciais]
    ADD CONSTRAINT [secQuiIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secQuiIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuinzenasIniciais') AND name='secQuiIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosQuinzenasIniciais].[secQuiIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniIxAk] >>>'
  CREATE UNIQUE INDEX [secQuiIniIxAk]
    ON [cal].[seculosQuinzenasIniciais]
    (
      [quiId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuinzenasIniciais') AND name='secQuiIniIxFkQui')
  BEGIN
    DROP INDEX [cal].[seculosQuinzenasIniciais].[secQuiIniIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secQuiIniIxFkQui]
    ON [cal].[seculosQuinzenasIniciais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniFkQui] >>>'
  ALTER TABLE [cal].[seculosQuinzenasIniciais]
    ADD CONSTRAINT [secQuiIniFkQui]
    FOREIGN KEY
    (
      [quiId]
    )
    REFERENCES [DataCorp].[cal].[quinzenas]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuinzenasIniciais') AND name='secQuiIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosQuinzenasIniciais].[secQuiIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secQuiIniIxFkSec]
    ON [cal].[seculosQuinzenasIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasIniciais].[secQuiIniFkSec] >>>'
  ALTER TABLE [cal].[seculosQuinzenasIniciais]
    ADD CONSTRAINT [secQuiIniFkSec]
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

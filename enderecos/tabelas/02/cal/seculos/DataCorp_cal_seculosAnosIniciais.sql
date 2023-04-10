/*
* TABELA: [DataCorp].[cal].[seculosAnosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniFkAno] >>>'
  IF OBJECT_ID('[cal].[secAnoIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[seculosAnosIniciais]
      DROP CONSTRAINT [secAnoIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secAnoIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosAnosIniciais]
      DROP CONSTRAINT [secAnoIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosAnosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosAnosIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosAnosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosAnosIniciais]
  (

    [secAnoIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosAnosIniciaissecAnoIniIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [seculosAnosIniciaisanoIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosAnosIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniPk] >>>'
  ALTER TABLE [cal].[seculosAnosIniciais]
    ADD CONSTRAINT [secAnoIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secAnoIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosAnosIniciais') AND name='secAnoIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosAnosIniciais].[secAnoIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniIxAk] >>>'
  CREATE UNIQUE INDEX [secAnoIniIxAk]
    ON [cal].[seculosAnosIniciais]
    (
      [anoId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosAnosIniciais') AND name='secAnoIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[seculosAnosIniciais].[secAnoIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secAnoIniIxFkAno]
    ON [cal].[seculosAnosIniciais]
    (
      [anoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniFkAno] >>>'
  ALTER TABLE [cal].[seculosAnosIniciais]
    ADD CONSTRAINT [secAnoIniFkAno]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosAnosIniciais') AND name='secAnoIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosAnosIniciais].[secAnoIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secAnoIniIxFkSec]
    ON [cal].[seculosAnosIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosAnosIniciais].[secAnoIniFkSec] >>>'
  ALTER TABLE [cal].[seculosAnosIniciais]
    ADD CONSTRAINT [secAnoIniFkSec]
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

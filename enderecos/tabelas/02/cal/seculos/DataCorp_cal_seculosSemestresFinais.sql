/*
* TABELA: [DataCorp].[cal].[seculosSemestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemestresFinais].[secSemFinFkSem] >>>'
  IF OBJECT_ID('[cal].[secSemFinFkSem]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemestresFinais]
      DROP CONSTRAINT [secSemFinFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemestresFinais].[secSemFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secSemFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemestresFinais]
      DROP CONSTRAINT [secSemFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosSemestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosSemestresFinais' )
  BEGIN
    DROP TABLE [cal].[seculosSemestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosSemestresFinais]
  (

    [secSemFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosSemestresFinaissecSemFinIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [seculosSemestresFinaissmtIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosSemestresFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosSemestresFinais].[secSemFinPk] >>>'
  ALTER TABLE [cal].[seculosSemestresFinais]
    ADD CONSTRAINT [secSemFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secSemFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemestresFinais].[secSemFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemestresFinais') AND name='secSemFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosSemestresFinais].[secSemFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemestresFinais].[secSemFinIxAk] >>>'
  CREATE UNIQUE INDEX [secSemFinIxAk]
    ON [cal].[seculosSemestresFinais]
    (
      [smtId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemestresFinais].[secSemFinIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemestresFinais') AND name='secSemFinIxFkSem')
  BEGIN
    DROP INDEX [cal].[seculosSemestresFinais].[secSemFinIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secSemFinIxFkSem]
    ON [cal].[seculosSemestresFinais]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemestresFinais].[secSemFinFkSem] >>>'
  ALTER TABLE [cal].[seculosSemestresFinais]
    ADD CONSTRAINT [secSemFinFkSem]
    FOREIGN KEY
    (
      [smtId]
    )
    REFERENCES [DataCorp].[cal].[semestres]
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemestresFinais].[secSemFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemestresFinais') AND name='secSemFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosSemestresFinais].[secSemFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secSemFinIxFkSec]
    ON [cal].[seculosSemestresFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemestresFinais].[secSemFinFkSec] >>>'
  ALTER TABLE [cal].[seculosSemestresFinais]
    ADD CONSTRAINT [secSemFinFkSec]
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

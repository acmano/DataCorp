/*
* TABELA: [DataCorp].[cal].[anosSemestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemestresFinais].[anoSemFinFkSem] >>>'
  IF OBJECT_ID('[cal].[anoSemFinFkSem]') IS NOT NULL
    ALTER TABLE [cal].[anosSemestresFinais]
      DROP CONSTRAINT [anoSemFinFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemestresFinais].[anoSemFinFkAno] >>>'
  IF OBJECT_ID('[cal].[anoSemFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosSemestresFinais]
      DROP CONSTRAINT [anoSemFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosSemestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosSemestresFinais' )
  BEGIN
    DROP TABLE [cal].[anosSemestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosSemestresFinais]
  (

    [anoSemFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosSemestresFinaisanoSemFinIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [anosSemestresFinaissmtIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosSemestresFinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosSemestresFinais].[anoSemFinPk] >>>'
  ALTER TABLE [cal].[anosSemestresFinais]
    ADD CONSTRAINT [anoSemFinPk]
      PRIMARY KEY CLUSTERED
      (
        [anoSemFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemestresFinais].[anoSemFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemestresFinais') AND name='anoSemFinIxAk')
  BEGIN
    DROP INDEX [cal].[anosSemestresFinais].[anoSemFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemestresFinais].[anoSemFinIxAk] >>>'
  CREATE UNIQUE INDEX [anoSemFinIxAk]
    ON [cal].[anosSemestresFinais]
    (
      [smtId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemestresFinais].[anoSemFinIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemestresFinais') AND name='anoSemFinIxFkSem')
  BEGIN
    DROP INDEX [cal].[anosSemestresFinais].[anoSemFinIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoSemFinIxFkSem]
    ON [cal].[anosSemestresFinais]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemestresFinais].[anoSemFinFkSem] >>>'
  ALTER TABLE [cal].[anosSemestresFinais]
    ADD CONSTRAINT [anoSemFinFkSem]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemestresFinais].[anoSemFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemestresFinais') AND name='anoSemFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosSemestresFinais].[anoSemFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoSemFinIxFkAno]
    ON [cal].[anosSemestresFinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemestresFinais].[anoSemFinFkAno] >>>'
  ALTER TABLE [cal].[anosSemestresFinais]
    ADD CONSTRAINT [anoSemFinFkAno]
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

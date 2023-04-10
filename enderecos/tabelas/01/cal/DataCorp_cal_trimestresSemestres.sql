/*
* TABELA: [DataCorp].[cal].[trimestresSemestres]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresSemestres].[triSmtFkSem] >>>'
  IF OBJECT_ID('[cal].[triSmtFkSem]') IS NOT NULL
    ALTER TABLE [cal].[trimestresSemestres]
      DROP CONSTRAINT [triSmtFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresSemestres].[triSmtFkTri] >>>'
  IF OBJECT_ID('[cal].[triSmtFkTri]') IS NOT NULL
    ALTER TABLE [cal].[trimestresSemestres]
      DROP CONSTRAINT [triSmtFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[trimestresSemestres] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'trimestresSemestres' )
  BEGIN
    DROP TABLE [cal].[trimestresSemestres]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[trimestresSemestres]
  (

    [triSmtId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [trimestresSemestrestriSmtIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [trimestresSemestressmtIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [trimestresSemestrestriIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[trimestresSemestres].[triSmtPk] >>>'
  ALTER TABLE [cal].[trimestresSemestres]
    ADD CONSTRAINT [triSmtPk]
      PRIMARY KEY CLUSTERED
      (
        [triSmtId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresSemestres].[triSmtIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresSemestres') AND name='triSmtIxAk')
  BEGIN
    DROP INDEX [cal].[trimestresSemestres].[triSmtIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresSemestres].[triSmtIxAk] >>>'
  CREATE UNIQUE INDEX [triSmtIxAk]
    ON [cal].[trimestresSemestres]
    (
      [smtId]
    , [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresSemestres].[triSmtIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresSemestres') AND name='triSmtIxFkSem')
  BEGIN
    DROP INDEX [cal].[trimestresSemestres].[triSmtIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [triSmtIxFkSem]
    ON [cal].[trimestresSemestres]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresSemestres].[triSmtFkSem] >>>'
  ALTER TABLE [cal].[trimestresSemestres]
    ADD CONSTRAINT [triSmtFkSem]
    FOREIGN KEY
    (
      [smtId]
    )
    REFERENCES [DataCorp].[cal].semestres
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresSemestres].[triSmtIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresSemestres') AND name='triSmtIxFkTri')
  BEGIN
    DROP INDEX [cal].[trimestresSemestres].[triSmtIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [triSmtIxFkTri]
    ON [cal].[trimestresSemestres]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresSemestres].[triSmtFkTri] >>>'
  ALTER TABLE [cal].[trimestresSemestres]
    ADD CONSTRAINT [triSmtFkTri]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

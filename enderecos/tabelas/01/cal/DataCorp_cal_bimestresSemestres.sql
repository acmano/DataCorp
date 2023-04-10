/*
* TABELA: [DataCorp].[cal].[bimestresSemestres]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresSemestres].[bimSemFkSem] >>>'
  IF OBJECT_ID('[cal].[bimSemFkSem]') IS NOT NULL
    ALTER TABLE [cal].[bimestresSemestres]
      DROP CONSTRAINT [bimSemFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresSemestres].[bimSemFkBim] >>>'
  IF OBJECT_ID('[cal].[bimSemFkBim]') IS NOT NULL
    ALTER TABLE [cal].[bimestresSemestres]
      DROP CONSTRAINT [bimSemFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[bimestresSemestres] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'bimestresSemestres' )
  BEGIN
    DROP TABLE [cal].[bimestresSemestres]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[bimestresSemestres]
  (

    [bimSemId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [bimestresSemestresbimSemIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [bimestresSemestressmtIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [bimestresSemestresbimIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[bimestresSemestres].[bimSemPk] >>>'
  ALTER TABLE [cal].[bimestresSemestres]
    ADD CONSTRAINT [bimSemPk]
      PRIMARY KEY CLUSTERED
      (
        [bimSemId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresSemestres].[bimSemIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresSemestres') AND name='bimSemIxAk')
  BEGIN
    DROP INDEX [cal].[bimestresSemestres].[bimSemIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresSemestres].[bimSemIxAk] >>>'
  CREATE UNIQUE INDEX [bimSemIxAk]
    ON [cal].[bimestresSemestres]
    (
      [smtId]
    , [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresSemestres].[bimSemIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresSemestres') AND name='bimSemIxFkSem')
  BEGIN
    DROP INDEX [cal].[bimestresSemestres].[bimSemIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [bimSemIxFkSem]
    ON [cal].[bimestresSemestres]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresSemestres].[bimSemFkSem] >>>'
  ALTER TABLE [cal].[bimestresSemestres]
    ADD CONSTRAINT [bimSemFkSem]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresSemestres].[bimSemIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresSemestres') AND name='bimSemIxFkBim')
  BEGIN
    DROP INDEX [cal].[bimestresSemestres].[bimSemIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [bimSemIxFkBim]
    ON [cal].[bimestresSemestres]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresSemestres].[bimSemFkBim] >>>'
  ALTER TABLE [cal].[bimestresSemestres]
    ADD CONSTRAINT [bimSemFkBim]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

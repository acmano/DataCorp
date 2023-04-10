/*
* TABELA: [DataCorp].[cal].[quinzenasMeses]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasMeses].[quiMesFkMes] >>>'
  IF OBJECT_ID('[cal].[quiMesFkMes]') IS NOT NULL
    ALTER TABLE [cal].[quinzenasMeses]
      DROP CONSTRAINT [quiMesFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasMeses].[quiMesFkQui] >>>'
  IF OBJECT_ID('[cal].[quiMesFkQui]') IS NOT NULL
    ALTER TABLE [cal].[quinzenasMeses]
      DROP CONSTRAINT [quiMesFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[quinzenasMeses] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'quinzenasMeses' )
  BEGIN
    DROP TABLE [cal].[quinzenasMeses]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[quinzenasMeses]
  (

    [quiMesId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [quinzenasMesesquiMesIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [quinzenasMesesmesIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [quinzenasMesesquiIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[quinzenasMeses].[quiMesPk] >>>'
  ALTER TABLE [cal].[quinzenasMeses]
    ADD CONSTRAINT [quiMesPk]
      PRIMARY KEY CLUSTERED
      (
        [quiMesId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasMeses].[quiMesIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasMeses') AND name='quiMesIxAk')
  BEGIN
    DROP INDEX [cal].[quinzenasMeses].[quiMesIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasMeses].[quiMesIxAk] >>>'
  CREATE UNIQUE INDEX [quiMesIxAk]
    ON [cal].[quinzenasMeses]
    (
      [mesId]
    , [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasMeses].[quiMesIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasMeses') AND name='quiMesIxFkMes')
  BEGIN
    DROP INDEX [cal].[quinzenasMeses].[quiMesIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [quiMesIxFkMes]
    ON [cal].[quinzenasMeses]
    (
      [mesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasMeses].[quiMesFkMes] >>>'
  ALTER TABLE [cal].[quinzenasMeses]
    ADD CONSTRAINT [quiMesFkMes]
    FOREIGN KEY
    (
      [mesId]
    )
    REFERENCES [DataCorp].[cal].[meses]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quinzenasMeses].[quiMesIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quinzenasMeses') AND name='quiMesIxFkQui')
  BEGIN
    DROP INDEX [cal].[quinzenasMeses].[quiMesIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [quiMesIxFkQui]
    ON [cal].[quinzenasMeses]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quinzenasMeses].[quiMesFkQui] >>>'
  ALTER TABLE [cal].[quinzenasMeses]
    ADD CONSTRAINT [quiMesFkQui]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

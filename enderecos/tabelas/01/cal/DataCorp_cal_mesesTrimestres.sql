/*
* TABELA: [DataCorp].[cal].[mesesTrimestres]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesTrimestres].[mesTriFkTri] >>>'
  IF OBJECT_ID('[cal].[mesTriFkTri]') IS NOT NULL
    ALTER TABLE [cal].[mesesTrimestres]
      DROP CONSTRAINT [mesTriFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesTrimestres].[mesTriFkMes] >>>'
  IF OBJECT_ID('[cal].[mesTriFkMes]') IS NOT NULL
    ALTER TABLE [cal].[mesesTrimestres]
      DROP CONSTRAINT [mesTriFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mesesTrimestres] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mesesTrimestres' )
  BEGIN
    DROP TABLE [cal].[mesesTrimestres]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mesesTrimestres]
  (

    [mesTriId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mesesTrimestresmesTriIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [mesesTrimestrestriIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [mesesTrimestresmesIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mesesTrimestres].[mesTriPk] >>>'
  ALTER TABLE [cal].[mesesTrimestres]
    ADD CONSTRAINT [mesTriPk]
      PRIMARY KEY CLUSTERED
      (
        [mesTriId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesTrimestres].[mesTriIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesTrimestres') AND name='mesTriIxAk')
  BEGIN
    DROP INDEX [cal].[mesesTrimestres].[mesTriIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesTrimestres].[mesTriIxAk] >>>'
  CREATE UNIQUE INDEX [mesTriIxAk]
    ON [cal].[mesesTrimestres]
    (
      [triId]
    , [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesTrimestres].[mesTriIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesTrimestres') AND name='mesTriIxFkTri')
  BEGIN
    DROP INDEX [cal].[mesesTrimestres].[mesTriIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [mesTriIxFkTri]
    ON [cal].[mesesTrimestres]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesTrimestres].[mesTriFkTri] >>>'
  ALTER TABLE [cal].[mesesTrimestres]
    ADD CONSTRAINT [mesTriFkTri]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesTrimestres].[mesTriIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesTrimestres') AND name='mesTriIxFkMes')
  BEGIN
    DROP INDEX [cal].[mesesTrimestres].[mesTriIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [mesTriIxFkMes]
    ON [cal].[mesesTrimestres]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesTrimestres].[mesTriFkMes] >>>'
  ALTER TABLE [cal].[mesesTrimestres]
    ADD CONSTRAINT [mesTriFkMes]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

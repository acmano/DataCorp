/*
* TABELA: [DataCorp].[cal].[mesesBimestres]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesBimestres].[mesBimFkBim] >>>'
  IF OBJECT_ID('[cal].[mesBimFkBim]') IS NOT NULL
    ALTER TABLE [cal].[mesesBimestres]
      DROP CONSTRAINT [mesBimFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesBimestres].[mesBimFkMes] >>>'
  IF OBJECT_ID('[cal].[mesBimFkMes]') IS NOT NULL
    ALTER TABLE [cal].[mesesBimestres]
      DROP CONSTRAINT [mesBimFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mesesBimestres] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mesesBimestres' )
  BEGIN
    DROP TABLE [cal].[mesesBimestres]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mesesBimestres]
  (

    [mesBimId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mesesBimestresmesBimIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [mesesBimestresbimIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [mesesBimestresmesIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mesesBimestres].[mesBimPk] >>>'
  ALTER TABLE [cal].[mesesBimestres]
    ADD CONSTRAINT [mesBimPk]
      PRIMARY KEY CLUSTERED
      (
        [mesBimId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesBimestres].[mesBimIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesBimestres') AND name='mesBimIxAk')
  BEGIN
    DROP INDEX [cal].[mesesBimestres].[mesBimIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesBimestres].[mesBimIxAk] >>>'
  CREATE UNIQUE INDEX [mesBimIxAk]
    ON [cal].[mesesBimestres]
    (
      [bimId]
    , [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesBimestres].[mesBimIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesBimestres') AND name='mesBimIxFkBim')
  BEGIN
    DROP INDEX [cal].[mesesBimestres].[mesBimIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [mesBimIxFkBim]
    ON [cal].[mesesBimestres]
    (
      [bimId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesBimestres].[mesBimFkBim] >>>'
  ALTER TABLE [cal].[mesesBimestres]
    ADD CONSTRAINT [mesBimFkBim]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesBimestres].[mesBimIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesBimestres') AND name='mesBimIxFkMes')
  BEGIN
    DROP INDEX [cal].[mesesBimestres].[mesBimIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [mesBimIxFkMes]
    ON [cal].[mesesBimestres]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesBimestres].[mesBimFkMes] >>>'
  ALTER TABLE [cal].[mesesBimestres]
    ADD CONSTRAINT [mesBimFkMes]
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

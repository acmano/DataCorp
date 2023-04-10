/*
* TABELA: [DataCorp].[geo].[nacoesContinentes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacConFkCon] >>>'
  IF OBJECT_ID('[geo].[nacConFkCon]') IS NOT NULL
    ALTER TABLE [geo].[nacoesContinentes]
      DROP CONSTRAINT [nacConFkCon]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacConFkNac] >>>'
  IF OBJECT_ID('[geo].[nacConFkNac]') IS NOT NULL
    ALTER TABLE [geo].[nacoesContinentes]
      DROP CONSTRAINT [nacConFkNac]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesContinentes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesContinentes' )
  BEGIN
    DROP TABLE [geo].[nacoesContinentes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesContinentes]
  (

    [nacConId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesContinentesnacConIdNn] NOT NULL

  , [conId]
      BIGINT
      CONSTRAINT [nacoesContinentesconIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesContinentesnacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesContinentes].[nacConPk] >>>'
  ALTER TABLE [geo].[nacoesContinentes]
    ADD CONSTRAINT [nacConPk]
      PRIMARY KEY CLUSTERED
      (
        [nacConId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacConIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacConIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacConIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacConIxAk] >>>'
  CREATE UNIQUE INDEX [nacConIxAk]
    ON [geo].[nacoesContinentes]
    (
      [conId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacConIxFkCon] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacConIxFkCon')
  BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacConIxFkCon]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [nacConIxFkCon]
    ON [geo].[nacoesContinentes]
    (
      [conId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacConFkCon] >>>'
  ALTER TABLE [geo].[nacoesContinentes]
    ADD CONSTRAINT [nacConFkCon]
    FOREIGN KEY
    (
      [conId]
    )
    REFERENCES [DataCorp].[geo].[continentes]
    (
      [conId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacConIxFkNac] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacConIxFkNac')
  BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacConIxFkNac]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacConIxFkNac]
    ON [geo].[nacoesContinentes]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacConFkNac] >>>'
  ALTER TABLE [geo].[nacoesContinentes]
    ADD CONSTRAINT [nacConFkNac]
    FOREIGN KEY
    (
      [nacId]
    )
    REFERENCES [DataCorp].[geo].[nacoes]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

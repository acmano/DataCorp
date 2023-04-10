/*
* TABELA: [DataCorp].[geo].[regioesContinentes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regConFkCon] >>>'
  IF OBJECT_ID('[geo].[regConFkCon]') IS NOT NULL
    ALTER TABLE [geo].[regioesContinentes]
      DROP CONSTRAINT [regConFkCon]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regConFkReg] >>>'
  IF OBJECT_ID('[geo].[regConFkReg]') IS NOT NULL
    ALTER TABLE [geo].[regioesContinentes]
      DROP CONSTRAINT [regConFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[regioesContinentes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'regioesContinentes' )
  BEGIN
    DROP TABLE [geo].[regioesContinentes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[regioesContinentes]
  (

    [regConId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [regioesContinentesregConIdNn] NOT NULL

  , [conId]
      BIGINT
      CONSTRAINT [regioesContinentesconIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [regioesContinentesregIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[regioesContinentes].[regConPk] >>>'
  ALTER TABLE [geo].[regioesContinentes]
    ADD CONSTRAINT [regConPk]
      PRIMARY KEY CLUSTERED
      (
        [regConId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regConIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regConIxAk')
  BEGIN
    DROP INDEX [geo].[regioesContinentes].[regConIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regConIxAk] >>>'
  CREATE UNIQUE INDEX [regConIxAk]
    ON [geo].[regioesContinentes]
    (
      [conId]
    , [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regConIxFkCon] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regConIxFkCon')
  BEGIN
    DROP INDEX [geo].[regioesContinentes].[regConIxFkCon]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [regConIxFkCon]
    ON [geo].[regioesContinentes]
    (
      [conId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regConFkCon] >>>'
  ALTER TABLE [geo].[regioesContinentes]
    ADD CONSTRAINT [regConFkCon]
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
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioesContinentes].[regConIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regConIxFkReg')
  BEGIN
    DROP INDEX [geo].[regioesContinentes].[regConIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [regConIxFkReg]
    ON [geo].[regioesContinentes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioesContinentes].[regConFkReg] >>>'
  ALTER TABLE [geo].[regioesContinentes]
    ADD CONSTRAINT [regConFkReg]
    FOREIGN KEY
    (
      [regId]
    )
    REFERENCES [DataCorp].[geo].[regioes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

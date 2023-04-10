/*
* TABELA: [DataCorp].[geo].[subRegioesRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFkReg] >>>'
  IF OBJECT_ID('[geo].[subRegRegFkReg]') IS NOT NULL
    ALTER TABLE [geo].[subRegioesRegioes]
      DROP CONSTRAINT [subRegRegFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFkSubReg] >>>'
  IF OBJECT_ID('[geo].[subRegRegFkSubReg]') IS NOT NULL
    ALTER TABLE [geo].[subRegioesRegioes]
      DROP CONSTRAINT [subRegRegFkSubReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[subRegioesRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'subRegioesRegioes' )
  BEGIN
    DROP TABLE [geo].[subRegioesRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[subRegioesRegioes]
  (

    [subRegRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [subRegioesRegioessubRegRegIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [subRegioesRegioesregIdNn] NOT NULL

  , [subRegId]
      BIGINT
      CONSTRAINT [subRegioesRegioessubRegIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegPk] >>>'
  ALTER TABLE [geo].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegPk]
      PRIMARY KEY CLUSTERED
      (
        [subRegRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioesRegioes') AND name='subRegRegIxAk')
  BEGIN
    DROP INDEX [geo].[subRegioesRegioes].[subRegRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxAk] >>>'
  CREATE UNIQUE INDEX [subRegRegIxAk]
    ON [geo].[subRegioesRegioes]
    (
      [regId]
    , [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioesRegioes') AND name='subRegRegIxFkReg')
  BEGIN
    DROP INDEX [geo].[subRegioesRegioes].[subRegRegIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [subRegRegIxFkReg]
    ON [geo].[subRegioesRegioes]
    (
      [regId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFkReg] >>>'
  ALTER TABLE [geo].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegFkReg]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxFkSubReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioesRegioes') AND name='subRegRegIxFkSubReg')
  BEGIN
    DROP INDEX [geo].[subRegioesRegioes].[subRegRegIxFkSubReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [subRegRegIxFkSubReg]
    ON [geo].[subRegioesRegioes]
    (
      [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFkSubReg] >>>'
  ALTER TABLE [geo].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegFkSubReg]
    FOREIGN KEY
    (
      [subRegId]
    )
    REFERENCES [DataCorp].[geo].[subRegioes]
    (
      [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

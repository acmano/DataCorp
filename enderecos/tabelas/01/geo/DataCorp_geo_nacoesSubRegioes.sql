/*
* TABELA: [DataCorp].[geo].[nacoesSubRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFkSubReg] >>>'
  IF OBJECT_ID('[geo].[nacSubRegFkSubReg]') IS NOT NULL
    ALTER TABLE [geo].[nacoesSubRegioes]
      DROP CONSTRAINT [nacSubRegFkSubReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFkNac] >>>'
  IF OBJECT_ID('[geo].[nacSubRegFkNac]') IS NOT NULL
    ALTER TABLE [geo].[nacoesSubRegioes]
      DROP CONSTRAINT [nacSubRegFkNac]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesSubRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesSubRegioes' )
  BEGIN
    DROP TABLE [geo].[nacoesSubRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesSubRegioes]
  (

    [nacSubRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesSubRegioesnacSubRegIdNn] NOT NULL

  , [subRegId]
      BIGINT
      CONSTRAINT [nacoesSubRegioessubRegIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesSubRegioesnacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegPk] >>>'
  ALTER TABLE [geo].[nacoesSubRegioes]
    ADD CONSTRAINT [nacSubRegPk]
      PRIMARY KEY CLUSTERED
      (
        [nacSubRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxAk] >>>'
  CREATE UNIQUE INDEX [nacSubRegIxAk]
    ON [geo].[nacoesSubRegioes]
    (
      [subRegId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxFkSubReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxFkSubReg')
  BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxFkSubReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [nacSubRegIxFkSubReg]
    ON [geo].[nacoesSubRegioes]
    (
      [subRegId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFkSubReg] >>>'
  ALTER TABLE [geo].[nacoesSubRegioes]
    ADD CONSTRAINT [nacSubRegFkSubReg]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxFkNac] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxFkNac')
  BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxFkNac]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacSubRegIxFkNac]
    ON [geo].[nacoesSubRegioes]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFkNac] >>>'
  ALTER TABLE [geo].[nacoesSubRegioes]
    ADD CONSTRAINT [nacSubRegFkNac]
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

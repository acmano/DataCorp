/*
* TABELA: [DataCorp].[geo].[nacoesPaises]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFkPai] >>>'
  IF OBJECT_ID('[geo].[nacPaiFkPai]') IS NOT NULL
    ALTER TABLE [geo].[nacoesPaises]
      DROP CONSTRAINT [nacPaiFkPai]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFkNac] >>>'
  IF OBJECT_ID('[geo].[nacPaiFkNac]') IS NOT NULL
    ALTER TABLE [geo].[nacoesPaises]
      DROP CONSTRAINT [nacPaiFkNac]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesPaises] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesPaises' )
  BEGIN
    DROP TABLE [geo].[nacoesPaises]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesPaises]
  (

    [nacPaiId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesPaisesnacPaiIdNn] NOT NULL

  , [paiId]
      BIGINT
      CONSTRAINT [nacoesPaisespaiIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesPaisesnacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesPaises].[nacPaiPk] >>>'
  ALTER TABLE [geo].[nacoesPaises]
    ADD CONSTRAINT [nacPaiPk]
      PRIMARY KEY CLUSTERED
      (
        [nacPaiId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxAk] >>>'
  CREATE UNIQUE INDEX [nacPaiIxAk]
    ON [geo].[nacoesPaises]
    (
      [paiId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxFkPai] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxFkPai')
  BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxFkPai]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [nacPaiIxFkPai]
    ON [geo].[nacoesPaises]
    (
      [paiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFkPai] >>>'
  ALTER TABLE [geo].[nacoesPaises]
    ADD CONSTRAINT [nacPaiFkPai]
    FOREIGN KEY
    (
      [paiId]
    )
    REFERENCES [DataCorp].[geo].[paises]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxFkNac] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxFkNac')
  BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxFkNac]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacPaiIxFkNac]
    ON [geo].[nacoesPaises]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFkNac] >>>'
  ALTER TABLE [geo].[nacoesPaises]
    ADD CONSTRAINT [nacPaiFkNac]
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

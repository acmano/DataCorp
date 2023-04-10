/*
* TABELA: [DataCorp].[geo].[continentesMundos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[conMunFkMun] >>>'
  IF OBJECT_ID('[geo].[conMunFkMun]') IS NOT NULL
    ALTER TABLE [geo].[continentesMundos]
      DROP CONSTRAINT [conMunFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[conMunFkCon] >>>'
  IF OBJECT_ID('[geo].[conMunFkCon]') IS NOT NULL
    ALTER TABLE [geo].[continentesMundos]
      DROP CONSTRAINT [conMunFkCon]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[continentesMundos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'continentesMundos' )
  BEGIN
    DROP TABLE [geo].[continentesMundos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[continentesMundos]
  (

    [conMunId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [continentesMundosconMunIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [continentesMundosmunIdNn] NOT NULL

  , [conId]
      BIGINT
      CONSTRAINT [continentesMundosconIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[continentesMundos].[conMunPk] >>>'
  ALTER TABLE [geo].[continentesMundos]
    ADD CONSTRAINT [conMunPk]
      PRIMARY KEY CLUSTERED
      (
        [conMunId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[conMunIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='conMunIxAk')
  BEGIN
    DROP INDEX [geo].[continentesMundos].[conMunIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[conMunIxAk] >>>'
  CREATE UNIQUE INDEX [conMunIxAk]
    ON [geo].[continentesMundos]
    (
      [munId]
    , [conId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[conMunIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='conMunIxFkMun')
  BEGIN
    DROP INDEX [geo].[continentesMundos].[conMunIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [conMunIxFkMun]
    ON [geo].[continentesMundos]
    (
      [munId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[conMunFkMun] >>>'
  ALTER TABLE [geo].[continentesMundos]
    ADD CONSTRAINT [conMunFkMun]
    FOREIGN KEY
    (
      [munId]
    )
    REFERENCES [DataCorp].[geo].[mundos]
    (
      [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[conMunIxFkCon] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='conMunIxFkCon')
  BEGIN
    DROP INDEX [geo].[continentesMundos].[conMunIxFkCon]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [conMunIxFkCon]
    ON [geo].[continentesMundos]
    (
      [conId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[conMunFkCon] >>>'
  ALTER TABLE [geo].[continentesMundos]
    ADD CONSTRAINT [conMunFkCon]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

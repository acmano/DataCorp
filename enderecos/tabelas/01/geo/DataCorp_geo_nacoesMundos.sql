/*
* TABELA: [DataCorp].[geo].[nacoesMundos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFkMun] >>>'
  IF OBJECT_ID('[geo].[nacMunFkMun]') IS NOT NULL
    ALTER TABLE [geo].[nacoesMundos]
      DROP CONSTRAINT [nacMunFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFkNac] >>>'
  IF OBJECT_ID('[geo].[nacMunFkNac]') IS NOT NULL
    ALTER TABLE [geo].[nacoesMundos]
      DROP CONSTRAINT [nacMunFkNac]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesMundos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesMundos' )
  BEGIN
    DROP TABLE [geo].[nacoesMundos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesMundos]
  (

    [nacMunId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesMundosnacMunIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [nacoesMundosmunIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesMundosnacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesMundos].[nacMunPk] >>>'
  ALTER TABLE [geo].[nacoesMundos]
    ADD CONSTRAINT [nacMunPk]
      PRIMARY KEY CLUSTERED
      (
        [nacMunId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxAk] >>>'
  CREATE UNIQUE INDEX [nacMunIxAk]
    ON [geo].[nacoesMundos]
    (
      [munId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxFkMun')
  BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [nacMunIxFkMun]
    ON [geo].[nacoesMundos]
    (
      [munId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFkMun] >>>'
  ALTER TABLE [geo].[nacoesMundos]
    ADD CONSTRAINT [nacMunFkMun]
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
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxFkNac] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxFkNac')
  BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxFkNac]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacMunIxFkNac]
    ON [geo].[nacoesMundos]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFkNac] >>>'
  ALTER TABLE [geo].[nacoesMundos]
    ADD CONSTRAINT [nacMunFkNac]
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

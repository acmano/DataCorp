/*
* TABELA: [DataCorp].[cep].[subSetoresSetores]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subSetoresSetores].[subSetSetFkSet] >>>'
  IF OBJECT_ID('[cep].[subSetSetFkSet]') IS NOT NULL
    ALTER TABLE [cep].[subSetoresSetores]
      DROP CONSTRAINT [subSetSetFkSet]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subSetoresSetores].[subSetSetFkSubSet] >>>'
  IF OBJECT_ID('[cep].[subSetSetFkSubSet]') IS NOT NULL
    ALTER TABLE [cep].[subSetoresSetores]
      DROP CONSTRAINT [subSetSetFkSubSet]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[subSetoresSetores] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'subSetoresSetores' )
  BEGIN
    DROP TABLE [cep].[subSetoresSetores]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[subSetoresSetores]
  (

    [subSetSetId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [subSetoresSetoressubSetSetIdNn] NOT NULL

  , [setId]
      BIGINT
      CONSTRAINT [subSetoresSetoressetIdNn] NOT NULL

  , [subSetId]
      BIGINT
      CONSTRAINT [subSetoresSetoressubSetIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[subSetoresSetores].[subSetSetPk] >>>'
  ALTER TABLE [cep].[subSetoresSetores]
    ADD CONSTRAINT [subSetSetPk]
      PRIMARY KEY CLUSTERED
      (
        [subSetSetId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subSetoresSetores].[subSetSetIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetoresSetores') AND name='subSetSetIxAk')
  BEGIN
    DROP INDEX [cep].[subSetoresSetores].[subSetSetIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subSetoresSetores].[subSetSetIxAk] >>>'
  CREATE UNIQUE INDEX [subSetSetIxAk]
    ON [cep].[subSetoresSetores]
    (
      [setId]
    , [subSetId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subSetoresSetores].[subSetSetIxFkSet] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetoresSetores') AND name='subSetSetIxFkSet')
  BEGIN
    DROP INDEX [cep].[subSetoresSetores].[subSetSetIxFkSet]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [subSetSetIxFkSet]
    ON [cep].[subSetoresSetores]
    (
      [setId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subSetoresSetores].[subSetSetFkSet] >>>'
  ALTER TABLE [cep].[subSetoresSetores]
    ADD CONSTRAINT [subSetSetFkSet]
    FOREIGN KEY
    (
      [setId]
    )
    REFERENCES [DataCorp].[cep].[setores]
    (
      [setId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subSetoresSetores].[subSetSetIxFkSubSet] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetoresSetores') AND name='subSetSetIxFkSubSet')
  BEGIN
    DROP INDEX [cep].[subSetoresSetores].[subSetSetIxFkSubSet]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [subSetSetIxFkSubSet]
    ON [cep].[subSetoresSetores]
    (
      [subSetId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subSetoresSetores].[subSetSetFkSubSet] >>>'
  ALTER TABLE [cep].[subSetoresSetores]
    ADD CONSTRAINT [subSetSetFkSubSet]
    FOREIGN KEY
    (
      [subSetId]
    )
    REFERENCES [DataCorp].[cep].[subSetores]
    (
      [subSetId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

/*
* TABELA: [DataCorp].[cep].[divisoesSubSetores]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[divisoesSubSetores].[divSubSetFkSubSet] >>>'
  IF OBJECT_ID('[cep].[divSubSetFkSubSet]') IS NOT NULL
    ALTER TABLE [cep].[divisoesSubSetores]
      DROP CONSTRAINT [divSubSetFkSubSet]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[divisoesSubSetores].[divSubSetFkDiv] >>>'
  IF OBJECT_ID('[cep].[divSubSetFkDiv]') IS NOT NULL
    ALTER TABLE [cep].[divisoesSubSetores]
      DROP CONSTRAINT [divSubSetFkDiv]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[divisoesSubSetores] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'divisoesSubSetores' )
  BEGIN
    DROP TABLE [cep].[divisoesSubSetores]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[divisoesSubSetores]
  (

    [divSubSetId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [divisoesSubSetoresdivSubSetIdNn] NOT NULL

  , [subSetId]
      BIGINT
      CONSTRAINT [divisoesSubSetoressubSetIdNn] NOT NULL

  , [divId]
      BIGINT
      CONSTRAINT [divisoesSubSetoresdivIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[divisoesSubSetores].[divSubSetPk] >>>'
  ALTER TABLE [cep].[divisoesSubSetores]
    ADD CONSTRAINT [divSubSetPk]
      PRIMARY KEY CLUSTERED
      (
        [divSubSetId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[divisoesSubSetores].[divSubSetIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.divisoesSubSetores') AND name='divSubSetIxAk')
  BEGIN
    DROP INDEX [cep].[divisoesSubSetores].[divSubSetIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[divisoesSubSetores].[divSubSetIxAk] >>>'
  CREATE UNIQUE INDEX [divSubSetIxAk]
    ON [cep].[divisoesSubSetores]
    (
      [subSetId]
    , [divId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[divisoesSubSetores].[divSubSetIxFkSubSet] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.divisoesSubSetores') AND name='divSubSetIxFkSubSet')
  BEGIN
    DROP INDEX [cep].[divisoesSubSetores].[divSubSetIxFkSubSet]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [divSubSetIxFkSubSet]
    ON [cep].[divisoesSubSetores]
    (
      [subSetId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[divisoesSubSetores].[divSubSetFkSubSet] >>>'
  ALTER TABLE [cep].[divisoesSubSetores]
    ADD CONSTRAINT [divSubSetFkSubSet]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[divisoesSubSetores].[divSubSetIxFkDiv] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.divisoesSubSetores') AND name='divSubSetIxFkDiv')
  BEGIN
    DROP INDEX [cep].[divisoesSubSetores].[divSubSetIxFkDiv]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [divSubSetIxFkDiv]
    ON [cep].[divisoesSubSetores]
    (
      [divId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[divisoesSubSetores].[divSubSetFkDiv] >>>'
  ALTER TABLE [cep].[divisoesSubSetores]
    ADD CONSTRAINT [divSubSetFkDiv]
    FOREIGN KEY
    (
      [divId]
    )
    REFERENCES [DataCorp].[cep].[divisoes]
    (
      [divId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

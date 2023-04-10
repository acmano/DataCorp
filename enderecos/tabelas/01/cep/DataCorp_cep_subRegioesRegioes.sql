/*
* TABELA: [DataCorp].[cep].[subRegioesRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subRegioesRegioes].[subRegRegFkReg] >>>'
  IF OBJECT_ID('[cep].[subRegRegFkReg]') IS NOT NULL
    ALTER TABLE [cep].[subRegioesRegioes]
      DROP CONSTRAINT [subRegRegFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subRegioesRegioes].[subRegRegFkSubReg] >>>'
  IF OBJECT_ID('[cep].[subRegRegFkSubReg]') IS NOT NULL
    ALTER TABLE [cep].[subRegioesRegioes]
      DROP CONSTRAINT [subRegRegFkSubReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[subRegioesRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'subRegioesRegioes' )
  BEGIN
    DROP TABLE [cep].[subRegioesRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[subRegioesRegioes]
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
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[subRegioesRegioes].[subRegRegPk] >>>'
  ALTER TABLE [cep].[subRegioesRegioes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subRegioesRegioes].[subRegRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subRegioesRegioes') AND name='subRegRegIxAk')
  BEGIN
    DROP INDEX [cep].[subRegioesRegioes].[subRegRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subRegioesRegioes].[subRegRegIxAk] >>>'
  CREATE UNIQUE INDEX [subRegRegIxAk]
    ON [cep].[subRegioesRegioes]
    (
      [regId]
    , [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subRegioesRegioes].[subRegRegIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subRegioesRegioes') AND name='subRegRegIxFkReg')
  BEGIN
    DROP INDEX [cep].[subRegioesRegioes].[subRegRegIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [subRegRegIxFkReg]
    ON [cep].[subRegioesRegioes]
    (
      [regId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subRegioesRegioes].[subRegRegFkReg] >>>'
  ALTER TABLE [cep].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegFkReg]
    FOREIGN KEY
    (
      [regId]
    )
    REFERENCES [DataCorp].[cep].[regioes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[subRegioesRegioes].[subRegRegIxFkSubReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subRegioesRegioes') AND name='subRegRegIxFkSubReg')
  BEGIN
    DROP INDEX [cep].[subRegioesRegioes].[subRegRegIxFkSubReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [subRegRegIxFkSubReg]
    ON [cep].[subRegioesRegioes]
    (
      [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[subRegioesRegioes].[subRegRegFkSubReg] >>>'
  ALTER TABLE [cep].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegFkSubReg]
    FOREIGN KEY
    (
      [subRegId]
    )
    REFERENCES [DataCorp].[cep].[subRegioes]
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

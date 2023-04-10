/*
* TABELA: [DataCorp].[cep].[setoresSubRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[setoresSubRegioes].[setSubRegFkSubReg] >>>'
  IF OBJECT_ID('[cep].[setSubRegFkSubReg]') IS NOT NULL
    ALTER TABLE [cep].[setoresSubRegioes]
      DROP CONSTRAINT [setSubRegFkSubReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[setoresSubRegioes].[setSubRegFkSet] >>>'
  IF OBJECT_ID('[cep].[setSubRegFkSet]') IS NOT NULL
    ALTER TABLE [cep].[setoresSubRegioes]
      DROP CONSTRAINT [setSubRegFkSet]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[setoresSubRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'setoresSubRegioes' )
  BEGIN
    DROP TABLE [cep].[setoresSubRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[setoresSubRegioes]
  (

    [setSubRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [setoresSubRegioessetSubRegIdNn] NOT NULL

  , [subRegId]
      BIGINT
      CONSTRAINT [setoresSubRegioessubRegIdNn] NOT NULL

  , [setId]
      BIGINT
      CONSTRAINT [setoresSubRegioessetIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[setoresSubRegioes].[setSubRegPk] >>>'
  ALTER TABLE [cep].[setoresSubRegioes]
    ADD CONSTRAINT [setSubRegPk]
      PRIMARY KEY CLUSTERED
      (
        [setSubRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[setoresSubRegioes].[setSubRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxAk')
  BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[setoresSubRegioes].[setSubRegIxAk] >>>'
  CREATE UNIQUE INDEX [setSubRegIxAk]
    ON [cep].[setoresSubRegioes]
    (
      [subRegId]
    , [setId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[setoresSubRegioes].[setSubRegIxFkSubReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxFkSubReg')
  BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegIxFkSubReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [setSubRegIxFkSubReg]
    ON [cep].[setoresSubRegioes]
    (
      [subRegId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[setoresSubRegioes].[setSubRegFkSubReg] >>>'
  ALTER TABLE [cep].[setoresSubRegioes]
    ADD CONSTRAINT [setSubRegFkSubReg]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[setoresSubRegioes].[setSubRegIxFkSet] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxFkSet')
  BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegIxFkSet]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [setSubRegIxFkSet]
    ON [cep].[setoresSubRegioes]
    (
      [setId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[setoresSubRegioes].[setSubRegFkSet] >>>'
  ALTER TABLE [cep].[setoresSubRegioes]
    ADD CONSTRAINT [setSubRegFkSet]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

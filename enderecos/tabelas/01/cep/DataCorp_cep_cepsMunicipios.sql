/*
* TABELA: [DataCorp].[cep].[cepsMunicipios]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsMunicipios].[cepMunFkMun] >>>'
  IF OBJECT_ID('[cep].[cepMunFkMun]') IS NOT NULL
    ALTER TABLE [cep].[cepsMunicipios]
      DROP CONSTRAINT [cepMunFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsMunicipios].[cepMunFkCep] >>>'
  IF OBJECT_ID('[cep].[cepMunFkCep]') IS NOT NULL
    ALTER TABLE [cep].[cepsMunicipios]
      DROP CONSTRAINT [cepMunFkCep]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[cepsMunicipios] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'cepsMunicipios' )
  BEGIN
    DROP TABLE [cep].[cepsMunicipios]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[cepsMunicipios]
  (

    [cepMunId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [cepsMunicipioscepMunIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [cepsMunicipiosmunIdNn] NOT NULL

  , [cepId]
      BIGINT
      CONSTRAINT [cepsMunicipioscepIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[cepsMunicipios].[cepMunPk] >>>'
  ALTER TABLE [cep].[cepsMunicipios]
    ADD CONSTRAINT [cepMunPk]
      PRIMARY KEY CLUSTERED
      (
        [cepMunId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsMunicipios].[cepMunIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepMunIxAk')
  BEGIN
    DROP INDEX [cep].[cepsMunicipios].[cepMunIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsMunicipios].[cepMunIxAk] >>>'
  CREATE UNIQUE INDEX [cepMunIxAk]
    ON [cep].[cepsMunicipios]
    (
      [munId]
    , [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsMunicipios].[cepMunIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepMunIxFkMun')
  BEGIN
    DROP INDEX [cep].[cepsMunicipios].[cepMunIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepMunIxFkMun]
    ON [cep].[cepsMunicipios]
    (
      [munId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsMunicipios].[cepMunFkMun] >>>'
  ALTER TABLE [cep].[cepsMunicipios]
    ADD CONSTRAINT [cepMunFkMun]
    FOREIGN KEY
    (
      [munId]
    )
    REFERENCES [DataCorp].[ibge].[municipios]
    (
      [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsMunicipios].[cepMunIxFkCep] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepMunIxFkCep')
  BEGIN
    DROP INDEX [cep].[cepsMunicipios].[cepMunIxFkCep]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [cepMunIxFkCep]
    ON [cep].[cepsMunicipios]
    (
      [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsMunicipios].[cepMunFkCep] >>>'
  ALTER TABLE [cep].[cepsMunicipios]
    ADD CONSTRAINT [cepMunFkCep]
    FOREIGN KEY
    (
      [cepId]
    )
    REFERENCES [DataCorp].[cep].[ceps]
    (
      [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

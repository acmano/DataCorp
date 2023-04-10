/*
* TABELA: [DataCorp].[ibge].[mesoRegioesUnidadesFederacao]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedFkUniFed] >>>'
  IF OBJECT_ID('[ibge].[mesRegUniFedFkUniFed]') IS NOT NULL
    ALTER TABLE [ibge].[mesoRegioesUnidadesFederacao]
      DROP CONSTRAINT [mesRegUniFedFkUniFed]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedFkMesReg] >>>'
  IF OBJECT_ID('[ibge].[mesRegUniFedFkMesReg]') IS NOT NULL
    ALTER TABLE [ibge].[mesoRegioesUnidadesFederacao]
      DROP CONSTRAINT [mesRegUniFedFkMesReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[mesoRegioesUnidadesFederacao] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'mesoRegioesUnidadesFederacao' )
  BEGIN
    DROP TABLE [ibge].[mesoRegioesUnidadesFederacao]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[mesoRegioesUnidadesFederacao]
  (

    [mesRegUniFedId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mesoRegioesUnidadesFederacaomesRegUniFedIdNn] NOT NULL

  , [uniFedId]
      BIGINT
      CONSTRAINT [mesoRegioesUnidadesFederacaouniFedIdNn] NOT NULL

  , [mesRegId]
      BIGINT
      CONSTRAINT [mesoRegioesUnidadesFederacaomesRegIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedPk] >>>'
  ALTER TABLE [ibge].[mesoRegioesUnidadesFederacao]
    ADD CONSTRAINT [mesRegUniFedPk]
      PRIMARY KEY CLUSTERED
      (
        [mesRegUniFedId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadesFederacao') AND name='mesRegUniFedIxAk')
  BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedIxAk] >>>'
  CREATE UNIQUE INDEX [mesRegUniFedIxAk]
    ON [ibge].[mesoRegioesUnidadesFederacao]
    (
      [uniFedId]
    , [mesRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedIxFkUniFed] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadesFederacao') AND name='mesRegUniFedIxFkUniFed')
  BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedIxFkUniFed]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [mesRegUniFedIxFkUniFed]
    ON [ibge].[mesoRegioesUnidadesFederacao]
    (
      [uniFedId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedFkUniFed] >>>'
  ALTER TABLE [ibge].[mesoRegioesUnidadesFederacao]
    ADD CONSTRAINT [mesRegUniFedFkUniFed]
    FOREIGN KEY
    (
      [uniFedId]
    )
    REFERENCES [DataCorp].[ibge].[unidadesFederacao]
    (
      [uniFedId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedIxFkMesReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadesFederacao') AND name='mesRegUniFedIxFkMesReg')
  BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedIxFkMesReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [mesRegUniFedIxFkMesReg]
    ON [ibge].[mesoRegioesUnidadesFederacao]
    (
      [mesRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[mesoRegioesUnidadesFederacao].[mesRegUniFedFkMesReg] >>>'
  ALTER TABLE [ibge].[mesoRegioesUnidadesFederacao]
    ADD CONSTRAINT [mesRegUniFedFkMesReg]
    FOREIGN KEY
    (
      [mesRegId]
    )
    REFERENCES [DataCorp].[ibge].[mesoRegioes]
    (
      [mesRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

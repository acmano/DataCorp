/*
* TABELA: [DataCorp].[ibge].[unidadesFederacaoRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegFkReg] >>>'
  IF OBJECT_ID('[ibge].[uniFedRegFkReg]') IS NOT NULL
    ALTER TABLE [ibge].[unidadesFederacaoRegioes]
      DROP CONSTRAINT [uniFedRegFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegFkUniFed] >>>'
  IF OBJECT_ID('[ibge].[uniFedRegFkUniFed]') IS NOT NULL
    ALTER TABLE [ibge].[unidadesFederacaoRegioes]
      DROP CONSTRAINT [uniFedRegFkUniFed]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[unidadesFederacaoRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'unidadesFederacaoRegioes' )
  BEGIN
    DROP TABLE [ibge].[unidadesFederacaoRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[unidadesFederacaoRegioes]
  (

    [uniFedRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [unidadesFederacaoRegioesuniFedRegIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [unidadesFederacaoRegioesregIdNn] NOT NULL

  , [uniFedId]
      BIGINT
      CONSTRAINT [unidadesFederacaoRegioesuniFedIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegPk] >>>'
  ALTER TABLE [ibge].[unidadesFederacaoRegioes]
    ADD CONSTRAINT [uniFedRegPk]
      PRIMARY KEY CLUSTERED
      (
        [uniFedRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegioes') AND name='uniFedRegIxAk')
  BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegioes].[uniFedRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegIxAk] >>>'
  CREATE UNIQUE INDEX [uniFedRegIxAk]
    ON [ibge].[unidadesFederacaoRegioes]
    (
      [regId]
    , [uniFedId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegioes') AND name='uniFedRegIxFkReg')
  BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegioes].[uniFedRegIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [uniFedRegIxFkReg]
    ON [ibge].[unidadesFederacaoRegioes]
    (
      [regId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegFkReg] >>>'
  ALTER TABLE [ibge].[unidadesFederacaoRegioes]
    ADD CONSTRAINT [uniFedRegFkReg]
    FOREIGN KEY
    (
      [regId]
    )
    REFERENCES [DataCorp].[ibge].[regioes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegIxFkUniFed] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegioes') AND name='uniFedRegIxFkUniFed')
  BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegioes].[uniFedRegIxFkUniFed]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [uniFedRegIxFkUniFed]
    ON [ibge].[unidadesFederacaoRegioes]
    (
      [uniFedId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[unidadesFederacaoRegioes].[uniFedRegFkUniFed] >>>'
  ALTER TABLE [ibge].[unidadesFederacaoRegioes]
    ADD CONSTRAINT [uniFedRegFkUniFed]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

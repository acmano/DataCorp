/*
* TABELA: [DataCorp].[ibge].[unidadesFederacao]
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
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[unidadesFederacao] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'unidadesFederacao' )
  BEGIN
    DROP TABLE [ibge].[unidadesFederacao]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[unidadesFederacao] >>>'
  CREATE TABLE [ibge].[unidadesFederacao]
  (

    [uniFedId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [unidadesFederacaoUniFedIdNn] NOT NULL

  , [nome]
      VARCHAR(64)
      CONSTRAINT [unidadesFederacaoNomeNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [unidadesFederacaoDescricaoNn] NOT NULL

  )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[unidadesFederacao].[uniFedPk] >>>'
  ALTER TABLE [ibge].[unidadesFederacao]
    ADD CONSTRAINT [uniFedPk]
      PRIMARY KEY CLUSTERED
      (
        [uniFedId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[unidadesFederacao].[uniFedIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacao') AND name='uniFedIxAk')
  BEGIN
    DROP INDEX [ibge].[unidadesFederacao].[uniFedIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 5
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[unidadesFederacao].[uniFedIxAk] >>>'
  CREATE UNIQUE INDEX [uniFedIxAk]
    ON [ibge].[unidadesFederacao]
    (
      [nome]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

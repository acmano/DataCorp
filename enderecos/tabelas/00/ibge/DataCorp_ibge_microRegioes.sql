/*
* TABELA: [DataCorp].[ibge].[microRegioes]
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
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[microRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'microRegioes' )
  BEGIN
    DROP TABLE [ibge].[microRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[microRegioes] >>>'
  CREATE TABLE [ibge].[microRegioes]
  (

    [micRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [microRegioesMicRegIdNn] NOT NULL

  , [nome]
      VARCHAR(64)
      CONSTRAINT [microRegioesNomeNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [microRegioesDescricaoNn] NOT NULL

  )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[microRegioes].[micRegPk] >>>'
  ALTER TABLE [ibge].[microRegioes]
    ADD CONSTRAINT [micRegPk]
      PRIMARY KEY CLUSTERED
      (
        [micRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[microRegioes].[micRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioes') AND name='micRegIxAk')
  BEGIN
    DROP INDEX [ibge].[microRegioes].[micRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 5
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[microRegioes].[micRegIxAk] >>>'
  CREATE UNIQUE INDEX [micRegIxAk]
    ON [ibge].[microRegioes]
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

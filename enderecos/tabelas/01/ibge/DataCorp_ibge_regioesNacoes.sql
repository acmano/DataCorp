/*
* TABELA: [DataCorp].[ibge].[regioesNacoes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesNacoes].[regNacFkNac] >>>'
  IF OBJECT_ID('[ibge].[regNacFkNac]') IS NOT NULL
    ALTER TABLE [ibge].[regioesNacoes]
      DROP CONSTRAINT [regNacFkNac]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesNacoes].[regNacFkReg] >>>'
  IF OBJECT_ID('[ibge].[regNacFkReg]') IS NOT NULL
    ALTER TABLE [ibge].[regioesNacoes]
      DROP CONSTRAINT [regNacFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[regioesNacoes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'regioesNacoes' )
  BEGIN
    DROP TABLE [ibge].[regioesNacoes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[regioesNacoes]
  (

    [regNacId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [regioesNacoesregNacIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [regioesNacoesnacIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [regioesNacoesregIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[regioesNacoes].[regNacPk] >>>'
  ALTER TABLE [ibge].[regioesNacoes]
    ADD CONSTRAINT [regNacPk]
      PRIMARY KEY CLUSTERED
      (
        [regNacId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesNacoes].[regNacIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxAk')
  BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesNacoes].[regNacIxAk] >>>'
  CREATE UNIQUE INDEX [regNacIxAk]
    ON [ibge].[regioesNacoes]
    (
      [nacId]
    , [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesNacoes].[regNacIxFkNac] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxFkNac')
  BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacIxFkNac]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [regNacIxFkNac]
    ON [ibge].[regioesNacoes]
    (
      [nacId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesNacoes].[regNacFkNac] >>>'
  ALTER TABLE [ibge].[regioesNacoes]
    ADD CONSTRAINT [regNacFkNac]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[regioesNacoes].[regNacIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxFkReg')
  BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [regNacIxFkReg]
    ON [ibge].[regioesNacoes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[regioesNacoes].[regNacFkReg] >>>'
  ALTER TABLE [ibge].[regioesNacoes]
    ADD CONSTRAINT [regNacFkReg]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

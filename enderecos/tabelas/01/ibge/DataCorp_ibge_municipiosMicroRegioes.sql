/*
* TABELA: [DataCorp].[ibge].[municipiosMicroRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegFkMicReg] >>>'
  IF OBJECT_ID('[ibge].[munMicRegFkMicReg]') IS NOT NULL
    ALTER TABLE [ibge].[municipiosMicroRegioes]
      DROP CONSTRAINT [munMicRegFkMicReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegFkMun] >>>'
  IF OBJECT_ID('[ibge].[munMicRegFkMun]') IS NOT NULL
    ALTER TABLE [ibge].[municipiosMicroRegioes]
      DROP CONSTRAINT [munMicRegFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[municipiosMicroRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'municipiosMicroRegioes' )
  BEGIN
    DROP TABLE [ibge].[municipiosMicroRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[municipiosMicroRegioes]
  (

    [munMicRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [municipiosMicroRegioesmunMicRegIdNn] NOT NULL

  , [micRegId]
      BIGINT
      CONSTRAINT [municipiosMicroRegioesmicRegIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [municipiosMicroRegioesmunIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegPk] >>>'
  ALTER TABLE [ibge].[municipiosMicroRegioes]
    ADD CONSTRAINT [munMicRegPk]
      PRIMARY KEY CLUSTERED
      (
        [munMicRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegioes') AND name='munMicRegIxAk')
  BEGIN
    DROP INDEX [ibge].[municipiosMicroRegioes].[munMicRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegIxAk] >>>'
  CREATE UNIQUE INDEX [munMicRegIxAk]
    ON [ibge].[municipiosMicroRegioes]
    (
      [micRegId]
    , [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegIxFkMicReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegioes') AND name='munMicRegIxFkMicReg')
  BEGIN
    DROP INDEX [ibge].[municipiosMicroRegioes].[munMicRegIxFkMicReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [munMicRegIxFkMicReg]
    ON [ibge].[municipiosMicroRegioes]
    (
      [micRegId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegFkMicReg] >>>'
  ALTER TABLE [ibge].[municipiosMicroRegioes]
    ADD CONSTRAINT [munMicRegFkMicReg]
    FOREIGN KEY
    (
      [micRegId]
    )
    REFERENCES [DataCorp].[ibge].[microRegioes]
    (
      [micRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegioes') AND name='munMicRegIxFkMun')
  BEGIN
    DROP INDEX [ibge].[municipiosMicroRegioes].[munMicRegIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [munMicRegIxFkMun]
    ON [ibge].[municipiosMicroRegioes]
    (
      [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[municipiosMicroRegioes].[munMicRegFkMun] >>>'
  ALTER TABLE [ibge].[municipiosMicroRegioes]
    ADD CONSTRAINT [munMicRegFkMun]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

/*
* TABELA: [DataCorp].[ibge].[microRegioesMesoRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegFkMesReg] >>>'
  IF OBJECT_ID('[ibge].[micRegMesRegFkMesReg]') IS NOT NULL
    ALTER TABLE [ibge].[microRegioesMesoRegioes]
      DROP CONSTRAINT [micRegMesRegFkMesReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegFkMicReg] >>>'
  IF OBJECT_ID('[ibge].[micRegMesRegFkMicReg]') IS NOT NULL
    ALTER TABLE [ibge].[microRegioesMesoRegioes]
      DROP CONSTRAINT [micRegMesRegFkMicReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[microRegioesMesoRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'microRegioesMesoRegioes' )
  BEGIN
    DROP TABLE [ibge].[microRegioesMesoRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[microRegioesMesoRegioes]
  (

    [micRegMesRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [microRegioesMesoRegioesmicRegMesRegIdNn] NOT NULL

  , [mesRegId]
      BIGINT
      CONSTRAINT [microRegioesMesoRegioesmesRegIdNn] NOT NULL

  , [micRegId]
      BIGINT
      CONSTRAINT [microRegioesMesoRegioesmicRegIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegPk] >>>'
  ALTER TABLE [ibge].[microRegioesMesoRegioes]
    ADD CONSTRAINT [micRegMesRegPk]
      PRIMARY KEY CLUSTERED
      (
        [micRegMesRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegioes') AND name='micRegMesRegIxAk')
  BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegioes].[micRegMesRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegIxAk] >>>'
  CREATE UNIQUE INDEX [micRegMesRegIxAk]
    ON [ibge].[microRegioesMesoRegioes]
    (
      [mesRegId]
    , [micRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegIxFkMesReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegioes') AND name='micRegMesRegIxFkMesReg')
  BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegioes].[micRegMesRegIxFkMesReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [micRegMesRegIxFkMesReg]
    ON [ibge].[microRegioesMesoRegioes]
    (
      [mesRegId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegFkMesReg] >>>'
  ALTER TABLE [ibge].[microRegioesMesoRegioes]
    ADD CONSTRAINT [micRegMesRegFkMesReg]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegIxFkMicReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegioes') AND name='micRegMesRegIxFkMicReg')
  BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegioes].[micRegMesRegIxFkMicReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [micRegMesRegIxFkMicReg]
    ON [ibge].[microRegioesMesoRegioes]
    (
      [micRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[microRegioesMesoRegioes].[micRegMesRegFkMicReg] >>>'
  ALTER TABLE [ibge].[microRegioesMesoRegioes]
    ADD CONSTRAINT [micRegMesRegFkMicReg]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

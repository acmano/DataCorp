/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniFkQui] >>>'
  IF OBJECT_ID('[cal].[decOrdQuiIniFkQui]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuinzenasIniciais]
      DROP CONSTRAINT [decOrdQuiIniFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdQuiIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuinzenasIniciais]
      DROP CONSTRAINT [decOrdQuiIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisQuinzenasIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisQuinzenasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisQuinzenasIniciais]
  (

    [decOrdQuiIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisQuinzenasIniciaisdecOrdQuiIniIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuinzenasIniciaisquiIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuinzenasIniciaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuinzenasIniciais]
    ADD CONSTRAINT [decOrdQuiIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdQuiIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuinzenasIniciais') AND name='decOrdQuiIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdQuiIniIxAk]
    ON [cal].[decendiosOrdinaisQuinzenasIniciais]
    (
      [quiId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuinzenasIniciais') AND name='decOrdQuiIniIxFkQui')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdQuiIniIxFkQui]
    ON [cal].[decendiosOrdinaisQuinzenasIniciais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniFkQui] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuinzenasIniciais]
    ADD CONSTRAINT [decOrdQuiIniFkQui]
    FOREIGN KEY
    (
      [quiId]
    )
    REFERENCES [DataCorp].[cal].[quinzenas]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuinzenasIniciais') AND name='decOrdQuiIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdQuiIniIxFkDecOrd]
    ON [cal].[decendiosOrdinaisQuinzenasIniciais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasIniciais].[decOrdQuiIniFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuinzenasIniciais]
    ADD CONSTRAINT [decOrdQuiIniFkDecOrd]
    FOREIGN KEY
    (
      [decOrdId]
    )
    REFERENCES [DataCorp].[cal].[decendiosOrdinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

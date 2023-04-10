/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisSeculos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecFkSec] >>>'
  IF OBJECT_ID('[cal].[decOrdSecFkSec]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSeculos]
      DROP CONSTRAINT [decOrdSecFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdSecFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSeculos]
      DROP CONSTRAINT [decOrdSecFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisSeculos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisSeculos' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisSeculos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisSeculos]
  (

    [decOrdSecId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisSeculosdecOrdSecIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSeculossecIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSeculosdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSeculos]
    ADD CONSTRAINT [decOrdSecPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdSecId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSeculos') AND name='decOrdSecIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSeculos].[decOrdSecIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdSecIxAk]
    ON [cal].[decendiosOrdinaisSeculos]
    (
      [secId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSeculos') AND name='decOrdSecIxFkSec')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSeculos].[decOrdSecIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdSecIxFkSec]
    ON [cal].[decendiosOrdinaisSeculos]
    (
      [secId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecFkSec] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSeculos]
    ADD CONSTRAINT [decOrdSecFkSec]
    FOREIGN KEY
    (
      [secId]
    )
    REFERENCES [DataCorp].[cal].[seculos]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSeculos') AND name='decOrdSecIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSeculos].[decOrdSecIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdSecIxFkDecOrd]
    ON [cal].[decendiosOrdinaisSeculos]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSeculos].[decOrdSecFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSeculos]
    ADD CONSTRAINT [decOrdSecFkDecOrd]
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

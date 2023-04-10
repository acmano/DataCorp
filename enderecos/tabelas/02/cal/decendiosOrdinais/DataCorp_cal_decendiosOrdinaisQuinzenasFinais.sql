/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinFkQui] >>>'
  IF OBJECT_ID('[cal].[decOrdQuiFinFkQui]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuinzenasFinais]
      DROP CONSTRAINT [decOrdQuiFinFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdQuiFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuinzenasFinais]
      DROP CONSTRAINT [decOrdQuiFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisQuinzenasFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisQuinzenasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisQuinzenasFinais]
  (

    [decOrdQuiFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisQuinzenasFinaisdecOrdQuiFinIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuinzenasFinaisquiIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuinzenasFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuinzenasFinais]
    ADD CONSTRAINT [decOrdQuiFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdQuiFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuinzenasFinais') AND name='decOrdQuiFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdQuiFinIxAk]
    ON [cal].[decendiosOrdinaisQuinzenasFinais]
    (
      [quiId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuinzenasFinais') AND name='decOrdQuiFinIxFkQui')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdQuiFinIxFkQui]
    ON [cal].[decendiosOrdinaisQuinzenasFinais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinFkQui] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuinzenasFinais]
    ADD CONSTRAINT [decOrdQuiFinFkQui]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuinzenasFinais') AND name='decOrdQuiFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdQuiFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisQuinzenasFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuinzenasFinais].[decOrdQuiFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuinzenasFinais]
    ADD CONSTRAINT [decOrdQuiFinFkDecOrd]
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

/*
* TABELA: [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[milDecOrdFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosOrdinaisFinais]
      DROP CONSTRAINT [milDecOrdFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milDecOrdFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosOrdinaisFinais]
      DROP CONSTRAINT [milDecOrdFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosDecendiosOrdinaisFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosDecendiosOrdinaisFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosDecendiosOrdinaisFinais]
  (

    [milDecOrdFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosDecendiosOrdinaisFinaismilDecOrdFinIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [mileniosDecendiosOrdinaisFinaisdecOrdIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosDecendiosOrdinaisFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinPk] >>>'
  ALTER TABLE [cal].[mileniosDecendiosOrdinaisFinais]
    ADD CONSTRAINT [milDecOrdFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milDecOrdFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosOrdinaisFinais') AND name='milDecOrdFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinIxAk] >>>'
  CREATE UNIQUE INDEX [milDecOrdFinIxAk]
    ON [cal].[mileniosDecendiosOrdinaisFinais]
    (
      [decOrdId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosOrdinaisFinais') AND name='milDecOrdFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milDecOrdFinIxFkDecOrd]
    ON [cal].[mileniosDecendiosOrdinaisFinais]
    (
      [decOrdId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinFkDecOrd] >>>'
  ALTER TABLE [cal].[mileniosDecendiosOrdinaisFinais]
    ADD CONSTRAINT [milDecOrdFinFkDecOrd]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosOrdinaisFinais') AND name='milDecOrdFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milDecOrdFinIxFkMil]
    ON [cal].[mileniosDecendiosOrdinaisFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisFinais].[milDecOrdFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosDecendiosOrdinaisFinais]
    ADD CONSTRAINT [milDecOrdFinFkMil]
    FOREIGN KEY
    (
      [milId]
    )
    REFERENCES [DataCorp].[cal].[milenios]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

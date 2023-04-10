/*
* TABELA: [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[milDecOrdIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosOrdinaisIniciais]
      DROP CONSTRAINT [milDecOrdIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milDecOrdIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDecendiosOrdinaisIniciais]
      DROP CONSTRAINT [milDecOrdIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosDecendiosOrdinaisIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosDecendiosOrdinaisIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosDecendiosOrdinaisIniciais]
  (

    [milDecOrdIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosDecendiosOrdinaisIniciaismilDecOrdIniIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [mileniosDecendiosOrdinaisIniciaisdecOrdIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosDecendiosOrdinaisIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniPk] >>>'
  ALTER TABLE [cal].[mileniosDecendiosOrdinaisIniciais]
    ADD CONSTRAINT [milDecOrdIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milDecOrdIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosOrdinaisIniciais') AND name='milDecOrdIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniIxAk] >>>'
  CREATE UNIQUE INDEX [milDecOrdIniIxAk]
    ON [cal].[mileniosDecendiosOrdinaisIniciais]
    (
      [decOrdId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosOrdinaisIniciais') AND name='milDecOrdIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milDecOrdIniIxFkDecOrd]
    ON [cal].[mileniosDecendiosOrdinaisIniciais]
    (
      [decOrdId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniFkDecOrd] >>>'
  ALTER TABLE [cal].[mileniosDecendiosOrdinaisIniciais]
    ADD CONSTRAINT [milDecOrdIniFkDecOrd]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDecendiosOrdinaisIniciais') AND name='milDecOrdIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milDecOrdIniIxFkMil]
    ON [cal].[mileniosDecendiosOrdinaisIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDecendiosOrdinaisIniciais].[milDecOrdIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosDecendiosOrdinaisIniciais]
    ADD CONSTRAINT [milDecOrdIniFkMil]
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

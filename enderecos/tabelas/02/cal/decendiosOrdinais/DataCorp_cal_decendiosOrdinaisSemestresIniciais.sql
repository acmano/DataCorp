/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniFkSmt] >>>'
  IF OBJECT_ID('[cal].[decOrdSmtIniFkSmt]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemestresIniciais]
      DROP CONSTRAINT [decOrdSmtIniFkSmt]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdSmtIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemestresIniciais]
      DROP CONSTRAINT [decOrdSmtIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisSemestresIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisSemestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisSemestresIniciais]
  (

    [decOrdSmtIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisSemestresIniciaisdecOrdSmtIniIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemestresIniciaissmtIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemestresIniciaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemestresIniciais]
    ADD CONSTRAINT [decOrdSmtIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdSmtIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemestresIniciais') AND name='decOrdSmtIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdSmtIniIxAk]
    ON [cal].[decendiosOrdinaisSemestresIniciais]
    (
      [smtId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniIxFkSmt] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemestresIniciais') AND name='decOrdSmtIniIxFkSmt')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniIxFkSmt]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdSmtIniIxFkSmt]
    ON [cal].[decendiosOrdinaisSemestresIniciais]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniFkSmt] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemestresIniciais]
    ADD CONSTRAINT [decOrdSmtIniFkSmt]
    FOREIGN KEY
    (
      [smtId]
    )
    REFERENCES [DataCorp].[cal].[semestres]
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemestresIniciais') AND name='decOrdSmtIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdSmtIniIxFkDecOrd]
    ON [cal].[decendiosOrdinaisSemestresIniciais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresIniciais].[decOrdSmtIniFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemestresIniciais]
    ADD CONSTRAINT [decOrdSmtIniFkDecOrd]
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

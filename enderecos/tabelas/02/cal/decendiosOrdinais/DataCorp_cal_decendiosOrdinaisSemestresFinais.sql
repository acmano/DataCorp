/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisSemestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinFkSmt] >>>'
  IF OBJECT_ID('[cal].[decOrdSmtFinFkSmt]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemestresFinais]
      DROP CONSTRAINT [decOrdSmtFinFkSmt]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdSmtFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemestresFinais]
      DROP CONSTRAINT [decOrdSmtFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisSemestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisSemestresFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisSemestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisSemestresFinais]
  (

    [decOrdSmtFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisSemestresFinaisdecOrdSmtFinIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemestresFinaissmtIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemestresFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemestresFinais]
    ADD CONSTRAINT [decOrdSmtFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdSmtFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemestresFinais') AND name='decOrdSmtFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdSmtFinIxAk]
    ON [cal].[decendiosOrdinaisSemestresFinais]
    (
      [smtId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinIxFkSmt] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemestresFinais') AND name='decOrdSmtFinIxFkSmt')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinIxFkSmt]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdSmtFinIxFkSmt]
    ON [cal].[decendiosOrdinaisSemestresFinais]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinFkSmt] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemestresFinais]
    ADD CONSTRAINT [decOrdSmtFinFkSmt]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemestresFinais') AND name='decOrdSmtFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdSmtFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisSemestresFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemestresFinais].[decOrdSmtFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemestresFinais]
    ADD CONSTRAINT [decOrdSmtFinFkDecOrd]
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

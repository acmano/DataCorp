/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinFkSemAno] >>>'
  IF OBJECT_ID('[cal].[decOrdSemAnoFinFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosFinais]
      DROP CONSTRAINT [decOrdSemAnoFinFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdSemAnoFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosFinais]
      DROP CONSTRAINT [decOrdSemAnoFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisSemanasAnosFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisSemanasAnosFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisSemanasAnosFinais]
  (

    [decOrdSemAnoFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisSemanasAnosFinaisdecOrdSemAnoFinIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasAnosFinaissemAnoIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasAnosFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosFinais]
    ADD CONSTRAINT [decOrdSemAnoFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdSemAnoFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasAnosFinais') AND name='decOrdSemAnoFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdSemAnoFinIxAk]
    ON [cal].[decendiosOrdinaisSemanasAnosFinais]
    (
      [semAnoId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasAnosFinais') AND name='decOrdSemAnoFinIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdSemAnoFinIxFkSemAno]
    ON [cal].[decendiosOrdinaisSemanasAnosFinais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinFkSemAno] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosFinais]
    ADD CONSTRAINT [decOrdSemAnoFinFkSemAno]
    FOREIGN KEY
    (
      [semAnoId]
    )
    REFERENCES [DataCorp].[cal].[semanasAnos]
    (
      [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasAnosFinais') AND name='decOrdSemAnoFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdSemAnoFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisSemanasAnosFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosFinais].[decOrdSemAnoFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosFinais]
    ADD CONSTRAINT [decOrdSemAnoFinFkDecOrd]
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

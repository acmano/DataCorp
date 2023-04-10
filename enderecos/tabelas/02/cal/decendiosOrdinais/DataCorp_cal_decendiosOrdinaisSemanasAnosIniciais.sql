/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniFkSemAno] >>>'
  IF OBJECT_ID('[cal].[decOrdSemAnoIniFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosIniciais]
      DROP CONSTRAINT [decOrdSemAnoIniFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdSemAnoIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosIniciais]
      DROP CONSTRAINT [decOrdSemAnoIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisSemanasAnosIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisSemanasAnosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisSemanasAnosIniciais]
  (

    [decOrdSemAnoIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisSemanasAnosIniciaisdecOrdSemAnoIniIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasAnosIniciaissemAnoIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasAnosIniciaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosIniciais]
    ADD CONSTRAINT [decOrdSemAnoIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdSemAnoIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasAnosIniciais') AND name='decOrdSemAnoIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdSemAnoIniIxAk]
    ON [cal].[decendiosOrdinaisSemanasAnosIniciais]
    (
      [semAnoId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasAnosIniciais') AND name='decOrdSemAnoIniIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdSemAnoIniIxFkSemAno]
    ON [cal].[decendiosOrdinaisSemanasAnosIniciais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniFkSemAno] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosIniciais]
    ADD CONSTRAINT [decOrdSemAnoIniFkSemAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasAnosIniciais') AND name='decOrdSemAnoIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdSemAnoIniIxFkDecOrd]
    ON [cal].[decendiosOrdinaisSemanasAnosIniciais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasAnosIniciais].[decOrdSemAnoIniFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasAnosIniciais]
    ADD CONSTRAINT [decOrdSemAnoIniFkDecOrd]
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

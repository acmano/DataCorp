/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinFkQua] >>>'
  IF OBJECT_ID('[cal].[decOrdQuaFinFkQua]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresFinais]
      DROP CONSTRAINT [decOrdQuaFinFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdQuaFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresFinais]
      DROP CONSTRAINT [decOrdQuaFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisQuadrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisQuadrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisQuadrimestresFinais]
  (

    [decOrdQuaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisQuadrimestresFinaisdecOrdQuaFinIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuadrimestresFinaisquaIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuadrimestresFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresFinais]
    ADD CONSTRAINT [decOrdQuaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdQuaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuadrimestresFinais') AND name='decOrdQuaFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdQuaFinIxAk]
    ON [cal].[decendiosOrdinaisQuadrimestresFinais]
    (
      [quaId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuadrimestresFinais') AND name='decOrdQuaFinIxFkQua')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdQuaFinIxFkQua]
    ON [cal].[decendiosOrdinaisQuadrimestresFinais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinFkQua] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresFinais]
    ADD CONSTRAINT [decOrdQuaFinFkQua]
    FOREIGN KEY
    (
      [quaId]
    )
    REFERENCES [DataCorp].[cal].[quadrimestres]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuadrimestresFinais') AND name='decOrdQuaFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdQuaFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisQuadrimestresFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresFinais].[decOrdQuaFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresFinais]
    ADD CONSTRAINT [decOrdQuaFinFkDecOrd]
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

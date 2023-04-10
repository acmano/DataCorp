/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinFkTri] >>>'
  IF OBJECT_ID('[cal].[decOrdTriFinFkTri]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisTrimestresFinais]
      DROP CONSTRAINT [decOrdTriFinFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdTriFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisTrimestresFinais]
      DROP CONSTRAINT [decOrdTriFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisTrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisTrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisTrimestresFinais]
  (

    [decOrdTriFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisTrimestresFinaisdecOrdTriFinIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisTrimestresFinaistriIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisTrimestresFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisTrimestresFinais]
    ADD CONSTRAINT [decOrdTriFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdTriFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisTrimestresFinais') AND name='decOrdTriFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdTriFinIxAk]
    ON [cal].[decendiosOrdinaisTrimestresFinais]
    (
      [triId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisTrimestresFinais') AND name='decOrdTriFinIxFkTri')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdTriFinIxFkTri]
    ON [cal].[decendiosOrdinaisTrimestresFinais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinFkTri] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisTrimestresFinais]
    ADD CONSTRAINT [decOrdTriFinFkTri]
    FOREIGN KEY
    (
      [triId]
    )
    REFERENCES [DataCorp].[cal].[trimestres]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisTrimestresFinais') AND name='decOrdTriFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdTriFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisTrimestresFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresFinais].[decOrdTriFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisTrimestresFinais]
    ADD CONSTRAINT [decOrdTriFinFkDecOrd]
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

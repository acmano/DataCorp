/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisDiasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinFkDia] >>>'
  IF OBJECT_ID('[cal].[decOrdDiaFinFkDia]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisDiasFinais]
      DROP CONSTRAINT [decOrdDiaFinFkDia]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdDiaFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisDiasFinais]
      DROP CONSTRAINT [decOrdDiaFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisDiasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisDiasFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisDiasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisDiasFinais]
  (

    [decOrdDiaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisDiasFinaisdecOrdDiaFinIdNn] NOT NULL

  , [diaId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisDiasFinaisdiaIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisDiasFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDiasFinais]
    ADD CONSTRAINT [decOrdDiaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdDiaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDiasFinais') AND name='decOrdDiaFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdDiaFinIxAk]
    ON [cal].[decendiosOrdinaisDiasFinais]
    (
      [diaId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinIxFkDia] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDiasFinais') AND name='decOrdDiaFinIxFkDia')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinIxFkDia]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdDiaFinIxFkDia]
    ON [cal].[decendiosOrdinaisDiasFinais]
    (
      [diaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinFkDia] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDiasFinais]
    ADD CONSTRAINT [decOrdDiaFinFkDia]
    FOREIGN KEY
    (
      [diaId]
    )
    REFERENCES [DataCorp].[cal].[dias]
    (
      [diaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDiasFinais') AND name='decOrdDiaFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdDiaFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisDiasFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasFinais].[decOrdDiaFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDiasFinais]
    ADD CONSTRAINT [decOrdDiaFinFkDecOrd]
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

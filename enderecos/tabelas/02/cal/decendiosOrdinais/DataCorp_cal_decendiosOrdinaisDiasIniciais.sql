/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisDiasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniFkDia] >>>'
  IF OBJECT_ID('[cal].[decOrdDiaIniFkDia]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisDiasIniciais]
      DROP CONSTRAINT [decOrdDiaIniFkDia]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdDiaIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisDiasIniciais]
      DROP CONSTRAINT [decOrdDiaIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisDiasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisDiasIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisDiasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisDiasIniciais]
  (

    [decOrdDiaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisDiasIniciaisdecOrdDiaIniIdNn] NOT NULL

  , [diaId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisDiasIniciaisdiaIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisDiasIniciaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDiasIniciais]
    ADD CONSTRAINT [decOrdDiaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdDiaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDiasIniciais') AND name='decOrdDiaIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdDiaIniIxAk]
    ON [cal].[decendiosOrdinaisDiasIniciais]
    (
      [diaId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniIxFkDia] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDiasIniciais') AND name='decOrdDiaIniIxFkDia')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniIxFkDia]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdDiaIniIxFkDia]
    ON [cal].[decendiosOrdinaisDiasIniciais]
    (
      [diaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniFkDia] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDiasIniciais]
    ADD CONSTRAINT [decOrdDiaIniFkDia]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisDiasIniciais') AND name='decOrdDiaIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdDiaIniIxFkDecOrd]
    ON [cal].[decendiosOrdinaisDiasIniciais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisDiasIniciais].[decOrdDiaIniFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisDiasIniciais]
    ADD CONSTRAINT [decOrdDiaIniFkDecOrd]
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

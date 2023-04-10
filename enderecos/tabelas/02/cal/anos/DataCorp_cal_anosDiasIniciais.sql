/*
* TABELA: [DataCorp].[cal].[anosDiasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniFkDia] >>>'
  IF OBJECT_ID('[cal].[anoDiaIniFkDia]') IS NOT NULL
    ALTER TABLE [cal].[anosDiasIniciais]
      DROP CONSTRAINT [anoDiaIniFkDia]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniFkAno] >>>'
  IF OBJECT_ID('[cal].[anoDiaIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosDiasIniciais]
      DROP CONSTRAINT [anoDiaIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosDiasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosDiasIniciais' )
  BEGIN
    DROP TABLE [cal].[anosDiasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosDiasIniciais]
  (

    [anoDiaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosDiasIniciaisanoDiaIniIdNn] NOT NULL

  , [diaId]
      BIGINT
      CONSTRAINT [anosDiasIniciaisdiaIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosDiasIniciaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniPk] >>>'
  ALTER TABLE [cal].[anosDiasIniciais]
    ADD CONSTRAINT [anoDiaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [anoDiaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDiasIniciais') AND name='anoDiaIniIxAk')
  BEGIN
    DROP INDEX [cal].[anosDiasIniciais].[anoDiaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniIxAk] >>>'
  CREATE UNIQUE INDEX [anoDiaIniIxAk]
    ON [cal].[anosDiasIniciais]
    (
      [diaId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniIxFkDia] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDiasIniciais') AND name='anoDiaIniIxFkDia')
  BEGIN
    DROP INDEX [cal].[anosDiasIniciais].[anoDiaIniIxFkDia]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoDiaIniIxFkDia]
    ON [cal].[anosDiasIniciais]
    (
      [diaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniFkDia] >>>'
  ALTER TABLE [cal].[anosDiasIniciais]
    ADD CONSTRAINT [anoDiaIniFkDia]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDiasIniciais') AND name='anoDiaIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosDiasIniciais].[anoDiaIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoDiaIniIxFkAno]
    ON [cal].[anosDiasIniciais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasIniciais].[anoDiaIniFkAno] >>>'
  ALTER TABLE [cal].[anosDiasIniciais]
    ADD CONSTRAINT [anoDiaIniFkAno]
    FOREIGN KEY
    (
      [anoId]
    )
    REFERENCES [DataCorp].[cal].[anos]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

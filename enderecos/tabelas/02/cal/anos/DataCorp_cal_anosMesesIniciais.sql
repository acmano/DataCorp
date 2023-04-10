/*
* TABELA: [DataCorp].[cal].[anosMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesIniciais].[anoMesIniFkMes] >>>'
  IF OBJECT_ID('[cal].[anoMesIniFkMes]') IS NOT NULL
    ALTER TABLE [cal].[anosMesesIniciais]
      DROP CONSTRAINT [anoMesIniFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesIniciais].[anoMesIniFkAno] >>>'
  IF OBJECT_ID('[cal].[anoMesIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosMesesIniciais]
      DROP CONSTRAINT [anoMesIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[anosMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosMesesIniciais]
  (

    [anoMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosMesesIniciaisanoMesIniIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [anosMesesIniciaismesIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosMesesIniciaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosMesesIniciais].[anoMesIniPk] >>>'
  ALTER TABLE [cal].[anosMesesIniciais]
    ADD CONSTRAINT [anoMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [anoMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesIniciais].[anoMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosMesesIniciais') AND name='anoMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[anosMesesIniciais].[anoMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesIniciais].[anoMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [anoMesIniIxAk]
    ON [cal].[anosMesesIniciais]
    (
      [mesId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesIniciais].[anoMesIniIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosMesesIniciais') AND name='anoMesIniIxFkMes')
  BEGIN
    DROP INDEX [cal].[anosMesesIniciais].[anoMesIniIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoMesIniIxFkMes]
    ON [cal].[anosMesesIniciais]
    (
      [mesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesIniciais].[anoMesIniFkMes] >>>'
  ALTER TABLE [cal].[anosMesesIniciais]
    ADD CONSTRAINT [anoMesIniFkMes]
    FOREIGN KEY
    (
      [mesId]
    )
    REFERENCES [DataCorp].[cal].[meses]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesIniciais].[anoMesIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosMesesIniciais') AND name='anoMesIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosMesesIniciais].[anoMesIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoMesIniIxFkAno]
    ON [cal].[anosMesesIniciais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesIniciais].[anoMesIniFkAno] >>>'
  ALTER TABLE [cal].[anosMesesIniciais]
    ADD CONSTRAINT [anoMesIniFkAno]
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

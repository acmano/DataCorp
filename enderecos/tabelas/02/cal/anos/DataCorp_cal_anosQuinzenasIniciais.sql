/*
* TABELA: [DataCorp].[cal].[anosQuinzenasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniFkQui] >>>'
  IF OBJECT_ID('[cal].[anoQuiIniFkQui]') IS NOT NULL
    ALTER TABLE [cal].[anosQuinzenasIniciais]
      DROP CONSTRAINT [anoQuiIniFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniFkAno] >>>'
  IF OBJECT_ID('[cal].[anoQuiIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosQuinzenasIniciais]
      DROP CONSTRAINT [anoQuiIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosQuinzenasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosQuinzenasIniciais' )
  BEGIN
    DROP TABLE [cal].[anosQuinzenasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosQuinzenasIniciais]
  (

    [anoQuiIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosQuinzenasIniciaisanoQuiIniIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [anosQuinzenasIniciaisquiIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosQuinzenasIniciaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniPk] >>>'
  ALTER TABLE [cal].[anosQuinzenasIniciais]
    ADD CONSTRAINT [anoQuiIniPk]
      PRIMARY KEY CLUSTERED
      (
        [anoQuiIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuinzenasIniciais') AND name='anoQuiIniIxAk')
  BEGIN
    DROP INDEX [cal].[anosQuinzenasIniciais].[anoQuiIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniIxAk] >>>'
  CREATE UNIQUE INDEX [anoQuiIniIxAk]
    ON [cal].[anosQuinzenasIniciais]
    (
      [quiId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuinzenasIniciais') AND name='anoQuiIniIxFkQui')
  BEGIN
    DROP INDEX [cal].[anosQuinzenasIniciais].[anoQuiIniIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoQuiIniIxFkQui]
    ON [cal].[anosQuinzenasIniciais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniFkQui] >>>'
  ALTER TABLE [cal].[anosQuinzenasIniciais]
    ADD CONSTRAINT [anoQuiIniFkQui]
    FOREIGN KEY
    (
      [quiId]
    )
    REFERENCES [DataCorp].[cal].[quinzenas]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuinzenasIniciais') AND name='anoQuiIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosQuinzenasIniciais].[anoQuiIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoQuiIniIxFkAno]
    ON [cal].[anosQuinzenasIniciais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasIniciais].[anoQuiIniFkAno] >>>'
  ALTER TABLE [cal].[anosQuinzenasIniciais]
    ADD CONSTRAINT [anoQuiIniFkAno]
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

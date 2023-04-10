/*
* TABELA: [DataCorp].[cal].[mileniosAnosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniFkAno] >>>'
  IF OBJECT_ID('[cal].[milAnoIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[mileniosAnosIniciais]
      DROP CONSTRAINT [milAnoIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milAnoIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosAnosIniciais]
      DROP CONSTRAINT [milAnoIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosAnosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosAnosIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosAnosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosAnosIniciais]
  (

    [milAnoIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosAnosIniciaismilAnoIniIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [mileniosAnosIniciaisanoIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosAnosIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniPk] >>>'
  ALTER TABLE [cal].[mileniosAnosIniciais]
    ADD CONSTRAINT [milAnoIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milAnoIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosAnosIniciais') AND name='milAnoIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosAnosIniciais].[milAnoIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniIxAk] >>>'
  CREATE UNIQUE INDEX [milAnoIniIxAk]
    ON [cal].[mileniosAnosIniciais]
    (
      [anoId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosAnosIniciais') AND name='milAnoIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[mileniosAnosIniciais].[milAnoIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milAnoIniIxFkAno]
    ON [cal].[mileniosAnosIniciais]
    (
      [anoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniFkAno] >>>'
  ALTER TABLE [cal].[mileniosAnosIniciais]
    ADD CONSTRAINT [milAnoIniFkAno]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosAnosIniciais') AND name='milAnoIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosAnosIniciais].[milAnoIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milAnoIniIxFkMil]
    ON [cal].[mileniosAnosIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosIniciais].[milAnoIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosAnosIniciais]
    ADD CONSTRAINT [milAnoIniFkMil]
    FOREIGN KEY
    (
      [milId]
    )
    REFERENCES [DataCorp].[cal].[milenios]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

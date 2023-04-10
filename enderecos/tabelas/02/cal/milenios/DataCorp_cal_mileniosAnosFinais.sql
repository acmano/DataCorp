/*
* TABELA: [DataCorp].[cal].[mileniosAnosFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinFkAno] >>>'
  IF OBJECT_ID('[cal].[milAnoFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[mileniosAnosFinais]
      DROP CONSTRAINT [milAnoFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milAnoFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosAnosFinais]
      DROP CONSTRAINT [milAnoFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosAnosFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosAnosFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosAnosFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosAnosFinais]
  (

    [milAnoFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosAnosFinaismilAnoFinIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [mileniosAnosFinaisanoIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosAnosFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinPk] >>>'
  ALTER TABLE [cal].[mileniosAnosFinais]
    ADD CONSTRAINT [milAnoFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milAnoFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosAnosFinais') AND name='milAnoFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosAnosFinais].[milAnoFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinIxAk] >>>'
  CREATE UNIQUE INDEX [milAnoFinIxAk]
    ON [cal].[mileniosAnosFinais]
    (
      [anoId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosAnosFinais') AND name='milAnoFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[mileniosAnosFinais].[milAnoFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milAnoFinIxFkAno]
    ON [cal].[mileniosAnosFinais]
    (
      [anoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinFkAno] >>>'
  ALTER TABLE [cal].[mileniosAnosFinais]
    ADD CONSTRAINT [milAnoFinFkAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosAnosFinais') AND name='milAnoFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosAnosFinais].[milAnoFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milAnoFinIxFkMil]
    ON [cal].[mileniosAnosFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosAnosFinais].[milAnoFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosAnosFinais]
    ADD CONSTRAINT [milAnoFinFkMil]
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

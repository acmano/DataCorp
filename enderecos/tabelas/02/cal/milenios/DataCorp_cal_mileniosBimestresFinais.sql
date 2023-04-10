/*
* TABELA: [DataCorp].[cal].[mileniosBimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinFkBim] >>>'
  IF OBJECT_ID('[cal].[milBimFinFkBim]') IS NOT NULL
    ALTER TABLE [cal].[mileniosBimestresFinais]
      DROP CONSTRAINT [milBimFinFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milBimFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosBimestresFinais]
      DROP CONSTRAINT [milBimFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosBimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosBimestresFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosBimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosBimestresFinais]
  (

    [milBimFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosBimestresFinaismilBimFinIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [mileniosBimestresFinaisbimIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosBimestresFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinPk] >>>'
  ALTER TABLE [cal].[mileniosBimestresFinais]
    ADD CONSTRAINT [milBimFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milBimFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosBimestresFinais') AND name='milBimFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosBimestresFinais].[milBimFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinIxAk] >>>'
  CREATE UNIQUE INDEX [milBimFinIxAk]
    ON [cal].[mileniosBimestresFinais]
    (
      [bimId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosBimestresFinais') AND name='milBimFinIxFkBim')
  BEGIN
    DROP INDEX [cal].[mileniosBimestresFinais].[milBimFinIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milBimFinIxFkBim]
    ON [cal].[mileniosBimestresFinais]
    (
      [bimId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinFkBim] >>>'
  ALTER TABLE [cal].[mileniosBimestresFinais]
    ADD CONSTRAINT [milBimFinFkBim]
    FOREIGN KEY
    (
      [bimId]
    )
    REFERENCES [DataCorp].[cal].[bimestres]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosBimestresFinais') AND name='milBimFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosBimestresFinais].[milBimFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milBimFinIxFkMil]
    ON [cal].[mileniosBimestresFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresFinais].[milBimFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosBimestresFinais]
    ADD CONSTRAINT [milBimFinFkMil]
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

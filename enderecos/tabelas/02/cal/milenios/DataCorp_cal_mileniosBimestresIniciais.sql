/*
* TABELA: [DataCorp].[cal].[mileniosBimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniFkBim] >>>'
  IF OBJECT_ID('[cal].[milBimIniFkBim]') IS NOT NULL
    ALTER TABLE [cal].[mileniosBimestresIniciais]
      DROP CONSTRAINT [milBimIniFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milBimIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosBimestresIniciais]
      DROP CONSTRAINT [milBimIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosBimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosBimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosBimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosBimestresIniciais]
  (

    [milBimIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosBimestresIniciaismilBimIniIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [mileniosBimestresIniciaisbimIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosBimestresIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniPk] >>>'
  ALTER TABLE [cal].[mileniosBimestresIniciais]
    ADD CONSTRAINT [milBimIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milBimIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosBimestresIniciais') AND name='milBimIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosBimestresIniciais].[milBimIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniIxAk] >>>'
  CREATE UNIQUE INDEX [milBimIniIxAk]
    ON [cal].[mileniosBimestresIniciais]
    (
      [bimId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosBimestresIniciais') AND name='milBimIniIxFkBim')
  BEGIN
    DROP INDEX [cal].[mileniosBimestresIniciais].[milBimIniIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milBimIniIxFkBim]
    ON [cal].[mileniosBimestresIniciais]
    (
      [bimId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniFkBim] >>>'
  ALTER TABLE [cal].[mileniosBimestresIniciais]
    ADD CONSTRAINT [milBimIniFkBim]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosBimestresIniciais') AND name='milBimIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosBimestresIniciais].[milBimIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milBimIniIxFkMil]
    ON [cal].[mileniosBimestresIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosBimestresIniciais].[milBimIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosBimestresIniciais]
    ADD CONSTRAINT [milBimIniFkMil]
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

/*
* TABELA: [DataCorp].[cal].[mileniosSemestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniFkSem] >>>'
  IF OBJECT_ID('[cal].[milSmtIniFkSem]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemestresIniciais]
      DROP CONSTRAINT [milSmtIniFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milSmtIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemestresIniciais]
      DROP CONSTRAINT [milSmtIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSemestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSemestresIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosSemestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSemestresIniciais]
  (

    [milSmtIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSemestresIniciaismilSmtIniIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [mileniosSemestresIniciaissmtIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSemestresIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniPk] >>>'
  ALTER TABLE [cal].[mileniosSemestresIniciais]
    ADD CONSTRAINT [milSmtIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milSmtIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemestresIniciais') AND name='milSmtIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSemestresIniciais].[milSmtIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniIxAk] >>>'
  CREATE UNIQUE INDEX [milSmtIniIxAk]
    ON [cal].[mileniosSemestresIniciais]
    (
      [smtId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemestresIniciais') AND name='milSmtIniIxFkSem')
  BEGIN
    DROP INDEX [cal].[mileniosSemestresIniciais].[milSmtIniIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSmtIniIxFkSem]
    ON [cal].[mileniosSemestresIniciais]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniFkSem] >>>'
  ALTER TABLE [cal].[mileniosSemestresIniciais]
    ADD CONSTRAINT [milSmtIniFkSem]
    FOREIGN KEY
    (
      [smtId]
    )
    REFERENCES [DataCorp].[cal].[semestres]
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemestresIniciais') AND name='milSmtIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSemestresIniciais].[milSmtIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSmtIniIxFkMil]
    ON [cal].[mileniosSemestresIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresIniciais].[milSmtIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosSemestresIniciais]
    ADD CONSTRAINT [milSmtIniFkMil]
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

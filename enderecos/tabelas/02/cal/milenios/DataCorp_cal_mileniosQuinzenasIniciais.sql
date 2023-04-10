/*
* TABELA: [DataCorp].[cal].[mileniosQuinzenasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniFkQui] >>>'
  IF OBJECT_ID('[cal].[milQuiIniFkQui]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuinzenasIniciais]
      DROP CONSTRAINT [milQuiIniFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milQuiIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuinzenasIniciais]
      DROP CONSTRAINT [milQuiIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosQuinzenasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosQuinzenasIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosQuinzenasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosQuinzenasIniciais]
  (

    [milQuiIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosQuinzenasIniciaismilQuiIniIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [mileniosQuinzenasIniciaisquiIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosQuinzenasIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniPk] >>>'
  ALTER TABLE [cal].[mileniosQuinzenasIniciais]
    ADD CONSTRAINT [milQuiIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milQuiIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuinzenasIniciais') AND name='milQuiIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosQuinzenasIniciais].[milQuiIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniIxAk] >>>'
  CREATE UNIQUE INDEX [milQuiIniIxAk]
    ON [cal].[mileniosQuinzenasIniciais]
    (
      [quiId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuinzenasIniciais') AND name='milQuiIniIxFkQui')
  BEGIN
    DROP INDEX [cal].[mileniosQuinzenasIniciais].[milQuiIniIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milQuiIniIxFkQui]
    ON [cal].[mileniosQuinzenasIniciais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniFkQui] >>>'
  ALTER TABLE [cal].[mileniosQuinzenasIniciais]
    ADD CONSTRAINT [milQuiIniFkQui]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuinzenasIniciais') AND name='milQuiIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosQuinzenasIniciais].[milQuiIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milQuiIniIxFkMil]
    ON [cal].[mileniosQuinzenasIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasIniciais].[milQuiIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosQuinzenasIniciais]
    ADD CONSTRAINT [milQuiIniFkMil]
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

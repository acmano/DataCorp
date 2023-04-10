/*
* TABELA: [DataCorp].[cal].[mileniosSeculosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniFkSec] >>>'
  IF OBJECT_ID('[cal].[milSecIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSeculosIniciais]
      DROP CONSTRAINT [milSecIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milSecIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSeculosIniciais]
      DROP CONSTRAINT [milSecIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSeculosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSeculosIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosSeculosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSeculosIniciais]
  (

    [milSecIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSeculosIniciaismilSecIniIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [mileniosSeculosIniciaissecIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSeculosIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniPk] >>>'
  ALTER TABLE [cal].[mileniosSeculosIniciais]
    ADD CONSTRAINT [milSecIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milSecIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSeculosIniciais') AND name='milSecIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSeculosIniciais].[milSecIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniIxAk] >>>'
  CREATE UNIQUE INDEX [milSecIniIxAk]
    ON [cal].[mileniosSeculosIniciais]
    (
      [secId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSeculosIniciais') AND name='milSecIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[mileniosSeculosIniciais].[milSecIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSecIniIxFkSec]
    ON [cal].[mileniosSeculosIniciais]
    (
      [secId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniFkSec] >>>'
  ALTER TABLE [cal].[mileniosSeculosIniciais]
    ADD CONSTRAINT [milSecIniFkSec]
    FOREIGN KEY
    (
      [secId]
    )
    REFERENCES [DataCorp].[cal].[seculos]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSeculosIniciais') AND name='milSecIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSeculosIniciais].[milSecIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSecIniIxFkMil]
    ON [cal].[mileniosSeculosIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosIniciais].[milSecIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosSeculosIniciais]
    ADD CONSTRAINT [milSecIniFkMil]
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

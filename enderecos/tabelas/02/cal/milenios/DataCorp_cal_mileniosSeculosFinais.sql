/*
* TABELA: [DataCorp].[cal].[mileniosSeculosFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinFkSec] >>>'
  IF OBJECT_ID('[cal].[milSecFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSeculosFinais]
      DROP CONSTRAINT [milSecFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milSecFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSeculosFinais]
      DROP CONSTRAINT [milSecFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSeculosFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSeculosFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosSeculosFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSeculosFinais]
  (

    [milSecFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSeculosFinaismilSecFinIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [mileniosSeculosFinaissecIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSeculosFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinPk] >>>'
  ALTER TABLE [cal].[mileniosSeculosFinais]
    ADD CONSTRAINT [milSecFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milSecFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSeculosFinais') AND name='milSecFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSeculosFinais].[milSecFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinIxAk] >>>'
  CREATE UNIQUE INDEX [milSecFinIxAk]
    ON [cal].[mileniosSeculosFinais]
    (
      [secId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSeculosFinais') AND name='milSecFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[mileniosSeculosFinais].[milSecFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSecFinIxFkSec]
    ON [cal].[mileniosSeculosFinais]
    (
      [secId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinFkSec] >>>'
  ALTER TABLE [cal].[mileniosSeculosFinais]
    ADD CONSTRAINT [milSecFinFkSec]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSeculosFinais') AND name='milSecFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSeculosFinais].[milSecFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSecFinIxFkMil]
    ON [cal].[mileniosSeculosFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSeculosFinais].[milSecFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosSeculosFinais]
    ADD CONSTRAINT [milSecFinFkMil]
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

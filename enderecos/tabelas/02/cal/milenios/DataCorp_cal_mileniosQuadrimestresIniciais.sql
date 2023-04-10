/*
* TABELA: [DataCorp].[cal].[mileniosQuadrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniFkQua] >>>'
  IF OBJECT_ID('[cal].[milQuaIniFkQua]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuadrimestresIniciais]
      DROP CONSTRAINT [milQuaIniFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milQuaIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuadrimestresIniciais]
      DROP CONSTRAINT [milQuaIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosQuadrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosQuadrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosQuadrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosQuadrimestresIniciais]
  (

    [milQuaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosQuadrimestresIniciaismilQuaIniIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [mileniosQuadrimestresIniciaisquaIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosQuadrimestresIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniPk] >>>'
  ALTER TABLE [cal].[mileniosQuadrimestresIniciais]
    ADD CONSTRAINT [milQuaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milQuaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuadrimestresIniciais') AND name='milQuaIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosQuadrimestresIniciais].[milQuaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniIxAk] >>>'
  CREATE UNIQUE INDEX [milQuaIniIxAk]
    ON [cal].[mileniosQuadrimestresIniciais]
    (
      [quaId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuadrimestresIniciais') AND name='milQuaIniIxFkQua')
  BEGIN
    DROP INDEX [cal].[mileniosQuadrimestresIniciais].[milQuaIniIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milQuaIniIxFkQua]
    ON [cal].[mileniosQuadrimestresIniciais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniFkQua] >>>'
  ALTER TABLE [cal].[mileniosQuadrimestresIniciais]
    ADD CONSTRAINT [milQuaIniFkQua]
    FOREIGN KEY
    (
      [quaId]
    )
    REFERENCES [DataCorp].[cal].[quadrimestres]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuadrimestresIniciais') AND name='milQuaIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosQuadrimestresIniciais].[milQuaIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milQuaIniIxFkMil]
    ON [cal].[mileniosQuadrimestresIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresIniciais].[milQuaIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosQuadrimestresIniciais]
    ADD CONSTRAINT [milQuaIniFkMil]
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

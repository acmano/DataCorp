/*
* TABELA: [DataCorp].[cal].[mileniosQuadrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinFkQua] >>>'
  IF OBJECT_ID('[cal].[milQuaFinFkQua]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuadrimestresFinais]
      DROP CONSTRAINT [milQuaFinFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milQuaFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuadrimestresFinais]
      DROP CONSTRAINT [milQuaFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosQuadrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosQuadrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosQuadrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosQuadrimestresFinais]
  (

    [milQuaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosQuadrimestresFinaismilQuaFinIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [mileniosQuadrimestresFinaisquaIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosQuadrimestresFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinPk] >>>'
  ALTER TABLE [cal].[mileniosQuadrimestresFinais]
    ADD CONSTRAINT [milQuaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milQuaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuadrimestresFinais') AND name='milQuaFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosQuadrimestresFinais].[milQuaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinIxAk] >>>'
  CREATE UNIQUE INDEX [milQuaFinIxAk]
    ON [cal].[mileniosQuadrimestresFinais]
    (
      [quaId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuadrimestresFinais') AND name='milQuaFinIxFkQua')
  BEGIN
    DROP INDEX [cal].[mileniosQuadrimestresFinais].[milQuaFinIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milQuaFinIxFkQua]
    ON [cal].[mileniosQuadrimestresFinais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinFkQua] >>>'
  ALTER TABLE [cal].[mileniosQuadrimestresFinais]
    ADD CONSTRAINT [milQuaFinFkQua]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuadrimestresFinais') AND name='milQuaFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosQuadrimestresFinais].[milQuaFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milQuaFinIxFkMil]
    ON [cal].[mileniosQuadrimestresFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuadrimestresFinais].[milQuaFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosQuadrimestresFinais]
    ADD CONSTRAINT [milQuaFinFkMil]
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

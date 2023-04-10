/*
* TABELA: [DataCorp].[cal].[mileniosQuinzenasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinFkQui] >>>'
  IF OBJECT_ID('[cal].[milQuiFinFkQui]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuinzenasFinais]
      DROP CONSTRAINT [milQuiFinFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milQuiFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosQuinzenasFinais]
      DROP CONSTRAINT [milQuiFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosQuinzenasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosQuinzenasFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosQuinzenasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosQuinzenasFinais]
  (

    [milQuiFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosQuinzenasFinaismilQuiFinIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [mileniosQuinzenasFinaisquiIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosQuinzenasFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinPk] >>>'
  ALTER TABLE [cal].[mileniosQuinzenasFinais]
    ADD CONSTRAINT [milQuiFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milQuiFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuinzenasFinais') AND name='milQuiFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosQuinzenasFinais].[milQuiFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinIxAk] >>>'
  CREATE UNIQUE INDEX [milQuiFinIxAk]
    ON [cal].[mileniosQuinzenasFinais]
    (
      [quiId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuinzenasFinais') AND name='milQuiFinIxFkQui')
  BEGIN
    DROP INDEX [cal].[mileniosQuinzenasFinais].[milQuiFinIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milQuiFinIxFkQui]
    ON [cal].[mileniosQuinzenasFinais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinFkQui] >>>'
  ALTER TABLE [cal].[mileniosQuinzenasFinais]
    ADD CONSTRAINT [milQuiFinFkQui]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosQuinzenasFinais') AND name='milQuiFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosQuinzenasFinais].[milQuiFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milQuiFinIxFkMil]
    ON [cal].[mileniosQuinzenasFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosQuinzenasFinais].[milQuiFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosQuinzenasFinais]
    ADD CONSTRAINT [milQuiFinFkMil]
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

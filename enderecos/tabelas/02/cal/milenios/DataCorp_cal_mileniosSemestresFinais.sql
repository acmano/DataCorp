/*
* TABELA: [DataCorp].[cal].[mileniosSemestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinFkSem] >>>'
  IF OBJECT_ID('[cal].[milSmtFinFkSem]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemestresFinais]
      DROP CONSTRAINT [milSmtFinFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milSmtFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemestresFinais]
      DROP CONSTRAINT [milSmtFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSemestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSemestresFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosSemestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSemestresFinais]
  (

    [milSmtFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSemestresFinaismilSmtFinIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [mileniosSemestresFinaissmtIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSemestresFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinPk] >>>'
  ALTER TABLE [cal].[mileniosSemestresFinais]
    ADD CONSTRAINT [milSmtFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milSmtFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemestresFinais') AND name='milSmtFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSemestresFinais].[milSmtFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinIxAk] >>>'
  CREATE UNIQUE INDEX [milSmtFinIxAk]
    ON [cal].[mileniosSemestresFinais]
    (
      [smtId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemestresFinais') AND name='milSmtFinIxFkSem')
  BEGIN
    DROP INDEX [cal].[mileniosSemestresFinais].[milSmtFinIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSmtFinIxFkSem]
    ON [cal].[mileniosSemestresFinais]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinFkSem] >>>'
  ALTER TABLE [cal].[mileniosSemestresFinais]
    ADD CONSTRAINT [milSmtFinFkSem]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemestresFinais') AND name='milSmtFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSemestresFinais].[milSmtFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSmtFinIxFkMil]
    ON [cal].[mileniosSemestresFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemestresFinais].[milSmtFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosSemestresFinais]
    ADD CONSTRAINT [milSmtFinFkMil]
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

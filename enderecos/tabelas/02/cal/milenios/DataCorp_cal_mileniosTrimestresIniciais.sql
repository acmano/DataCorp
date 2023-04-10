/*
* TABELA: [DataCorp].[cal].[mileniosTrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniFkTri] >>>'
  IF OBJECT_ID('[cal].[milTriIniFkTri]') IS NOT NULL
    ALTER TABLE [cal].[mileniosTrimestresIniciais]
      DROP CONSTRAINT [milTriIniFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milTriIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosTrimestresIniciais]
      DROP CONSTRAINT [milTriIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosTrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosTrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosTrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosTrimestresIniciais]
  (

    [milTriIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosTrimestresIniciaismilTriIniIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [mileniosTrimestresIniciaistriIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosTrimestresIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniPk] >>>'
  ALTER TABLE [cal].[mileniosTrimestresIniciais]
    ADD CONSTRAINT [milTriIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milTriIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosTrimestresIniciais') AND name='milTriIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosTrimestresIniciais].[milTriIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniIxAk] >>>'
  CREATE UNIQUE INDEX [milTriIniIxAk]
    ON [cal].[mileniosTrimestresIniciais]
    (
      [triId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosTrimestresIniciais') AND name='milTriIniIxFkTri')
  BEGIN
    DROP INDEX [cal].[mileniosTrimestresIniciais].[milTriIniIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milTriIniIxFkTri]
    ON [cal].[mileniosTrimestresIniciais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniFkTri] >>>'
  ALTER TABLE [cal].[mileniosTrimestresIniciais]
    ADD CONSTRAINT [milTriIniFkTri]
    FOREIGN KEY
    (
      [triId]
    )
    REFERENCES [DataCorp].[cal].[trimestres]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosTrimestresIniciais') AND name='milTriIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosTrimestresIniciais].[milTriIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milTriIniIxFkMil]
    ON [cal].[mileniosTrimestresIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosTrimestresIniciais].[milTriIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosTrimestresIniciais]
    ADD CONSTRAINT [milTriIniFkMil]
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

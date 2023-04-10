/*
* TABELA: [DataCorp].[cal].[anosTrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniFkTri] >>>'
  IF OBJECT_ID('[cal].[anoTriIniFkTri]') IS NOT NULL
    ALTER TABLE [cal].[anosTrimestresIniciais]
      DROP CONSTRAINT [anoTriIniFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniFkAno] >>>'
  IF OBJECT_ID('[cal].[anoTriIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosTrimestresIniciais]
      DROP CONSTRAINT [anoTriIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosTrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosTrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[anosTrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosTrimestresIniciais]
  (

    [anoTriIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosTrimestresIniciaisanoTriIniIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [anosTrimestresIniciaistriIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosTrimestresIniciaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniPk] >>>'
  ALTER TABLE [cal].[anosTrimestresIniciais]
    ADD CONSTRAINT [anoTriIniPk]
      PRIMARY KEY CLUSTERED
      (
        [anoTriIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosTrimestresIniciais') AND name='anoTriIniIxAk')
  BEGIN
    DROP INDEX [cal].[anosTrimestresIniciais].[anoTriIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniIxAk] >>>'
  CREATE UNIQUE INDEX [anoTriIniIxAk]
    ON [cal].[anosTrimestresIniciais]
    (
      [triId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosTrimestresIniciais') AND name='anoTriIniIxFkTri')
  BEGIN
    DROP INDEX [cal].[anosTrimestresIniciais].[anoTriIniIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoTriIniIxFkTri]
    ON [cal].[anosTrimestresIniciais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniFkTri] >>>'
  ALTER TABLE [cal].[anosTrimestresIniciais]
    ADD CONSTRAINT [anoTriIniFkTri]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosTrimestresIniciais') AND name='anoTriIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosTrimestresIniciais].[anoTriIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoTriIniIxFkAno]
    ON [cal].[anosTrimestresIniciais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosTrimestresIniciais].[anoTriIniFkAno] >>>'
  ALTER TABLE [cal].[anosTrimestresIniciais]
    ADD CONSTRAINT [anoTriIniFkAno]
    FOREIGN KEY
    (
      [anoId]
    )
    REFERENCES [DataCorp].[cal].[anos]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

/*
* TABELA: [DataCorp].[cal].[mesesDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[mesDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[mesesDatasIniciais]
      DROP CONSTRAINT [mesDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniFkMes] >>>'
  IF OBJECT_ID('[cal].[mesDatIniFkMes]') IS NOT NULL
    ALTER TABLE [cal].[mesesDatasIniciais]
      DROP CONSTRAINT [mesDatIniFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mesesDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mesesDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[mesesDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mesesDatasIniciais]
  (

    [mesDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mesesDatasIniciaismesDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [mesesDatasIniciaisdatIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [mesesDatasIniciaismesIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniPk] >>>'
  ALTER TABLE [cal].[mesesDatasIniciais]
    ADD CONSTRAINT [mesDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [mesDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesDatasIniciais') AND name='mesDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[mesesDatasIniciais].[mesDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [mesDatIniIxAk]
    ON [cal].[mesesDatasIniciais]
    (
      [datId]
    , [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesDatasIniciais') AND name='mesDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[mesesDatasIniciais].[mesDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [mesDatIniIxFkDat]
    ON [cal].[mesesDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniFkDat] >>>'
  ALTER TABLE [cal].[mesesDatasIniciais]
    ADD CONSTRAINT [mesDatIniFkDat]
    FOREIGN KEY
    (
      [datId]
    )
    REFERENCES [DataCorp].[cal].[datas]
    (
      [datId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mesesDatasIniciais') AND name='mesDatIniIxFkMes')
  BEGIN
    DROP INDEX [cal].[mesesDatasIniciais].[mesDatIniIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [mesDatIniIxFkMes]
    ON [cal].[mesesDatasIniciais]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mesesDatasIniciais].[mesDatIniFkMes] >>>'
  ALTER TABLE [cal].[mesesDatasIniciais]
    ADD CONSTRAINT [mesDatIniFkMes]
    FOREIGN KEY
    (
      [mesId]
    )
    REFERENCES [DataCorp].[cal].[meses]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

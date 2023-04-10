/*
* TABELA: [DataCorp].[cal].[trimestresDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[triDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[trimestresDatasIniciais]
      DROP CONSTRAINT [triDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniFkTri] >>>'
  IF OBJECT_ID('[cal].[triDatIniFkTri]') IS NOT NULL
    ALTER TABLE [cal].[trimestresDatasIniciais]
      DROP CONSTRAINT [triDatIniFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[trimestresDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'trimestresDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[trimestresDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[trimestresDatasIniciais]
  (

    [triDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [trimestresDatasIniciaistriDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [trimestresDatasIniciaisdatIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [trimestresDatasIniciaistriIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniPk] >>>'
  ALTER TABLE [cal].[trimestresDatasIniciais]
    ADD CONSTRAINT [triDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [triDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresDatasIniciais') AND name='triDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[trimestresDatasIniciais].[triDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [triDatIniIxAk]
    ON [cal].[trimestresDatasIniciais]
    (
      [datId]
    , [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresDatasIniciais') AND name='triDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[trimestresDatasIniciais].[triDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [triDatIniIxFkDat]
    ON [cal].[trimestresDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniFkDat] >>>'
  ALTER TABLE [cal].[trimestresDatasIniciais]
    ADD CONSTRAINT [triDatIniFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.trimestresDatasIniciais') AND name='triDatIniIxFkTri')
  BEGIN
    DROP INDEX [cal].[trimestresDatasIniciais].[triDatIniIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [triDatIniIxFkTri]
    ON [cal].[trimestresDatasIniciais]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[trimestresDatasIniciais].[triDatIniFkTri] >>>'
  ALTER TABLE [cal].[trimestresDatasIniciais]
    ADD CONSTRAINT [triDatIniFkTri]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

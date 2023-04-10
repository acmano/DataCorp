/*
* TABELA: [DataCorp].[cal].[mileniosDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[milDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDatasIniciais]
      DROP CONSTRAINT [milDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milDatIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosDatasIniciais]
      DROP CONSTRAINT [milDatIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosDatasIniciais]
  (

    [milDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosDatasIniciaisMilDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [mileniosDatasIniciaisDatIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosDatasIniciaisMilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniPk] >>>'
  ALTER TABLE [cal].[mileniosDatasIniciais]
    ADD CONSTRAINT [milDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDatasIniciais') AND name='milDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosDatasIniciais].[milDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [milDatIniIxAk]
    ON [cal].[mileniosDatasIniciais]
    (
      [datId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDatasIniciais') AND name='milDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[mileniosDatasIniciais].[milDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milDatIniIxFkDat]
    ON [cal].[mileniosDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniFkDat] >>>'
  ALTER TABLE [cal].[mileniosDatasIniciais]
    ADD CONSTRAINT [milDatIniFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosDatasIniciais') AND name='milDatIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosDatasIniciais].[milDatIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milDatIniIxFkMil]
    ON [cal].[mileniosDatasIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosDatasIniciais].[milDatIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosDatasIniciais]
    ADD CONSTRAINT [milDatIniFkMil]
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

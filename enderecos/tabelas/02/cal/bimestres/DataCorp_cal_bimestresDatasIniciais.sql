/*
* TABELA: [DataCorp].[cal].[bimestresDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[bimDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[bimestresDatasIniciais]
      DROP CONSTRAINT [bimDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniFkBim] >>>'
  IF OBJECT_ID('[cal].[bimDatIniFkBim]') IS NOT NULL
    ALTER TABLE [cal].[bimestresDatasIniciais]
      DROP CONSTRAINT [bimDatIniFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[bimestresDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'bimestresDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[bimestresDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[bimestresDatasIniciais]
  (

    [bimDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [bimestresDatasIniciaisbimDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [bimestresDatasIniciaisdatIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [bimestresDatasIniciaisbimIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniPk] >>>'
  ALTER TABLE [cal].[bimestresDatasIniciais]
    ADD CONSTRAINT [bimDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [bimDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresDatasIniciais') AND name='bimDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[bimestresDatasIniciais].[bimDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [bimDatIniIxAk]
    ON [cal].[bimestresDatasIniciais]
    (
      [datId]
    , [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresDatasIniciais') AND name='bimDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[bimestresDatasIniciais].[bimDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [bimDatIniIxFkDat]
    ON [cal].[bimestresDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniFkDat] >>>'
  ALTER TABLE [cal].[bimestresDatasIniciais]
    ADD CONSTRAINT [bimDatIniFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresDatasIniciais') AND name='bimDatIniIxFkBim')
  BEGIN
    DROP INDEX [cal].[bimestresDatasIniciais].[bimDatIniIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [bimDatIniIxFkBim]
    ON [cal].[bimestresDatasIniciais]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresDatasIniciais].[bimDatIniFkBim] >>>'
  ALTER TABLE [cal].[bimestresDatasIniciais]
    ADD CONSTRAINT [bimDatIniFkBim]
    FOREIGN KEY
    (
      [bimId]
    )
    REFERENCES [DataCorp].[cal].[bimestres]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

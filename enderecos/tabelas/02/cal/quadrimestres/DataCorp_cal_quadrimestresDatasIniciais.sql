/*
* TABELA: [DataCorp].[cal].[quadrimestresDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[quaDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[quadrimestresDatasIniciais]
      DROP CONSTRAINT [quaDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniFkQua] >>>'
  IF OBJECT_ID('[cal].[quaDatIniFkQua]') IS NOT NULL
    ALTER TABLE [cal].[quadrimestresDatasIniciais]
      DROP CONSTRAINT [quaDatIniFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[quadrimestresDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'quadrimestresDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[quadrimestresDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[quadrimestresDatasIniciais]
  (

    [quaDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [quadrimestresDatasIniciaisquaDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [quadrimestresDatasIniciaisdatIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [quadrimestresDatasIniciaisquaIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniPk] >>>'
  ALTER TABLE [cal].[quadrimestresDatasIniciais]
    ADD CONSTRAINT [quaDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [quaDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresDatasIniciais') AND name='quaDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[quadrimestresDatasIniciais].[quaDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [quaDatIniIxAk]
    ON [cal].[quadrimestresDatasIniciais]
    (
      [datId]
    , [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresDatasIniciais') AND name='quaDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[quadrimestresDatasIniciais].[quaDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [quaDatIniIxFkDat]
    ON [cal].[quadrimestresDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniFkDat] >>>'
  ALTER TABLE [cal].[quadrimestresDatasIniciais]
    ADD CONSTRAINT [quaDatIniFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresDatasIniciais') AND name='quaDatIniIxFkQua')
  BEGIN
    DROP INDEX [cal].[quadrimestresDatasIniciais].[quaDatIniIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [quaDatIniIxFkQua]
    ON [cal].[quadrimestresDatasIniciais]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasIniciais].[quaDatIniFkQua] >>>'
  ALTER TABLE [cal].[quadrimestresDatasIniciais]
    ADD CONSTRAINT [quaDatIniFkQua]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

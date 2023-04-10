/*
* TABELA: [DataCorp].[cal].[quadrimestresDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[quaDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[quadrimestresDatasFinais]
      DROP CONSTRAINT [quaDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinFkQua] >>>'
  IF OBJECT_ID('[cal].[quaDatFinFkQua]') IS NOT NULL
    ALTER TABLE [cal].[quadrimestresDatasFinais]
      DROP CONSTRAINT [quaDatFinFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[quadrimestresDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'quadrimestresDatasFinais' )
  BEGIN
    DROP TABLE [cal].[quadrimestresDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[quadrimestresDatasFinais]
  (

    [quaDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [quadrimestresDatasFinaisquaDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [quadrimestresDatasFinaisdatIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [quadrimestresDatasFinaisquaIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinPk] >>>'
  ALTER TABLE [cal].[quadrimestresDatasFinais]
    ADD CONSTRAINT [quaDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [quaDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresDatasFinais') AND name='quaDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[quadrimestresDatasFinais].[quaDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [quaDatFinIxAk]
    ON [cal].[quadrimestresDatasFinais]
    (
      [datId]
    , [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresDatasFinais') AND name='quaDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[quadrimestresDatasFinais].[quaDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [quaDatFinIxFkDat]
    ON [cal].[quadrimestresDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinFkDat] >>>'
  ALTER TABLE [cal].[quadrimestresDatasFinais]
    ADD CONSTRAINT [quaDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresDatasFinais') AND name='quaDatFinIxFkQua')
  BEGIN
    DROP INDEX [cal].[quadrimestresDatasFinais].[quaDatFinIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [quaDatFinIxFkQua]
    ON [cal].[quadrimestresDatasFinais]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresDatasFinais].[quaDatFinFkQua] >>>'
  ALTER TABLE [cal].[quadrimestresDatasFinais]
    ADD CONSTRAINT [quaDatFinFkQua]
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

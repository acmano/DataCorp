/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniFkTri] >>>'
  IF OBJECT_ID('[cal].[decOrdTriIniFkTri]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisTrimestresIniciais]
      DROP CONSTRAINT [decOrdTriIniFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdTriIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisTrimestresIniciais]
      DROP CONSTRAINT [decOrdTriIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisTrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisTrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisTrimestresIniciais]
  (

    [decOrdTriIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisTrimestresIniciaisdecOrdTriIniIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisTrimestresIniciaistriIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisTrimestresIniciaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisTrimestresIniciais]
    ADD CONSTRAINT [decOrdTriIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdTriIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisTrimestresIniciais') AND name='decOrdTriIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdTriIniIxAk]
    ON [cal].[decendiosOrdinaisTrimestresIniciais]
    (
      [triId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisTrimestresIniciais') AND name='decOrdTriIniIxFkTri')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdTriIniIxFkTri]
    ON [cal].[decendiosOrdinaisTrimestresIniciais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniFkTri] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisTrimestresIniciais]
    ADD CONSTRAINT [decOrdTriIniFkTri]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisTrimestresIniciais') AND name='decOrdTriIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdTriIniIxFkDecOrd]
    ON [cal].[decendiosOrdinaisTrimestresIniciais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisTrimestresIniciais].[decOrdTriIniFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisTrimestresIniciais]
    ADD CONSTRAINT [decOrdTriIniFkDecOrd]
    FOREIGN KEY
    (
      [decOrdId]
    )
    REFERENCES [DataCorp].[cal].[decendiosOrdinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniFkQua] >>>'
  IF OBJECT_ID('[cal].[decOrdQuaIniFkQua]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresIniciais]
      DROP CONSTRAINT [decOrdQuaIniFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdQuaIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresIniciais]
      DROP CONSTRAINT [decOrdQuaIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisQuadrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisQuadrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisQuadrimestresIniciais]
  (

    [decOrdQuaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisQuadrimestresIniciaisdecOrdQuaIniIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuadrimestresIniciaisquaIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisQuadrimestresIniciaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresIniciais]
    ADD CONSTRAINT [decOrdQuaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdQuaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuadrimestresIniciais') AND name='decOrdQuaIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdQuaIniIxAk]
    ON [cal].[decendiosOrdinaisQuadrimestresIniciais]
    (
      [quaId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuadrimestresIniciais') AND name='decOrdQuaIniIxFkQua')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdQuaIniIxFkQua]
    ON [cal].[decendiosOrdinaisQuadrimestresIniciais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniFkQua] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresIniciais]
    ADD CONSTRAINT [decOrdQuaIniFkQua]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisQuadrimestresIniciais') AND name='decOrdQuaIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdQuaIniIxFkDecOrd]
    ON [cal].[decendiosOrdinaisQuadrimestresIniciais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisQuadrimestresIniciais].[decOrdQuaIniFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisQuadrimestresIniciais]
    ADD CONSTRAINT [decOrdQuaIniFkDecOrd]
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

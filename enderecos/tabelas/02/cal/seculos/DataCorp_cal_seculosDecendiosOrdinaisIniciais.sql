/*
* TABELA: [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[secDecOrdIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosOrdinaisIniciais]
      DROP CONSTRAINT [secDecOrdIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secDecOrdIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosOrdinaisIniciais]
      DROP CONSTRAINT [secDecOrdIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosDecendiosOrdinaisIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosDecendiosOrdinaisIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosDecendiosOrdinaisIniciais]
  (

    [secDecOrdIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosDecendiosOrdinaisIniciaissecDecOrdIniIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [seculosDecendiosOrdinaisIniciaisdecOrdIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosDecendiosOrdinaisIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniPk] >>>'
  ALTER TABLE [cal].[seculosDecendiosOrdinaisIniciais]
    ADD CONSTRAINT [secDecOrdIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secDecOrdIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosOrdinaisIniciais') AND name='secDecOrdIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniIxAk] >>>'
  CREATE UNIQUE INDEX [secDecOrdIniIxAk]
    ON [cal].[seculosDecendiosOrdinaisIniciais]
    (
      [decOrdId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosOrdinaisIniciais') AND name='secDecOrdIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secDecOrdIniIxFkDecOrd]
    ON [cal].[seculosDecendiosOrdinaisIniciais]
    (
      [decOrdId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniFkDecOrd] >>>'
  ALTER TABLE [cal].[seculosDecendiosOrdinaisIniciais]
    ADD CONSTRAINT [secDecOrdIniFkDecOrd]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosOrdinaisIniciais') AND name='secDecOrdIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secDecOrdIniIxFkSec]
    ON [cal].[seculosDecendiosOrdinaisIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisIniciais].[secDecOrdIniFkSec] >>>'
  ALTER TABLE [cal].[seculosDecendiosOrdinaisIniciais]
    ADD CONSTRAINT [secDecOrdIniFkSec]
    FOREIGN KEY
    (
      [secId]
    )
    REFERENCES [DataCorp].[cal].[seculos]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

/*
* TABELA: [DataCorp].[cal].[seculosDecendiosOrdinaisFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[secDecOrdFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosOrdinaisFinais]
      DROP CONSTRAINT [secDecOrdFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secDecOrdFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosOrdinaisFinais]
      DROP CONSTRAINT [secDecOrdFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosDecendiosOrdinaisFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosDecendiosOrdinaisFinais' )
  BEGIN
    DROP TABLE [cal].[seculosDecendiosOrdinaisFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosDecendiosOrdinaisFinais]
  (

    [secDecOrdFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosDecendiosOrdinaisFinaissecDecOrdFinIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [seculosDecendiosOrdinaisFinaisdecOrdIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosDecendiosOrdinaisFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinPk] >>>'
  ALTER TABLE [cal].[seculosDecendiosOrdinaisFinais]
    ADD CONSTRAINT [secDecOrdFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secDecOrdFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosOrdinaisFinais') AND name='secDecOrdFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinIxAk] >>>'
  CREATE UNIQUE INDEX [secDecOrdFinIxAk]
    ON [cal].[seculosDecendiosOrdinaisFinais]
    (
      [decOrdId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosOrdinaisFinais') AND name='secDecOrdFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secDecOrdFinIxFkDecOrd]
    ON [cal].[seculosDecendiosOrdinaisFinais]
    (
      [decOrdId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinFkDecOrd] >>>'
  ALTER TABLE [cal].[seculosDecendiosOrdinaisFinais]
    ADD CONSTRAINT [secDecOrdFinFkDecOrd]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosOrdinaisFinais') AND name='secDecOrdFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secDecOrdFinIxFkSec]
    ON [cal].[seculosDecendiosOrdinaisFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosOrdinaisFinais].[secDecOrdFinFkSec] >>>'
  ALTER TABLE [cal].[seculosDecendiosOrdinaisFinais]
    ADD CONSTRAINT [secDecOrdFinFkSec]
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

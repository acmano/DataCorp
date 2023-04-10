/*
* TABELA: [DataCorp].[cal].[seculosTrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinFkTri] >>>'
  IF OBJECT_ID('[cal].[secTriFinFkTri]') IS NOT NULL
    ALTER TABLE [cal].[seculosTrimestresFinais]
      DROP CONSTRAINT [secTriFinFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secTriFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosTrimestresFinais]
      DROP CONSTRAINT [secTriFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosTrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosTrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[seculosTrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosTrimestresFinais]
  (

    [secTriFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosTrimestresFinaissecTriFinIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [seculosTrimestresFinaistriIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosTrimestresFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinPk] >>>'
  ALTER TABLE [cal].[seculosTrimestresFinais]
    ADD CONSTRAINT [secTriFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secTriFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosTrimestresFinais') AND name='secTriFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosTrimestresFinais].[secTriFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinIxAk] >>>'
  CREATE UNIQUE INDEX [secTriFinIxAk]
    ON [cal].[seculosTrimestresFinais]
    (
      [triId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosTrimestresFinais') AND name='secTriFinIxFkTri')
  BEGIN
    DROP INDEX [cal].[seculosTrimestresFinais].[secTriFinIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secTriFinIxFkTri]
    ON [cal].[seculosTrimestresFinais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinFkTri] >>>'
  ALTER TABLE [cal].[seculosTrimestresFinais]
    ADD CONSTRAINT [secTriFinFkTri]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosTrimestresFinais') AND name='secTriFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosTrimestresFinais].[secTriFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secTriFinIxFkSec]
    ON [cal].[seculosTrimestresFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresFinais].[secTriFinFkSec] >>>'
  ALTER TABLE [cal].[seculosTrimestresFinais]
    ADD CONSTRAINT [secTriFinFkSec]
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

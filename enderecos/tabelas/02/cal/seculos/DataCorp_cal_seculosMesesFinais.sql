/*
* TABELA: [DataCorp].[cal].[seculosMesesFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosMesesFinais].[secMesFinFkMes] >>>'
  IF OBJECT_ID('[cal].[secMesFinFkMes]') IS NOT NULL
    ALTER TABLE [cal].[seculosMesesFinais]
      DROP CONSTRAINT [secMesFinFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosMesesFinais].[secMesFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secMesFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosMesesFinais]
      DROP CONSTRAINT [secMesFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosMesesFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosMesesFinais' )
  BEGIN
    DROP TABLE [cal].[seculosMesesFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosMesesFinais]
  (

    [secMesFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosMesesFinaissecMesFinIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [seculosMesesFinaismesIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosMesesFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosMesesFinais].[secMesFinPk] >>>'
  ALTER TABLE [cal].[seculosMesesFinais]
    ADD CONSTRAINT [secMesFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secMesFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosMesesFinais].[secMesFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosMesesFinais') AND name='secMesFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosMesesFinais].[secMesFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosMesesFinais].[secMesFinIxAk] >>>'
  CREATE UNIQUE INDEX [secMesFinIxAk]
    ON [cal].[seculosMesesFinais]
    (
      [mesId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosMesesFinais].[secMesFinIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosMesesFinais') AND name='secMesFinIxFkMes')
  BEGIN
    DROP INDEX [cal].[seculosMesesFinais].[secMesFinIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secMesFinIxFkMes]
    ON [cal].[seculosMesesFinais]
    (
      [mesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosMesesFinais].[secMesFinFkMes] >>>'
  ALTER TABLE [cal].[seculosMesesFinais]
    ADD CONSTRAINT [secMesFinFkMes]
    FOREIGN KEY
    (
      [mesId]
    )
    REFERENCES [DataCorp].[cal].[meses]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosMesesFinais].[secMesFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosMesesFinais') AND name='secMesFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosMesesFinais].[secMesFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secMesFinIxFkSec]
    ON [cal].[seculosMesesFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosMesesFinais].[secMesFinFkSec] >>>'
  ALTER TABLE [cal].[seculosMesesFinais]
    ADD CONSTRAINT [secMesFinFkSec]
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

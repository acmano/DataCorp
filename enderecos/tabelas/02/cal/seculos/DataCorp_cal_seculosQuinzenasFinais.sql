/*
* TABELA: [DataCorp].[cal].[seculosQuinzenasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinFkQui] >>>'
  IF OBJECT_ID('[cal].[secQuiFinFkQui]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuinzenasFinais]
      DROP CONSTRAINT [secQuiFinFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secQuiFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuinzenasFinais]
      DROP CONSTRAINT [secQuiFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosQuinzenasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosQuinzenasFinais' )
  BEGIN
    DROP TABLE [cal].[seculosQuinzenasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosQuinzenasFinais]
  (

    [secQuiFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosQuinzenasFinaissecQuiFinIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [seculosQuinzenasFinaisquiIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosQuinzenasFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinPk] >>>'
  ALTER TABLE [cal].[seculosQuinzenasFinais]
    ADD CONSTRAINT [secQuiFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secQuiFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuinzenasFinais') AND name='secQuiFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosQuinzenasFinais].[secQuiFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinIxAk] >>>'
  CREATE UNIQUE INDEX [secQuiFinIxAk]
    ON [cal].[seculosQuinzenasFinais]
    (
      [quiId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuinzenasFinais') AND name='secQuiFinIxFkQui')
  BEGIN
    DROP INDEX [cal].[seculosQuinzenasFinais].[secQuiFinIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secQuiFinIxFkQui]
    ON [cal].[seculosQuinzenasFinais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinFkQui] >>>'
  ALTER TABLE [cal].[seculosQuinzenasFinais]
    ADD CONSTRAINT [secQuiFinFkQui]
    FOREIGN KEY
    (
      [quiId]
    )
    REFERENCES [DataCorp].[cal].[quinzenas]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuinzenasFinais') AND name='secQuiFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosQuinzenasFinais].[secQuiFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secQuiFinIxFkSec]
    ON [cal].[seculosQuinzenasFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuinzenasFinais].[secQuiFinFkSec] >>>'
  ALTER TABLE [cal].[seculosQuinzenasFinais]
    ADD CONSTRAINT [secQuiFinFkSec]
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

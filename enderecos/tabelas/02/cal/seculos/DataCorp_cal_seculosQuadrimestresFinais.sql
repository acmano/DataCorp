/*
* TABELA: [DataCorp].[cal].[seculosQuadrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinFkQua] >>>'
  IF OBJECT_ID('[cal].[secQuaFinFkQua]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuadrimestresFinais]
      DROP CONSTRAINT [secQuaFinFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secQuaFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuadrimestresFinais]
      DROP CONSTRAINT [secQuaFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosQuadrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosQuadrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[seculosQuadrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosQuadrimestresFinais]
  (

    [secQuaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosQuadrimestresFinaissecQuaFinIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [seculosQuadrimestresFinaisquaIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosQuadrimestresFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinPk] >>>'
  ALTER TABLE [cal].[seculosQuadrimestresFinais]
    ADD CONSTRAINT [secQuaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secQuaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuadrimestresFinais') AND name='secQuaFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosQuadrimestresFinais].[secQuaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinIxAk] >>>'
  CREATE UNIQUE INDEX [secQuaFinIxAk]
    ON [cal].[seculosQuadrimestresFinais]
    (
      [quaId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuadrimestresFinais') AND name='secQuaFinIxFkQua')
  BEGIN
    DROP INDEX [cal].[seculosQuadrimestresFinais].[secQuaFinIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secQuaFinIxFkQua]
    ON [cal].[seculosQuadrimestresFinais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinFkQua] >>>'
  ALTER TABLE [cal].[seculosQuadrimestresFinais]
    ADD CONSTRAINT [secQuaFinFkQua]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuadrimestresFinais') AND name='secQuaFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosQuadrimestresFinais].[secQuaFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secQuaFinIxFkSec]
    ON [cal].[seculosQuadrimestresFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresFinais].[secQuaFinFkSec] >>>'
  ALTER TABLE [cal].[seculosQuadrimestresFinais]
    ADD CONSTRAINT [secQuaFinFkSec]
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

/*
* TABELA: [DataCorp].[cal].[seculosQuadrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniFkQua] >>>'
  IF OBJECT_ID('[cal].[secQuaIniFkQua]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuadrimestresIniciais]
      DROP CONSTRAINT [secQuaIniFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secQuaIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosQuadrimestresIniciais]
      DROP CONSTRAINT [secQuaIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosQuadrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosQuadrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosQuadrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosQuadrimestresIniciais]
  (

    [secQuaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosQuadrimestresIniciaissecQuaIniIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [seculosQuadrimestresIniciaisquaIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosQuadrimestresIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniPk] >>>'
  ALTER TABLE [cal].[seculosQuadrimestresIniciais]
    ADD CONSTRAINT [secQuaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secQuaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuadrimestresIniciais') AND name='secQuaIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosQuadrimestresIniciais].[secQuaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniIxAk] >>>'
  CREATE UNIQUE INDEX [secQuaIniIxAk]
    ON [cal].[seculosQuadrimestresIniciais]
    (
      [quaId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuadrimestresIniciais') AND name='secQuaIniIxFkQua')
  BEGIN
    DROP INDEX [cal].[seculosQuadrimestresIniciais].[secQuaIniIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secQuaIniIxFkQua]
    ON [cal].[seculosQuadrimestresIniciais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniFkQua] >>>'
  ALTER TABLE [cal].[seculosQuadrimestresIniciais]
    ADD CONSTRAINT [secQuaIniFkQua]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosQuadrimestresIniciais') AND name='secQuaIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosQuadrimestresIniciais].[secQuaIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secQuaIniIxFkSec]
    ON [cal].[seculosQuadrimestresIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosQuadrimestresIniciais].[secQuaIniFkSec] >>>'
  ALTER TABLE [cal].[seculosQuadrimestresIniciais]
    ADD CONSTRAINT [secQuaIniFkSec]
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

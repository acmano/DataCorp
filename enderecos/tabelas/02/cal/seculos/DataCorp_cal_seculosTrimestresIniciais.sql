/*
* TABELA: [DataCorp].[cal].[seculosTrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniFkTri] >>>'
  IF OBJECT_ID('[cal].[secTriIniFkTri]') IS NOT NULL
    ALTER TABLE [cal].[seculosTrimestresIniciais]
      DROP CONSTRAINT [secTriIniFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secTriIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosTrimestresIniciais]
      DROP CONSTRAINT [secTriIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosTrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosTrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosTrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosTrimestresIniciais]
  (

    [secTriIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosTrimestresIniciaissecTriIniIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [seculosTrimestresIniciaistriIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosTrimestresIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniPk] >>>'
  ALTER TABLE [cal].[seculosTrimestresIniciais]
    ADD CONSTRAINT [secTriIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secTriIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosTrimestresIniciais') AND name='secTriIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosTrimestresIniciais].[secTriIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniIxAk] >>>'
  CREATE UNIQUE INDEX [secTriIniIxAk]
    ON [cal].[seculosTrimestresIniciais]
    (
      [triId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosTrimestresIniciais') AND name='secTriIniIxFkTri')
  BEGIN
    DROP INDEX [cal].[seculosTrimestresIniciais].[secTriIniIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secTriIniIxFkTri]
    ON [cal].[seculosTrimestresIniciais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniFkTri] >>>'
  ALTER TABLE [cal].[seculosTrimestresIniciais]
    ADD CONSTRAINT [secTriIniFkTri]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosTrimestresIniciais') AND name='secTriIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosTrimestresIniciais].[secTriIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secTriIniIxFkSec]
    ON [cal].[seculosTrimestresIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosTrimestresIniciais].[secTriIniFkSec] >>>'
  ALTER TABLE [cal].[seculosTrimestresIniciais]
    ADD CONSTRAINT [secTriIniFkSec]
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

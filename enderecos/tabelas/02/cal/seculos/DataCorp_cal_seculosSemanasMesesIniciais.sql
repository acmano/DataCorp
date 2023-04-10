/*
* TABELA: [DataCorp].[cal].[seculosSemanasMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniFkSemMes] >>>'
  IF OBJECT_ID('[cal].[secSemMesIniFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasMesesIniciais]
      DROP CONSTRAINT [secSemMesIniFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secSemMesIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasMesesIniciais]
      DROP CONSTRAINT [secSemMesIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosSemanasMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosSemanasMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosSemanasMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosSemanasMesesIniciais]
  (

    [secSemMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosSemanasMesesIniciaissecSemMesIniIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [seculosSemanasMesesIniciaissemMesIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosSemanasMesesIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniPk] >>>'
  ALTER TABLE [cal].[seculosSemanasMesesIniciais]
    ADD CONSTRAINT [secSemMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secSemMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasMesesIniciais') AND name='secSemMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosSemanasMesesIniciais].[secSemMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [secSemMesIniIxAk]
    ON [cal].[seculosSemanasMesesIniciais]
    (
      [semMesId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasMesesIniciais') AND name='secSemMesIniIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[seculosSemanasMesesIniciais].[secSemMesIniIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secSemMesIniIxFkSemMes]
    ON [cal].[seculosSemanasMesesIniciais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniFkSemMes] >>>'
  ALTER TABLE [cal].[seculosSemanasMesesIniciais]
    ADD CONSTRAINT [secSemMesIniFkSemMes]
    FOREIGN KEY
    (
      [semMesId]
    )
    REFERENCES [DataCorp].[cal].[semanasMeses]
    (
      [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasMesesIniciais') AND name='secSemMesIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosSemanasMesesIniciais].[secSemMesIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secSemMesIniIxFkSec]
    ON [cal].[seculosSemanasMesesIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesIniciais].[secSemMesIniFkSec] >>>'
  ALTER TABLE [cal].[seculosSemanasMesesIniciais]
    ADD CONSTRAINT [secSemMesIniFkSec]
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

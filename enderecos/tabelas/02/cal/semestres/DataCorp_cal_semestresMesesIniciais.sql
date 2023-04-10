/*
* TABELA: [DataCorp].[cal].[semestresMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresMesesIniciais].[semMesIniFkMes] >>>'
  IF OBJECT_ID('[cal].[semMesIniFkMes]') IS NOT NULL
    ALTER TABLE [cal].[semestresMesesIniciais]
      DROP CONSTRAINT [semMesIniFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresMesesIniciais].[semMesIniFkSem] >>>'
  IF OBJECT_ID('[cal].[semMesIniFkSem]') IS NOT NULL
    ALTER TABLE [cal].[semestresMesesIniciais]
      DROP CONSTRAINT [semMesIniFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semestresMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semestresMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[semestresMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semestresMesesIniciais]
  (

    [smtMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semestresMesesIniciaisSmtMesIniIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [semestresMesesIniciaisMesIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [semestresMesesIniciaisSmtIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semestresMesesIniciais].[smtMesIniPk] >>>'
  ALTER TABLE [cal].[semestresMesesIniciais]
    ADD CONSTRAINT [smtMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [smtMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresMesesIniciais].[semMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semestresMesesIniciais') AND name='semMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[semestresMesesIniciais].[semMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresMesesIniciais].[semMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [semMesIniIxAk]
    ON [cal].[semestresMesesIniciais]
    (
      [mesId]
    , [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresMesesIniciais].[semMesIniIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semestresMesesIniciais') AND name='semMesIniIxFkMes')
  BEGIN
    DROP INDEX [cal].[semestresMesesIniciais].[semMesIniIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [semMesIniIxFkMes]
    ON [cal].[semestresMesesIniciais]
    (
      [mesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresMesesIniciais].[semMesIniFkMes] >>>'
  ALTER TABLE [cal].[semestresMesesIniciais]
    ADD CONSTRAINT [semMesIniFkMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresMesesIniciais].[semMesIniIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semestresMesesIniciais') AND name='semMesIniIxFkSem')
  BEGIN
    DROP INDEX [cal].[semestresMesesIniciais].[semMesIniIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [semMesIniIxFkSem]
    ON [cal].[semestresMesesIniciais]
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresMesesIniciais].[semMesIniFkSem] >>>'
  ALTER TABLE [cal].[semestresMesesIniciais]
    ADD CONSTRAINT [semMesIniFkSem]
    FOREIGN KEY
    (
      [smtId]
    )
    REFERENCES [DataCorp].[cal].[semestres]
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

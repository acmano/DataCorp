/*
* TABELA: [DataCorp].[cal].[semanasMesesMeses]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesMeses].[semMesMesFkMes] >>>'
  IF OBJECT_ID('[cal].[semMesMesFkMes]') IS NOT NULL
    ALTER TABLE [cal].[semanasMesesMeses]
      DROP CONSTRAINT [semMesMesFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesMeses].[semMesMesFkSemMes] >>>'
  IF OBJECT_ID('[cal].[semMesMesFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[semanasMesesMeses]
      DROP CONSTRAINT [semMesMesFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semanasMesesMeses] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semanasMesesMeses' )
  BEGIN
    DROP TABLE [cal].[semanasMesesMeses]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semanasMesesMeses]
  (

    [semMesMesId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semanasMesesMesessemMesMesIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [semanasMesesMesesmesIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [semanasMesesMesessemMesIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semanasMesesMeses].[semMesMesPk] >>>'
  ALTER TABLE [cal].[semanasMesesMeses]
    ADD CONSTRAINT [semMesMesPk]
      PRIMARY KEY CLUSTERED
      (
        [semMesMesId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesMeses].[semMesMesIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesMeses') AND name='semMesMesIxAk')
  BEGIN
    DROP INDEX [cal].[semanasMesesMeses].[semMesMesIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesMeses].[semMesMesIxAk] >>>'
  CREATE UNIQUE INDEX [semMesMesIxAk]
    ON [cal].[semanasMesesMeses]
    (
      [mesId]
    , [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesMeses].[semMesMesIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesMeses') AND name='semMesMesIxFkMes')
  BEGIN
    DROP INDEX [cal].[semanasMesesMeses].[semMesMesIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [semMesMesIxFkMes]
    ON [cal].[semanasMesesMeses]
    (
      [mesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesMeses].[semMesMesFkMes] >>>'
  ALTER TABLE [cal].[semanasMesesMeses]
    ADD CONSTRAINT [semMesMesFkMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesMeses].[semMesMesIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesMeses') AND name='semMesMesIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[semanasMesesMeses].[semMesMesIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [semMesMesIxFkSemMes]
    ON [cal].[semanasMesesMeses]
    (
      [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesMeses].[semMesMesFkSemMes] >>>'
  ALTER TABLE [cal].[semanasMesesMeses]
    ADD CONSTRAINT [semMesMesFkSemMes]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

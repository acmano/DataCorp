/*
* TABELA: [DataCorp].[cal].[anosSemanasMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniFkSemMes] >>>'
  IF OBJECT_ID('[cal].[anoSemMesIniFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasMesesIniciais]
      DROP CONSTRAINT [anoSemMesIniFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniFkAno] >>>'
  IF OBJECT_ID('[cal].[anoSemMesIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasMesesIniciais]
      DROP CONSTRAINT [anoSemMesIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosSemanasMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosSemanasMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[anosSemanasMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosSemanasMesesIniciais]
  (

    [anoSemMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosSemanasMesesIniciaisanoSemMesIniIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [anosSemanasMesesIniciaissemMesIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosSemanasMesesIniciaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniPk] >>>'
  ALTER TABLE [cal].[anosSemanasMesesIniciais]
    ADD CONSTRAINT [anoSemMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [anoSemMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasMesesIniciais') AND name='anoSemMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[anosSemanasMesesIniciais].[anoSemMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [anoSemMesIniIxAk]
    ON [cal].[anosSemanasMesesIniciais]
    (
      [semMesId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasMesesIniciais') AND name='anoSemMesIniIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[anosSemanasMesesIniciais].[anoSemMesIniIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoSemMesIniIxFkSemMes]
    ON [cal].[anosSemanasMesesIniciais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniFkSemMes] >>>'
  ALTER TABLE [cal].[anosSemanasMesesIniciais]
    ADD CONSTRAINT [anoSemMesIniFkSemMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasMesesIniciais') AND name='anoSemMesIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosSemanasMesesIniciais].[anoSemMesIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoSemMesIniIxFkAno]
    ON [cal].[anosSemanasMesesIniciais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesIniciais].[anoSemMesIniFkAno] >>>'
  ALTER TABLE [cal].[anosSemanasMesesIniciais]
    ADD CONSTRAINT [anoSemMesIniFkAno]
    FOREIGN KEY
    (
      [anoId]
    )
    REFERENCES [DataCorp].[cal].[anos]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

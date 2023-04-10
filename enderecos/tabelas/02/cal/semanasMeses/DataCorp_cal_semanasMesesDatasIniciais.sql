/*
* TABELA: [DataCorp].[cal].[semanasMesesDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[semMesDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[semanasMesesDatasIniciais]
      DROP CONSTRAINT [semMesDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniFkSemMes] >>>'
  IF OBJECT_ID('[cal].[semMesDatIniFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[semanasMesesDatasIniciais]
      DROP CONSTRAINT [semMesDatIniFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semanasMesesDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semanasMesesDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[semanasMesesDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semanasMesesDatasIniciais]
  (

    [semMesDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semanasMesesDatasIniciaissemMesDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [semanasMesesDatasIniciaisdatIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [semanasMesesDatasIniciaissemMesIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniPk] >>>'
  ALTER TABLE [cal].[semanasMesesDatasIniciais]
    ADD CONSTRAINT [semMesDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [semMesDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesDatasIniciais') AND name='semMesDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[semanasMesesDatasIniciais].[semMesDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [semMesDatIniIxAk]
    ON [cal].[semanasMesesDatasIniciais]
    (
      [datId]
    , [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesDatasIniciais') AND name='semMesDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[semanasMesesDatasIniciais].[semMesDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [semMesDatIniIxFkDat]
    ON [cal].[semanasMesesDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniFkDat] >>>'
  ALTER TABLE [cal].[semanasMesesDatasIniciais]
    ADD CONSTRAINT [semMesDatIniFkDat]
    FOREIGN KEY
    (
      [datId]
    )
    REFERENCES [DataCorp].[cal].[datas]
    (
      [datId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesDatasIniciais') AND name='semMesDatIniIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[semanasMesesDatasIniciais].[semMesDatIniIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [semMesDatIniIxFkSemMes]
    ON [cal].[semanasMesesDatasIniciais]
    (
      [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasIniciais].[semMesDatIniFkSemMes] >>>'
  ALTER TABLE [cal].[semanasMesesDatasIniciais]
    ADD CONSTRAINT [semMesDatIniFkSemMes]
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

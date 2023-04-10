/*
* TABELA: [DataCorp].[cal].[semanasMesesDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[semMesDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[semanasMesesDatasFinais]
      DROP CONSTRAINT [semMesDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinFkSemMes] >>>'
  IF OBJECT_ID('[cal].[semMesDatFinFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[semanasMesesDatasFinais]
      DROP CONSTRAINT [semMesDatFinFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semanasMesesDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semanasMesesDatasFinais' )
  BEGIN
    DROP TABLE [cal].[semanasMesesDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semanasMesesDatasFinais]
  (

    [semMesDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semanasMesesDatasFinaissemMesDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [semanasMesesDatasFinaisdatIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [semanasMesesDatasFinaissemMesIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinPk] >>>'
  ALTER TABLE [cal].[semanasMesesDatasFinais]
    ADD CONSTRAINT [semMesDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [semMesDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesDatasFinais') AND name='semMesDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[semanasMesesDatasFinais].[semMesDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [semMesDatFinIxAk]
    ON [cal].[semanasMesesDatasFinais]
    (
      [datId]
    , [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesDatasFinais') AND name='semMesDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[semanasMesesDatasFinais].[semMesDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [semMesDatFinIxFkDat]
    ON [cal].[semanasMesesDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinFkDat] >>>'
  ALTER TABLE [cal].[semanasMesesDatasFinais]
    ADD CONSTRAINT [semMesDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasMesesDatasFinais') AND name='semMesDatFinIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[semanasMesesDatasFinais].[semMesDatFinIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [semMesDatFinIxFkSemMes]
    ON [cal].[semanasMesesDatasFinais]
    (
      [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasMesesDatasFinais].[semMesDatFinFkSemMes] >>>'
  ALTER TABLE [cal].[semanasMesesDatasFinais]
    ADD CONSTRAINT [semMesDatFinFkSemMes]
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

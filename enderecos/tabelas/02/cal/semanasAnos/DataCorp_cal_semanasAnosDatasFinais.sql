/*
* TABELA: [DataCorp].[cal].[semanasAnosDatasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinFkDat] >>>'
  IF OBJECT_ID('[cal].[semAnoDatFinFkDat]') IS NOT NULL
    ALTER TABLE [cal].[semanasAnosDatasFinais]
      DROP CONSTRAINT [semAnoDatFinFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinFkSemAno] >>>'
  IF OBJECT_ID('[cal].[semAnoDatFinFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[semanasAnosDatasFinais]
      DROP CONSTRAINT [semAnoDatFinFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semanasAnosDatasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semanasAnosDatasFinais' )
  BEGIN
    DROP TABLE [cal].[semanasAnosDatasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semanasAnosDatasFinais]
  (

    [semAnoDatFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semanasAnosDatasFinaissemAnoDatFinIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [semanasAnosDatasFinaisdatIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [semanasAnosDatasFinaissemAnoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinPk] >>>'
  ALTER TABLE [cal].[semanasAnosDatasFinais]
    ADD CONSTRAINT [semAnoDatFinPk]
      PRIMARY KEY CLUSTERED
      (
        [semAnoDatFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosDatasFinais') AND name='semAnoDatFinIxAk')
  BEGIN
    DROP INDEX [cal].[semanasAnosDatasFinais].[semAnoDatFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinIxAk] >>>'
  CREATE UNIQUE INDEX [semAnoDatFinIxAk]
    ON [cal].[semanasAnosDatasFinais]
    (
      [datId]
    , [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosDatasFinais') AND name='semAnoDatFinIxFkDat')
  BEGIN
    DROP INDEX [cal].[semanasAnosDatasFinais].[semAnoDatFinIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [semAnoDatFinIxFkDat]
    ON [cal].[semanasAnosDatasFinais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinFkDat] >>>'
  ALTER TABLE [cal].[semanasAnosDatasFinais]
    ADD CONSTRAINT [semAnoDatFinFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosDatasFinais') AND name='semAnoDatFinIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[semanasAnosDatasFinais].[semAnoDatFinIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [semAnoDatFinIxFkSemAno]
    ON [cal].[semanasAnosDatasFinais]
    (
      [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasFinais].[semAnoDatFinFkSemAno] >>>'
  ALTER TABLE [cal].[semanasAnosDatasFinais]
    ADD CONSTRAINT [semAnoDatFinFkSemAno]
    FOREIGN KEY
    (
      [semAnoId]
    )
    REFERENCES [DataCorp].[cal].[semanasAnos]
    (
      [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

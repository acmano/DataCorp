/*
* TABELA: [DataCorp].[cal].[semanasAnosDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[semAnoDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[semanasAnosDatasIniciais]
      DROP CONSTRAINT [semAnoDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniFkSemAno] >>>'
  IF OBJECT_ID('[cal].[semAnoDatIniFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[semanasAnosDatasIniciais]
      DROP CONSTRAINT [semAnoDatIniFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semanasAnosDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semanasAnosDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[semanasAnosDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semanasAnosDatasIniciais]
  (

    [semAnoDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semanasAnosDatasIniciaissemAnoDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [semanasAnosDatasIniciaisdatIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [semanasAnosDatasIniciaissemAnoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniPk] >>>'
  ALTER TABLE [cal].[semanasAnosDatasIniciais]
    ADD CONSTRAINT [semAnoDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [semAnoDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosDatasIniciais') AND name='semAnoDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[semanasAnosDatasIniciais].[semAnoDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [semAnoDatIniIxAk]
    ON [cal].[semanasAnosDatasIniciais]
    (
      [datId]
    , [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosDatasIniciais') AND name='semAnoDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[semanasAnosDatasIniciais].[semAnoDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [semAnoDatIniIxFkDat]
    ON [cal].[semanasAnosDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniFkDat] >>>'
  ALTER TABLE [cal].[semanasAnosDatasIniciais]
    ADD CONSTRAINT [semAnoDatIniFkDat]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosDatasIniciais') AND name='semAnoDatIniIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[semanasAnosDatasIniciais].[semAnoDatIniIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [semAnoDatIniIxFkSemAno]
    ON [cal].[semanasAnosDatasIniciais]
    (
      [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosDatasIniciais].[semAnoDatIniFkSemAno] >>>'
  ALTER TABLE [cal].[semanasAnosDatasIniciais]
    ADD CONSTRAINT [semAnoDatIniFkSemAno]
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

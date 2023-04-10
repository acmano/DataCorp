/*
* TABELA: [DataCorp].[cal].[anosSemanasAnosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniFkSemAno] >>>'
  IF OBJECT_ID('[cal].[anoSemAnoIniFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasAnosIniciais]
      DROP CONSTRAINT [anoSemAnoIniFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniFkAno] >>>'
  IF OBJECT_ID('[cal].[anoSemAnoIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasAnosIniciais]
      DROP CONSTRAINT [anoSemAnoIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosSemanasAnosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosSemanasAnosIniciais' )
  BEGIN
    DROP TABLE [cal].[anosSemanasAnosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosSemanasAnosIniciais]
  (

    [anoSemAnoIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosSemanasAnosIniciaisanoSemAnoIniIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [anosSemanasAnosIniciaissemAnoIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosSemanasAnosIniciaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniPk] >>>'
  ALTER TABLE [cal].[anosSemanasAnosIniciais]
    ADD CONSTRAINT [anoSemAnoIniPk]
      PRIMARY KEY CLUSTERED
      (
        [anoSemAnoIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasAnosIniciais') AND name='anoSemAnoIniIxAk')
  BEGIN
    DROP INDEX [cal].[anosSemanasAnosIniciais].[anoSemAnoIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniIxAk] >>>'
  CREATE UNIQUE INDEX [anoSemAnoIniIxAk]
    ON [cal].[anosSemanasAnosIniciais]
    (
      [semAnoId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasAnosIniciais') AND name='anoSemAnoIniIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[anosSemanasAnosIniciais].[anoSemAnoIniIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoSemAnoIniIxFkSemAno]
    ON [cal].[anosSemanasAnosIniciais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniFkSemAno] >>>'
  ALTER TABLE [cal].[anosSemanasAnosIniciais]
    ADD CONSTRAINT [anoSemAnoIniFkSemAno]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasAnosIniciais') AND name='anoSemAnoIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosSemanasAnosIniciais].[anoSemAnoIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoSemAnoIniIxFkAno]
    ON [cal].[anosSemanasAnosIniciais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosIniciais].[anoSemAnoIniFkAno] >>>'
  ALTER TABLE [cal].[anosSemanasAnosIniciais]
    ADD CONSTRAINT [anoSemAnoIniFkAno]
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

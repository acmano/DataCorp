/*
* TABELA: [DataCorp].[cal].[anosSemanasAnosFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinFkSemAno] >>>'
  IF OBJECT_ID('[cal].[anoSemAnoFinFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasAnosFinais]
      DROP CONSTRAINT [anoSemAnoFinFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinFkAno] >>>'
  IF OBJECT_ID('[cal].[anoSemAnoFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasAnosFinais]
      DROP CONSTRAINT [anoSemAnoFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosSemanasAnosFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosSemanasAnosFinais' )
  BEGIN
    DROP TABLE [cal].[anosSemanasAnosFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosSemanasAnosFinais]
  (

    [anoSemAnoFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosSemanasAnosFinaisanoSemAnoFinIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [anosSemanasAnosFinaissemAnoIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosSemanasAnosFinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinPk] >>>'
  ALTER TABLE [cal].[anosSemanasAnosFinais]
    ADD CONSTRAINT [anoSemAnoFinPk]
      PRIMARY KEY CLUSTERED
      (
        [anoSemAnoFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasAnosFinais') AND name='anoSemAnoFinIxAk')
  BEGIN
    DROP INDEX [cal].[anosSemanasAnosFinais].[anoSemAnoFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinIxAk] >>>'
  CREATE UNIQUE INDEX [anoSemAnoFinIxAk]
    ON [cal].[anosSemanasAnosFinais]
    (
      [semAnoId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasAnosFinais') AND name='anoSemAnoFinIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[anosSemanasAnosFinais].[anoSemAnoFinIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoSemAnoFinIxFkSemAno]
    ON [cal].[anosSemanasAnosFinais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinFkSemAno] >>>'
  ALTER TABLE [cal].[anosSemanasAnosFinais]
    ADD CONSTRAINT [anoSemAnoFinFkSemAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasAnosFinais') AND name='anoSemAnoFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosSemanasAnosFinais].[anoSemAnoFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoSemAnoFinIxFkAno]
    ON [cal].[anosSemanasAnosFinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasAnosFinais].[anoSemAnoFinFkAno] >>>'
  ALTER TABLE [cal].[anosSemanasAnosFinais]
    ADD CONSTRAINT [anoSemAnoFinFkAno]
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

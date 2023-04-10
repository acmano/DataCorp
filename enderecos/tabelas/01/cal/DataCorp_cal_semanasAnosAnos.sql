/*
* TABELA: [DataCorp].[cal].[semanasAnosAnos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoFkAno] >>>'
  IF OBJECT_ID('[cal].[semAnoAnoFkAno]') IS NOT NULL
    ALTER TABLE [cal].[semanasAnosAnos]
      DROP CONSTRAINT [semAnoAnoFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoFkSemAno] >>>'
  IF OBJECT_ID('[cal].[semAnoAnoFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[semanasAnosAnos]
      DROP CONSTRAINT [semAnoAnoFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semanasAnosAnos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semanasAnosAnos' )
  BEGIN
    DROP TABLE [cal].[semanasAnosAnos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semanasAnosAnos]
  (

    [semAnoAnoId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semanasAnosAnossemAnoAnoIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [semanasAnosAnosanoIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [semanasAnosAnossemAnoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoPk] >>>'
  ALTER TABLE [cal].[semanasAnosAnos]
    ADD CONSTRAINT [semAnoAnoPk]
      PRIMARY KEY CLUSTERED
      (
        [semAnoAnoId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosAnos') AND name='semAnoAnoIxAk')
  BEGIN
    DROP INDEX [cal].[semanasAnosAnos].[semAnoAnoIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoIxAk] >>>'
  CREATE UNIQUE INDEX [semAnoAnoIxAk]
    ON [cal].[semanasAnosAnos]
    (
      [anoId]
    , [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosAnos') AND name='semAnoAnoIxFkAno')
  BEGIN
    DROP INDEX [cal].[semanasAnosAnos].[semAnoAnoIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [semAnoAnoIxFkAno]
    ON [cal].[semanasAnosAnos]
    (
      [anoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoFkAno] >>>'
  ALTER TABLE [cal].[semanasAnosAnos]
    ADD CONSTRAINT [semAnoAnoFkAno]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semanasAnosAnos') AND name='semAnoAnoIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[semanasAnosAnos].[semAnoAnoIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [semAnoAnoIxFkSemAno]
    ON [cal].[semanasAnosAnos]
    (
      [semAnoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semanasAnosAnos].[semAnoAnoFkSemAno] >>>'
  ALTER TABLE [cal].[semanasAnosAnos]
    ADD CONSTRAINT [semAnoAnoFkSemAno]
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

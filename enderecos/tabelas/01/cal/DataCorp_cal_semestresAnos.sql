/*
* TABELA: [DataCorp].[cal].[semestresAnos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresAnos].[smtAnoFkAno] >>>'
  IF OBJECT_ID('[cal].[smtAnoFkAno]') IS NOT NULL
    ALTER TABLE [cal].[semestresAnos]
      DROP CONSTRAINT [smtAnoFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresAnos].[smtAnoFkSem] >>>'
  IF OBJECT_ID('[cal].[smtAnoFkSem]') IS NOT NULL
    ALTER TABLE [cal].[semestresAnos]
      DROP CONSTRAINT [smtAnoFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[semestresAnos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'semestresAnos' )
  BEGIN
    DROP TABLE [cal].[semestresAnos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[semestresAnos]
  (

    [smtAnoId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [semestresAnossmtAnoIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [semestresAnosanoIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [semestresAnossmtIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[semestresAnos].[smtAnoPk] >>>'
  ALTER TABLE [cal].[semestresAnos]
    ADD CONSTRAINT [smtAnoPk]
      PRIMARY KEY CLUSTERED
      (
        [smtAnoId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresAnos].[smtAnoIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semestresAnos') AND name='smtAnoIxAk')
  BEGIN
    DROP INDEX [cal].[semestresAnos].[smtAnoIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresAnos].[smtAnoIxAk] >>>'
  CREATE UNIQUE INDEX [smtAnoIxAk]
    ON [cal].[semestresAnos]
    (
      [anoId]
    , [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresAnos].[smtAnoIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semestresAnos') AND name='smtAnoIxFkAno')
  BEGIN
    DROP INDEX [cal].[semestresAnos].[smtAnoIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [smtAnoIxFkAno]
    ON [cal].[semestresAnos]
    (
      [anoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresAnos].[smtAnoFkAno] >>>'
  ALTER TABLE [cal].[semestresAnos]
    ADD CONSTRAINT [smtAnoFkAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[semestresAnos].[smtAnoIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.semestresAnos') AND name='smtAnoIxFkSem')
  BEGIN
    DROP INDEX [cal].[semestresAnos].[smtAnoIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [smtAnoIxFkSem]
    ON [cal].[semestresAnos]
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[semestresAnos].[smtAnoFkSem] >>>'
  ALTER TABLE [cal].[semestresAnos]
    ADD CONSTRAINT [smtAnoFkSem]
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

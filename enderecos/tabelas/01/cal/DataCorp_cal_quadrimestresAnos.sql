/*
* TABELA: [DataCorp].[cal].[quadrimestresAnos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresAnos].[quaAnoFkAno] >>>'
  IF OBJECT_ID('[cal].[quaAnoFkAno]') IS NOT NULL
    ALTER TABLE [cal].[quadrimestresAnos]
      DROP CONSTRAINT [quaAnoFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresAnos].[quaAnoFkQua] >>>'
  IF OBJECT_ID('[cal].[quaAnoFkQua]') IS NOT NULL
    ALTER TABLE [cal].[quadrimestresAnos]
      DROP CONSTRAINT [quaAnoFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[quadrimestresAnos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'quadrimestresAnos' )
  BEGIN
    DROP TABLE [cal].[quadrimestresAnos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[quadrimestresAnos]
  (

    [quaAnoId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [quadrimestresAnosquaAnoIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [quadrimestresAnosanoIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [quadrimestresAnosquaIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[quadrimestresAnos].[quaAnoPk] >>>'
  ALTER TABLE [cal].[quadrimestresAnos]
    ADD CONSTRAINT [quaAnoPk]
      PRIMARY KEY CLUSTERED
      (
        [quaAnoId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresAnos].[quaAnoIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresAnos') AND name='quaAnoIxAk')
  BEGIN
    DROP INDEX [cal].[quadrimestresAnos].[quaAnoIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresAnos].[quaAnoIxAk] >>>'
  CREATE UNIQUE INDEX [quaAnoIxAk]
    ON [cal].[quadrimestresAnos]
    (
      [anoId]
    , [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresAnos].[quaAnoIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresAnos') AND name='quaAnoIxFkAno')
  BEGIN
    DROP INDEX [cal].[quadrimestresAnos].[quaAnoIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [quaAnoIxFkAno]
    ON [cal].[quadrimestresAnos]
    (
      [anoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresAnos].[quaAnoFkAno] >>>'
  ALTER TABLE [cal].[quadrimestresAnos]
    ADD CONSTRAINT [quaAnoFkAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[quadrimestresAnos].[quaAnoIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.quadrimestresAnos') AND name='quaAnoIxFkQua')
  BEGIN
    DROP INDEX [cal].[quadrimestresAnos].[quaAnoIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [quaAnoIxFkQua]
    ON [cal].[quadrimestresAnos]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[quadrimestresAnos].[quaAnoFkQua] >>>'
  ALTER TABLE [cal].[quadrimestresAnos]
    ADD CONSTRAINT [quaAnoFkQua]
    FOREIGN KEY
    (
      [quaId]
    )
    REFERENCES [DataCorp].[cal].[quadrimestres]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

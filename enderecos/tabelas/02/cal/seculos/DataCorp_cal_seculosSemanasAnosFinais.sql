/*
* TABELA: [DataCorp].[cal].[seculosSemanasAnosFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinFkSemAno] >>>'
  IF OBJECT_ID('[cal].[secSemAnoFinFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasAnosFinais]
      DROP CONSTRAINT [secSemAnoFinFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secSemAnoFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasAnosFinais]
      DROP CONSTRAINT [secSemAnoFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosSemanasAnosFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosSemanasAnosFinais' )
  BEGIN
    DROP TABLE [cal].[seculosSemanasAnosFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosSemanasAnosFinais]
  (

    [secSemAnoFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosSemanasAnosFinaissecSemAnoFinIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [seculosSemanasAnosFinaissemAnoIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosSemanasAnosFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinPk] >>>'
  ALTER TABLE [cal].[seculosSemanasAnosFinais]
    ADD CONSTRAINT [secSemAnoFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secSemAnoFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasAnosFinais') AND name='secSemAnoFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosSemanasAnosFinais].[secSemAnoFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinIxAk] >>>'
  CREATE UNIQUE INDEX [secSemAnoFinIxAk]
    ON [cal].[seculosSemanasAnosFinais]
    (
      [semAnoId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasAnosFinais') AND name='secSemAnoFinIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[seculosSemanasAnosFinais].[secSemAnoFinIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secSemAnoFinIxFkSemAno]
    ON [cal].[seculosSemanasAnosFinais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinFkSemAno] >>>'
  ALTER TABLE [cal].[seculosSemanasAnosFinais]
    ADD CONSTRAINT [secSemAnoFinFkSemAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasAnosFinais') AND name='secSemAnoFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosSemanasAnosFinais].[secSemAnoFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secSemAnoFinIxFkSec]
    ON [cal].[seculosSemanasAnosFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosFinais].[secSemAnoFinFkSec] >>>'
  ALTER TABLE [cal].[seculosSemanasAnosFinais]
    ADD CONSTRAINT [secSemAnoFinFkSec]
    FOREIGN KEY
    (
      [secId]
    )
    REFERENCES [DataCorp].[cal].[seculos]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

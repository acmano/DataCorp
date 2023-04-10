/*
* TABELA: [DataCorp].[cal].[seculosSemanasAnosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniFkSemAno] >>>'
  IF OBJECT_ID('[cal].[secSemAnoIniFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasAnosIniciais]
      DROP CONSTRAINT [secSemAnoIniFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secSemAnoIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasAnosIniciais]
      DROP CONSTRAINT [secSemAnoIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosSemanasAnosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosSemanasAnosIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosSemanasAnosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosSemanasAnosIniciais]
  (

    [secSemAnoIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosSemanasAnosIniciaissecSemAnoIniIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [seculosSemanasAnosIniciaissemAnoIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosSemanasAnosIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniPk] >>>'
  ALTER TABLE [cal].[seculosSemanasAnosIniciais]
    ADD CONSTRAINT [secSemAnoIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secSemAnoIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasAnosIniciais') AND name='secSemAnoIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosSemanasAnosIniciais].[secSemAnoIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniIxAk] >>>'
  CREATE UNIQUE INDEX [secSemAnoIniIxAk]
    ON [cal].[seculosSemanasAnosIniciais]
    (
      [semAnoId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasAnosIniciais') AND name='secSemAnoIniIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[seculosSemanasAnosIniciais].[secSemAnoIniIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secSemAnoIniIxFkSemAno]
    ON [cal].[seculosSemanasAnosIniciais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniFkSemAno] >>>'
  ALTER TABLE [cal].[seculosSemanasAnosIniciais]
    ADD CONSTRAINT [secSemAnoIniFkSemAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasAnosIniciais') AND name='secSemAnoIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosSemanasAnosIniciais].[secSemAnoIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secSemAnoIniIxFkSec]
    ON [cal].[seculosSemanasAnosIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasAnosIniciais].[secSemAnoIniFkSec] >>>'
  ALTER TABLE [cal].[seculosSemanasAnosIniciais]
    ADD CONSTRAINT [secSemAnoIniFkSec]
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

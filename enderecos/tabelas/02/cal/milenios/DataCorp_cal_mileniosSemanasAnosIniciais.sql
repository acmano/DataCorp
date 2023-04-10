/*
* TABELA: [DataCorp].[cal].[mileniosSemanasAnosIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniFkSemAno] >>>'
  IF OBJECT_ID('[cal].[milSemAnoIniFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasAnosIniciais]
      DROP CONSTRAINT [milSemAnoIniFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milSemAnoIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasAnosIniciais]
      DROP CONSTRAINT [milSemAnoIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSemanasAnosIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSemanasAnosIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosSemanasAnosIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSemanasAnosIniciais]
  (

    [milSemAnoIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSemanasAnosIniciaismilSemAnoIniIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [mileniosSemanasAnosIniciaissemAnoIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSemanasAnosIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniPk] >>>'
  ALTER TABLE [cal].[mileniosSemanasAnosIniciais]
    ADD CONSTRAINT [milSemAnoIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milSemAnoIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasAnosIniciais') AND name='milSemAnoIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasAnosIniciais].[milSemAnoIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniIxAk] >>>'
  CREATE UNIQUE INDEX [milSemAnoIniIxAk]
    ON [cal].[mileniosSemanasAnosIniciais]
    (
      [semAnoId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasAnosIniciais') AND name='milSemAnoIniIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasAnosIniciais].[milSemAnoIniIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSemAnoIniIxFkSemAno]
    ON [cal].[mileniosSemanasAnosIniciais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniFkSemAno] >>>'
  ALTER TABLE [cal].[mileniosSemanasAnosIniciais]
    ADD CONSTRAINT [milSemAnoIniFkSemAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasAnosIniciais') AND name='milSemAnoIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasAnosIniciais].[milSemAnoIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSemAnoIniIxFkMil]
    ON [cal].[mileniosSemanasAnosIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosIniciais].[milSemAnoIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosSemanasAnosIniciais]
    ADD CONSTRAINT [milSemAnoIniFkMil]
    FOREIGN KEY
    (
      [milId]
    )
    REFERENCES [DataCorp].[cal].[milenios]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

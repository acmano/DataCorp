/*
* TABELA: [DataCorp].[cal].[mileniosSemanasAnosFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinFkSemAno] >>>'
  IF OBJECT_ID('[cal].[milSemAnoFinFkSemAno]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasAnosFinais]
      DROP CONSTRAINT [milSemAnoFinFkSemAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milSemAnoFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasAnosFinais]
      DROP CONSTRAINT [milSemAnoFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSemanasAnosFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSemanasAnosFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosSemanasAnosFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSemanasAnosFinais]
  (

    [milSemAnoFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSemanasAnosFinaismilSemAnoFinIdNn] NOT NULL

  , [semAnoId]
      BIGINT
      CONSTRAINT [mileniosSemanasAnosFinaissemAnoIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSemanasAnosFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinPk] >>>'
  ALTER TABLE [cal].[mileniosSemanasAnosFinais]
    ADD CONSTRAINT [milSemAnoFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milSemAnoFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasAnosFinais') AND name='milSemAnoFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasAnosFinais].[milSemAnoFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinIxAk] >>>'
  CREATE UNIQUE INDEX [milSemAnoFinIxAk]
    ON [cal].[mileniosSemanasAnosFinais]
    (
      [semAnoId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinIxFkSemAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasAnosFinais') AND name='milSemAnoFinIxFkSemAno')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasAnosFinais].[milSemAnoFinIxFkSemAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSemAnoFinIxFkSemAno]
    ON [cal].[mileniosSemanasAnosFinais]
    (
      [semAnoId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinFkSemAno] >>>'
  ALTER TABLE [cal].[mileniosSemanasAnosFinais]
    ADD CONSTRAINT [milSemAnoFinFkSemAno]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasAnosFinais') AND name='milSemAnoFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasAnosFinais].[milSemAnoFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSemAnoFinIxFkMil]
    ON [cal].[mileniosSemanasAnosFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasAnosFinais].[milSemAnoFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosSemanasAnosFinais]
    ADD CONSTRAINT [milSemAnoFinFkMil]
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

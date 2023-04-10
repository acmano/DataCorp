/*
* TABELA: [DataCorp].[cal].[mileniosSemanasMesesFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinFkSemMes] >>>'
  IF OBJECT_ID('[cal].[milSemMesFinFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasMesesFinais]
      DROP CONSTRAINT [milSemMesFinFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinFkMil] >>>'
  IF OBJECT_ID('[cal].[milSemMesFinFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasMesesFinais]
      DROP CONSTRAINT [milSemMesFinFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSemanasMesesFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSemanasMesesFinais' )
  BEGIN
    DROP TABLE [cal].[mileniosSemanasMesesFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSemanasMesesFinais]
  (

    [milSemMesFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSemanasMesesFinaismilSemMesFinIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [mileniosSemanasMesesFinaissemMesIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSemanasMesesFinaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinPk] >>>'
  ALTER TABLE [cal].[mileniosSemanasMesesFinais]
    ADD CONSTRAINT [milSemMesFinPk]
      PRIMARY KEY CLUSTERED
      (
        [milSemMesFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasMesesFinais') AND name='milSemMesFinIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasMesesFinais].[milSemMesFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinIxAk] >>>'
  CREATE UNIQUE INDEX [milSemMesFinIxAk]
    ON [cal].[mileniosSemanasMesesFinais]
    (
      [semMesId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasMesesFinais') AND name='milSemMesFinIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasMesesFinais].[milSemMesFinIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSemMesFinIxFkSemMes]
    ON [cal].[mileniosSemanasMesesFinais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinFkSemMes] >>>'
  ALTER TABLE [cal].[mileniosSemanasMesesFinais]
    ADD CONSTRAINT [milSemMesFinFkSemMes]
    FOREIGN KEY
    (
      [semMesId]
    )
    REFERENCES [DataCorp].[cal].[semanasMeses]
    (
      [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasMesesFinais') AND name='milSemMesFinIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasMesesFinais].[milSemMesFinIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSemMesFinIxFkMil]
    ON [cal].[mileniosSemanasMesesFinais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesFinais].[milSemMesFinFkMil] >>>'
  ALTER TABLE [cal].[mileniosSemanasMesesFinais]
    ADD CONSTRAINT [milSemMesFinFkMil]
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

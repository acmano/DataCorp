/*
* TABELA: [DataCorp].[cal].[mileniosSemanasMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniFkSemMes] >>>'
  IF OBJECT_ID('[cal].[milSemMesIniFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasMesesIniciais]
      DROP CONSTRAINT [milSemMesIniFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniFkMil] >>>'
  IF OBJECT_ID('[cal].[milSemMesIniFkMil]') IS NOT NULL
    ALTER TABLE [cal].[mileniosSemanasMesesIniciais]
      DROP CONSTRAINT [milSemMesIniFkMil]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[mileniosSemanasMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'mileniosSemanasMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[mileniosSemanasMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[mileniosSemanasMesesIniciais]
  (

    [milSemMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mileniosSemanasMesesIniciaismilSemMesIniIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [mileniosSemanasMesesIniciaissemMesIdNn] NOT NULL

  , [milId]
      BIGINT
      CONSTRAINT [mileniosSemanasMesesIniciaismilIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniPk] >>>'
  ALTER TABLE [cal].[mileniosSemanasMesesIniciais]
    ADD CONSTRAINT [milSemMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [milSemMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasMesesIniciais') AND name='milSemMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasMesesIniciais].[milSemMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [milSemMesIniIxAk]
    ON [cal].[mileniosSemanasMesesIniciais]
    (
      [semMesId]
    , [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasMesesIniciais') AND name='milSemMesIniIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasMesesIniciais].[milSemMesIniIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [milSemMesIniIxFkSemMes]
    ON [cal].[mileniosSemanasMesesIniciais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniFkSemMes] >>>'
  ALTER TABLE [cal].[mileniosSemanasMesesIniciais]
    ADD CONSTRAINT [milSemMesIniFkSemMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniIxFkMil] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.mileniosSemanasMesesIniciais') AND name='milSemMesIniIxFkMil')
  BEGIN
    DROP INDEX [cal].[mileniosSemanasMesesIniciais].[milSemMesIniIxFkMil]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [milSemMesIniIxFkMil]
    ON [cal].[mileniosSemanasMesesIniciais]
    (
      [milId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[mileniosSemanasMesesIniciais].[milSemMesIniFkMil] >>>'
  ALTER TABLE [cal].[mileniosSemanasMesesIniciais]
    ADD CONSTRAINT [milSemMesIniFkMil]
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

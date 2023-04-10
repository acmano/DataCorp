/*
* TABELA: [DataCorp].[cal].[anosQuadrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniFkQua] >>>'
  IF OBJECT_ID('[cal].[anoQuaIniFkQua]') IS NOT NULL
    ALTER TABLE [cal].[anosQuadrimestresIniciais]
      DROP CONSTRAINT [anoQuaIniFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniFkAno] >>>'
  IF OBJECT_ID('[cal].[anoQuaIniFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosQuadrimestresIniciais]
      DROP CONSTRAINT [anoQuaIniFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosQuadrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosQuadrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[anosQuadrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosQuadrimestresIniciais]
  (

    [anoQuaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosQuadrimestresIniciaisanoQuaIniIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [anosQuadrimestresIniciaisquaIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosQuadrimestresIniciaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniPk] >>>'
  ALTER TABLE [cal].[anosQuadrimestresIniciais]
    ADD CONSTRAINT [anoQuaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [anoQuaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuadrimestresIniciais') AND name='anoQuaIniIxAk')
  BEGIN
    DROP INDEX [cal].[anosQuadrimestresIniciais].[anoQuaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniIxAk] >>>'
  CREATE UNIQUE INDEX [anoQuaIniIxAk]
    ON [cal].[anosQuadrimestresIniciais]
    (
      [quaId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuadrimestresIniciais') AND name='anoQuaIniIxFkQua')
  BEGIN
    DROP INDEX [cal].[anosQuadrimestresIniciais].[anoQuaIniIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoQuaIniIxFkQua]
    ON [cal].[anosQuadrimestresIniciais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniFkQua] >>>'
  ALTER TABLE [cal].[anosQuadrimestresIniciais]
    ADD CONSTRAINT [anoQuaIniFkQua]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuadrimestresIniciais') AND name='anoQuaIniIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosQuadrimestresIniciais].[anoQuaIniIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoQuaIniIxFkAno]
    ON [cal].[anosQuadrimestresIniciais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresIniciais].[anoQuaIniFkAno] >>>'
  ALTER TABLE [cal].[anosQuadrimestresIniciais]
    ADD CONSTRAINT [anoQuaIniFkAno]
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

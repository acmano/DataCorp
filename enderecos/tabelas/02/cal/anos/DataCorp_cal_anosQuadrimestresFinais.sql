/*
* TABELA: [DataCorp].[cal].[anosQuadrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinFkQua] >>>'
  IF OBJECT_ID('[cal].[anoQuaFinFkQua]') IS NOT NULL
    ALTER TABLE [cal].[anosQuadrimestresFinais]
      DROP CONSTRAINT [anoQuaFinFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinFkAno] >>>'
  IF OBJECT_ID('[cal].[anoQuaFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosQuadrimestresFinais]
      DROP CONSTRAINT [anoQuaFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosQuadrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosQuadrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[anosQuadrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosQuadrimestresFinais]
  (

    [anoQuaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosQuadrimestresFinaisanoQuaFinIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [anosQuadrimestresFinaisquaIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosQuadrimestresFinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinPk] >>>'
  ALTER TABLE [cal].[anosQuadrimestresFinais]
    ADD CONSTRAINT [anoQuaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [anoQuaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuadrimestresFinais') AND name='anoQuaFinIxAk')
  BEGIN
    DROP INDEX [cal].[anosQuadrimestresFinais].[anoQuaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinIxAk] >>>'
  CREATE UNIQUE INDEX [anoQuaFinIxAk]
    ON [cal].[anosQuadrimestresFinais]
    (
      [quaId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuadrimestresFinais') AND name='anoQuaFinIxFkQua')
  BEGIN
    DROP INDEX [cal].[anosQuadrimestresFinais].[anoQuaFinIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoQuaFinIxFkQua]
    ON [cal].[anosQuadrimestresFinais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinFkQua] >>>'
  ALTER TABLE [cal].[anosQuadrimestresFinais]
    ADD CONSTRAINT [anoQuaFinFkQua]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuadrimestresFinais') AND name='anoQuaFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosQuadrimestresFinais].[anoQuaFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoQuaFinIxFkAno]
    ON [cal].[anosQuadrimestresFinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuadrimestresFinais].[anoQuaFinFkAno] >>>'
  ALTER TABLE [cal].[anosQuadrimestresFinais]
    ADD CONSTRAINT [anoQuaFinFkAno]
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

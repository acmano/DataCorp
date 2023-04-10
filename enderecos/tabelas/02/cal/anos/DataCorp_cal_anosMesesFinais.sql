/*
* TABELA: [DataCorp].[cal].[anosMesesFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesFinais].[anoMesFinFkMes] >>>'
  IF OBJECT_ID('[cal].[anoMesFinFkMes]') IS NOT NULL
    ALTER TABLE [cal].[anosMesesFinais]
      DROP CONSTRAINT [anoMesFinFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesFinais].[anoMesFinFkAno] >>>'
  IF OBJECT_ID('[cal].[anoMesFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosMesesFinais]
      DROP CONSTRAINT [anoMesFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosMesesFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosMesesFinais' )
  BEGIN
    DROP TABLE [cal].[anosMesesFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosMesesFinais]
  (

    [anoMesFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosMesesFinaisanoMesFinIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [anosMesesFinaismesIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosMesesFinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosMesesFinais].[anoMesFinPk] >>>'
  ALTER TABLE [cal].[anosMesesFinais]
    ADD CONSTRAINT [anoMesFinPk]
      PRIMARY KEY CLUSTERED
      (
        [anoMesFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesFinais].[anoMesFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosMesesFinais') AND name='anoMesFinIxAk')
  BEGIN
    DROP INDEX [cal].[anosMesesFinais].[anoMesFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesFinais].[anoMesFinIxAk] >>>'
  CREATE UNIQUE INDEX [anoMesFinIxAk]
    ON [cal].[anosMesesFinais]
    (
      [mesId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesFinais].[anoMesFinIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosMesesFinais') AND name='anoMesFinIxFkMes')
  BEGIN
    DROP INDEX [cal].[anosMesesFinais].[anoMesFinIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoMesFinIxFkMes]
    ON [cal].[anosMesesFinais]
    (
      [mesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesFinais].[anoMesFinFkMes] >>>'
  ALTER TABLE [cal].[anosMesesFinais]
    ADD CONSTRAINT [anoMesFinFkMes]
    FOREIGN KEY
    (
      [mesId]
    )
    REFERENCES [DataCorp].[cal].[meses]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosMesesFinais].[anoMesFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosMesesFinais') AND name='anoMesFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosMesesFinais].[anoMesFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoMesFinIxFkAno]
    ON [cal].[anosMesesFinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosMesesFinais].[anoMesFinFkAno] >>>'
  ALTER TABLE [cal].[anosMesesFinais]
    ADD CONSTRAINT [anoMesFinFkAno]
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

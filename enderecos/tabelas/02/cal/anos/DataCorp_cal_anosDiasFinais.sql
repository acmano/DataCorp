/*
* TABELA: [DataCorp].[cal].[anosDiasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasFinais].[anoDiaFinFkDia] >>>'
  IF OBJECT_ID('[cal].[anoDiaFinFkDia]') IS NOT NULL
    ALTER TABLE [cal].[anosDiasFinais]
      DROP CONSTRAINT [anoDiaFinFkDia]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasFinais].[anoDiaFinFkAno] >>>'
  IF OBJECT_ID('[cal].[anoDiaFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosDiasFinais]
      DROP CONSTRAINT [anoDiaFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosDiasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosDiasFinais' )
  BEGIN
    DROP TABLE [cal].[anosDiasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosDiasFinais]
  (

    [anoDiaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosDiasFinaisanoDiaFinIdNn] NOT NULL

  , [diaId]
      BIGINT
      CONSTRAINT [anosDiasFinaisdiaIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosDiasFinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosDiasFinais].[anoDiaFinPk] >>>'
  ALTER TABLE [cal].[anosDiasFinais]
    ADD CONSTRAINT [anoDiaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [anoDiaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasFinais].[anoDiaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDiasFinais') AND name='anoDiaFinIxAk')
  BEGIN
    DROP INDEX [cal].[anosDiasFinais].[anoDiaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasFinais].[anoDiaFinIxAk] >>>'
  CREATE UNIQUE INDEX [anoDiaFinIxAk]
    ON [cal].[anosDiasFinais]
    (
      [diaId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasFinais].[anoDiaFinIxFkDia] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDiasFinais') AND name='anoDiaFinIxFkDia')
  BEGIN
    DROP INDEX [cal].[anosDiasFinais].[anoDiaFinIxFkDia]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoDiaFinIxFkDia]
    ON [cal].[anosDiasFinais]
    (
      [diaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasFinais].[anoDiaFinFkDia] >>>'
  ALTER TABLE [cal].[anosDiasFinais]
    ADD CONSTRAINT [anoDiaFinFkDia]
    FOREIGN KEY
    (
      [diaId]
    )
    REFERENCES [DataCorp].[cal].[dias]
    (
      [diaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDiasFinais].[anoDiaFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDiasFinais') AND name='anoDiaFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosDiasFinais].[anoDiaFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoDiaFinIxFkAno]
    ON [cal].[anosDiasFinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDiasFinais].[anoDiaFinFkAno] >>>'
  ALTER TABLE [cal].[anosDiasFinais]
    ADD CONSTRAINT [anoDiaFinFkAno]
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

/*
* TABELA: [DataCorp].[cal].[anosQuinzenasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinFkQui] >>>'
  IF OBJECT_ID('[cal].[anoQuiFinFkQui]') IS NOT NULL
    ALTER TABLE [cal].[anosQuinzenasFinais]
      DROP CONSTRAINT [anoQuiFinFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinFkAno] >>>'
  IF OBJECT_ID('[cal].[anoQuiFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosQuinzenasFinais]
      DROP CONSTRAINT [anoQuiFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosQuinzenasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosQuinzenasFinais' )
  BEGIN
    DROP TABLE [cal].[anosQuinzenasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosQuinzenasFinais]
  (

    [anoQuiFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosQuinzenasFinaisanoQuiFinIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [anosQuinzenasFinaisquiIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosQuinzenasFinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinPk] >>>'
  ALTER TABLE [cal].[anosQuinzenasFinais]
    ADD CONSTRAINT [anoQuiFinPk]
      PRIMARY KEY CLUSTERED
      (
        [anoQuiFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuinzenasFinais') AND name='anoQuiFinIxAk')
  BEGIN
    DROP INDEX [cal].[anosQuinzenasFinais].[anoQuiFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinIxAk] >>>'
  CREATE UNIQUE INDEX [anoQuiFinIxAk]
    ON [cal].[anosQuinzenasFinais]
    (
      [quiId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuinzenasFinais') AND name='anoQuiFinIxFkQui')
  BEGIN
    DROP INDEX [cal].[anosQuinzenasFinais].[anoQuiFinIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoQuiFinIxFkQui]
    ON [cal].[anosQuinzenasFinais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinFkQui] >>>'
  ALTER TABLE [cal].[anosQuinzenasFinais]
    ADD CONSTRAINT [anoQuiFinFkQui]
    FOREIGN KEY
    (
      [quiId]
    )
    REFERENCES [DataCorp].[cal].[quinzenas]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosQuinzenasFinais') AND name='anoQuiFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosQuinzenasFinais].[anoQuiFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoQuiFinIxFkAno]
    ON [cal].[anosQuinzenasFinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosQuinzenasFinais].[anoQuiFinFkAno] >>>'
  ALTER TABLE [cal].[anosQuinzenasFinais]
    ADD CONSTRAINT [anoQuiFinFkAno]
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

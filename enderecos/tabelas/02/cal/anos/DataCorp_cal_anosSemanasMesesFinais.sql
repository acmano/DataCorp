/*
* TABELA: [DataCorp].[cal].[anosSemanasMesesFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinFkSemMes] >>>'
  IF OBJECT_ID('[cal].[anoSemMesFinFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasMesesFinais]
      DROP CONSTRAINT [anoSemMesFinFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinFkAno] >>>'
  IF OBJECT_ID('[cal].[anoSemMesFinFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosSemanasMesesFinais]
      DROP CONSTRAINT [anoSemMesFinFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosSemanasMesesFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosSemanasMesesFinais' )
  BEGIN
    DROP TABLE [cal].[anosSemanasMesesFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosSemanasMesesFinais]
  (

    [anoSemMesFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosSemanasMesesFinaisanoSemMesFinIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [anosSemanasMesesFinaissemMesIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosSemanasMesesFinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinPk] >>>'
  ALTER TABLE [cal].[anosSemanasMesesFinais]
    ADD CONSTRAINT [anoSemMesFinPk]
      PRIMARY KEY CLUSTERED
      (
        [anoSemMesFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasMesesFinais') AND name='anoSemMesFinIxAk')
  BEGIN
    DROP INDEX [cal].[anosSemanasMesesFinais].[anoSemMesFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinIxAk] >>>'
  CREATE UNIQUE INDEX [anoSemMesFinIxAk]
    ON [cal].[anosSemanasMesesFinais]
    (
      [semMesId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasMesesFinais') AND name='anoSemMesFinIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[anosSemanasMesesFinais].[anoSemMesFinIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoSemMesFinIxFkSemMes]
    ON [cal].[anosSemanasMesesFinais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinFkSemMes] >>>'
  ALTER TABLE [cal].[anosSemanasMesesFinais]
    ADD CONSTRAINT [anoSemMesFinFkSemMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosSemanasMesesFinais') AND name='anoSemMesFinIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosSemanasMesesFinais].[anoSemMesFinIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoSemMesFinIxFkAno]
    ON [cal].[anosSemanasMesesFinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosSemanasMesesFinais].[anoSemMesFinFkAno] >>>'
  ALTER TABLE [cal].[anosSemanasMesesFinais]
    ADD CONSTRAINT [anoSemMesFinFkAno]
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

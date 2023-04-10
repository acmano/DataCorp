/*
* TABELA: [DataCorp].[cal].[seculosSemanasMesesFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinFkSemMes] >>>'
  IF OBJECT_ID('[cal].[secSemMesFinFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasMesesFinais]
      DROP CONSTRAINT [secSemMesFinFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secSemMesFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosSemanasMesesFinais]
      DROP CONSTRAINT [secSemMesFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosSemanasMesesFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosSemanasMesesFinais' )
  BEGIN
    DROP TABLE [cal].[seculosSemanasMesesFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosSemanasMesesFinais]
  (

    [secSemMesFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosSemanasMesesFinaissecSemMesFinIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [seculosSemanasMesesFinaissemMesIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosSemanasMesesFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinPk] >>>'
  ALTER TABLE [cal].[seculosSemanasMesesFinais]
    ADD CONSTRAINT [secSemMesFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secSemMesFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasMesesFinais') AND name='secSemMesFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosSemanasMesesFinais].[secSemMesFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinIxAk] >>>'
  CREATE UNIQUE INDEX [secSemMesFinIxAk]
    ON [cal].[seculosSemanasMesesFinais]
    (
      [semMesId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasMesesFinais') AND name='secSemMesFinIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[seculosSemanasMesesFinais].[secSemMesFinIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secSemMesFinIxFkSemMes]
    ON [cal].[seculosSemanasMesesFinais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinFkSemMes] >>>'
  ALTER TABLE [cal].[seculosSemanasMesesFinais]
    ADD CONSTRAINT [secSemMesFinFkSemMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosSemanasMesesFinais') AND name='secSemMesFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosSemanasMesesFinais].[secSemMesFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secSemMesFinIxFkSec]
    ON [cal].[seculosSemanasMesesFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosSemanasMesesFinais].[secSemMesFinFkSec] >>>'
  ALTER TABLE [cal].[seculosSemanasMesesFinais]
    ADD CONSTRAINT [secSemMesFinFkSec]
    FOREIGN KEY
    (
      [secId]
    )
    REFERENCES [DataCorp].[cal].[seculos]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinFkSemMes] >>>'
  IF OBJECT_ID('[cal].[decOrdSemMesFinFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesFinais]
      DROP CONSTRAINT [decOrdSemMesFinFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdSemMesFinFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesFinais]
      DROP CONSTRAINT [decOrdSemMesFinFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisSemanasMesesFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisSemanasMesesFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisSemanasMesesFinais]
  (

    [decOrdSemMesFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisSemanasMesesFinaisdecOrdSemMesFinIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasMesesFinaissemMesIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasMesesFinaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesFinais]
    ADD CONSTRAINT [decOrdSemMesFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdSemMesFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasMesesFinais') AND name='decOrdSemMesFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdSemMesFinIxAk]
    ON [cal].[decendiosOrdinaisSemanasMesesFinais]
    (
      [semMesId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasMesesFinais') AND name='decOrdSemMesFinIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdSemMesFinIxFkSemMes]
    ON [cal].[decendiosOrdinaisSemanasMesesFinais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinFkSemMes] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesFinais]
    ADD CONSTRAINT [decOrdSemMesFinFkSemMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasMesesFinais') AND name='decOrdSemMesFinIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdSemMesFinIxFkDecOrd]
    ON [cal].[decendiosOrdinaisSemanasMesesFinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesFinais].[decOrdSemMesFinFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesFinais]
    ADD CONSTRAINT [decOrdSemMesFinFkDecOrd]
    FOREIGN KEY
    (
      [decOrdId]
    )
    REFERENCES [DataCorp].[cal].[decendiosOrdinais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

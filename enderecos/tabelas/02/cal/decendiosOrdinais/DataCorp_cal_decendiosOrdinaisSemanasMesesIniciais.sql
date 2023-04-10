/*
* TABELA: [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniFkSemMes] >>>'
  IF OBJECT_ID('[cal].[decOrdSemMesIniFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesIniciais]
      DROP CONSTRAINT [decOrdSemMesIniFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[decOrdSemMesIniFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesIniciais]
      DROP CONSTRAINT [decOrdSemMesIniFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosOrdinaisSemanasMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosOrdinaisSemanasMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosOrdinaisSemanasMesesIniciais]
  (

    [decOrdSemMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosOrdinaisSemanasMesesIniciaisdecOrdSemMesIniIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasMesesIniciaissemMesIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [decendiosOrdinaisSemanasMesesIniciaisdecOrdIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniPk] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesIniciais]
    ADD CONSTRAINT [decOrdSemMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decOrdSemMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasMesesIniciais') AND name='decOrdSemMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [decOrdSemMesIniIxAk]
    ON [cal].[decendiosOrdinaisSemanasMesesIniciais]
    (
      [semMesId]
    , [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasMesesIniciais') AND name='decOrdSemMesIniIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decOrdSemMesIniIxFkSemMes]
    ON [cal].[decendiosOrdinaisSemanasMesesIniciais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniFkSemMes] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesIniciais]
    ADD CONSTRAINT [decOrdSemMesIniFkSemMes]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosOrdinaisSemanasMesesIniciais') AND name='decOrdSemMesIniIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decOrdSemMesIniIxFkDecOrd]
    ON [cal].[decendiosOrdinaisSemanasMesesIniciais]
    (
      [decOrdId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosOrdinaisSemanasMesesIniciais].[decOrdSemMesIniFkDecOrd] >>>'
  ALTER TABLE [cal].[decendiosOrdinaisSemanasMesesIniciais]
    ADD CONSTRAINT [decOrdSemMesIniFkDecOrd]
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

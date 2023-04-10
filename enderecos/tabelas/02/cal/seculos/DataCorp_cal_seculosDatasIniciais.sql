/*
* TABELA: [DataCorp].[cal].[seculosDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasIniciais].[secDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[secDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[seculosDatasIniciais]
      DROP CONSTRAINT [secDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasIniciais].[secDatIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secDatIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosDatasIniciais]
      DROP CONSTRAINT [secDatIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosDatasIniciais]
  (

    [secDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosDatasIniciaissecDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [seculosDatasIniciaisdatIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosDatasIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosDatasIniciais].[secDatIniPk] >>>'
  ALTER TABLE [cal].[seculosDatasIniciais]
    ADD CONSTRAINT [secDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasIniciais].[secDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDatasIniciais') AND name='secDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosDatasIniciais].[secDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasIniciais].[secDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [secDatIniIxAk]
    ON [cal].[seculosDatasIniciais]
    (
      [datId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasIniciais].[secDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDatasIniciais') AND name='secDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[seculosDatasIniciais].[secDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secDatIniIxFkDat]
    ON [cal].[seculosDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasIniciais].[secDatIniFkDat] >>>'
  ALTER TABLE [cal].[seculosDatasIniciais]
    ADD CONSTRAINT [secDatIniFkDat]
    FOREIGN KEY
    (
      [datId]
    )
    REFERENCES [DataCorp].[cal].[datas]
    (
      [datId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDatasIniciais].[secDatIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDatasIniciais') AND name='secDatIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosDatasIniciais].[secDatIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secDatIniIxFkSec]
    ON [cal].[seculosDatasIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDatasIniciais].[secDatIniFkSec] >>>'
  ALTER TABLE [cal].[seculosDatasIniciais]
    ADD CONSTRAINT [secDatIniFkSec]
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

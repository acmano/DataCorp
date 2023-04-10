/*
* TABELA: [DataCorp].[cal].[anosDecendiosOrdinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdFkDecOrd] >>>'
  IF OBJECT_ID('[cal].[anoDecOrdFkDecOrd]') IS NOT NULL
    ALTER TABLE [cal].[anosDecendiosOrdinais]
      DROP CONSTRAINT [anoDecOrdFkDecOrd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdFkAno] >>>'
  IF OBJECT_ID('[cal].[anoDecOrdFkAno]') IS NOT NULL
    ALTER TABLE [cal].[anosDecendiosOrdinais]
      DROP CONSTRAINT [anoDecOrdFkAno]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[anosDecendiosOrdinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'anosDecendiosOrdinais' )
  BEGIN
    DROP TABLE [cal].[anosDecendiosOrdinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[anosDecendiosOrdinais]
  (

    [anoDecOrdId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [anosDecendiosOrdinaisanoDecOrdIdNn] NOT NULL

  , [decOrdId]
      BIGINT
      CONSTRAINT [anosDecendiosOrdinaisdecOrdIdNn] NOT NULL

  , [anoId]
      BIGINT
      CONSTRAINT [anosDecendiosOrdinaisanoIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdPk] >>>'
  ALTER TABLE [cal].[anosDecendiosOrdinais]
    ADD CONSTRAINT [anoDecOrdPk]
      PRIMARY KEY CLUSTERED
      (
        [anoDecOrdId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDecendiosOrdinais') AND name='anoDecOrdIxAk')
  BEGIN
    DROP INDEX [cal].[anosDecendiosOrdinais].[anoDecOrdIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdIxAk] >>>'
  CREATE UNIQUE INDEX [anoDecOrdIxAk]
    ON [cal].[anosDecendiosOrdinais]
    (
      [decOrdId]
    , [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdIxFkDecOrd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDecendiosOrdinais') AND name='anoDecOrdIxFkDecOrd')
  BEGIN
    DROP INDEX [cal].[anosDecendiosOrdinais].[anoDecOrdIxFkDecOrd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [anoDecOrdIxFkDecOrd]
    ON [cal].[anosDecendiosOrdinais]
    (
      [decOrdId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdFkDecOrd] >>>'
  ALTER TABLE [cal].[anosDecendiosOrdinais]
    ADD CONSTRAINT [anoDecOrdFkDecOrd]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdIxFkAno] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.anosDecendiosOrdinais') AND name='anoDecOrdIxFkAno')
  BEGIN
    DROP INDEX [cal].[anosDecendiosOrdinais].[anoDecOrdIxFkAno]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [anoDecOrdIxFkAno]
    ON [cal].[anosDecendiosOrdinais]
    (
      [anoId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[anosDecendiosOrdinais].[anoDecOrdFkAno] >>>'
  ALTER TABLE [cal].[anosDecendiosOrdinais]
    ADD CONSTRAINT [anoDecOrdFkAno]
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

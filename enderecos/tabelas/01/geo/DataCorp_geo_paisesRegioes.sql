/*
* TABELA: [DataCorp].[geo].[paisesRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFkReg] >>>'
  IF OBJECT_ID('[geo].[paiRegFkReg]') IS NOT NULL
    ALTER TABLE [geo].[paisesRegioes]
      DROP CONSTRAINT [paiRegFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFkPai] >>>'
  IF OBJECT_ID('[geo].[paiRegFkPai]') IS NOT NULL
    ALTER TABLE [geo].[paisesRegioes]
      DROP CONSTRAINT [paiRegFkPai]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[paisesRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'paisesRegioes' )
  BEGIN
    DROP TABLE [geo].[paisesRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[paisesRegioes]
  (

    [paiRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [paisesRegioespaiRegIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [paisesRegioesregIdNn] NOT NULL

  , [paiId]
      BIGINT
      CONSTRAINT [paisesRegioespaiIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[paisesRegioes].[paiRegPk] >>>'
  ALTER TABLE [geo].[paisesRegioes]
    ADD CONSTRAINT [paiRegPk]
      PRIMARY KEY CLUSTERED
      (
        [paiRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxAk')
  BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxAk] >>>'
  CREATE UNIQUE INDEX [paiRegIxAk]
    ON [geo].[paisesRegioes]
    (
      [regId]
    , [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxFkReg')
  BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [paiRegIxFkReg]
    ON [geo].[paisesRegioes]
    (
      [regId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFkReg] >>>'
  ALTER TABLE [geo].[paisesRegioes]
    ADD CONSTRAINT [paiRegFkReg]
    FOREIGN KEY
    (
      [regId]
    )
    REFERENCES [DataCorp].[geo].[regioes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesRegioes].[paiRegIxFkPai] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxFkPai')
  BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxFkPai]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [paiRegIxFkPai]
    ON [geo].[paisesRegioes]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesRegioes].[paiRegFkPai] >>>'
  ALTER TABLE [geo].[paisesRegioes]
    ADD CONSTRAINT [paiRegFkPai]
    FOREIGN KEY
    (
      [paiId]
    )
    REFERENCES [DataCorp].[geo].[paises]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

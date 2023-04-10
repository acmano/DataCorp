/*
* TABELA: [DataCorp].[geo].[paisesSubRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFkSubReg] >>>'
  IF OBJECT_ID('[geo].[paiSubRegFkSubReg]') IS NOT NULL
    ALTER TABLE [geo].[paisesSubRegioes]
      DROP CONSTRAINT [paiSubRegFkSubReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFkPai] >>>'
  IF OBJECT_ID('[geo].[paiSubRegFkPai]') IS NOT NULL
    ALTER TABLE [geo].[paisesSubRegioes]
      DROP CONSTRAINT [paiSubRegFkPai]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[paisesSubRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'paisesSubRegioes' )
  BEGIN
    DROP TABLE [geo].[paisesSubRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[paisesSubRegioes]
  (

    [paiSubRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [paisesSubRegioespaiSubRegIdNn] NOT NULL

  , [subRegId]
      BIGINT
      CONSTRAINT [paisesSubRegioessubRegIdNn] NOT NULL

  , [paiId]
      BIGINT
      CONSTRAINT [paisesSubRegioespaiIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegPk] >>>'
  ALTER TABLE [geo].[paisesSubRegioes]
    ADD CONSTRAINT [paiSubRegPk]
      PRIMARY KEY CLUSTERED
      (
        [paiSubRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxAk')
  BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxAk] >>>'
  CREATE UNIQUE INDEX [paiSubRegIxAk]
    ON [geo].[paisesSubRegioes]
    (
      [subRegId]
    , [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxFkSubReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxFkSubReg')
  BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxFkSubReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE INDEX [paiSubRegIxFkSubReg]
    ON [geo].[paisesSubRegioes]
    (
      [subRegId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFkSubReg] >>>'
  ALTER TABLE [geo].[paisesSubRegioes]
    ADD CONSTRAINT [paiSubRegFkSubReg]
    FOREIGN KEY
    (
      [subRegId]
    )
    REFERENCES [DataCorp].[geo].[subRegioes]
    (
      [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxFkPai] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxFkPai')
  BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxFkPai]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [paiSubRegIxFkPai]
    ON [geo].[paisesSubRegioes]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFkPai] >>>'
  ALTER TABLE [geo].[paisesSubRegioes]
    ADD CONSTRAINT [paiSubRegFkPai]
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

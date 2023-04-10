/*
* TABELA: [DataCorp].[cal].[bimestresQuadrimestres]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaFkQua] >>>'
  IF OBJECT_ID('[cal].[bimQuaFkQua]') IS NOT NULL
    ALTER TABLE [cal].[bimestresQuadrimestres]
      DROP CONSTRAINT [bimQuaFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaFkBim] >>>'
  IF OBJECT_ID('[cal].[bimQuaFkBim]') IS NOT NULL
    ALTER TABLE [cal].[bimestresQuadrimestres]
      DROP CONSTRAINT [bimQuaFkBim]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[bimestresQuadrimestres] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'bimestresQuadrimestres' )
  BEGIN
    DROP TABLE [cal].[bimestresQuadrimestres]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[bimestresQuadrimestres]
  (

    [bimQuaId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [bimestresQuadrimestresbimQuaIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [bimestresQuadrimestresquaIdNn] NOT NULL

  , [bimId]
      BIGINT
      CONSTRAINT [bimestresQuadrimestresbimIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaPk] >>>'
  ALTER TABLE [cal].[bimestresQuadrimestres]
    ADD CONSTRAINT [bimQuaPk]
      PRIMARY KEY CLUSTERED
      (
        [bimQuaId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresQuadrimestres') AND name='bimQuaIxAk')
  BEGIN
    DROP INDEX [cal].[bimestresQuadrimestres].[bimQuaIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaIxAk] >>>'
  CREATE UNIQUE INDEX [bimQuaIxAk]
    ON [cal].[bimestresQuadrimestres]
    (
      [quaId]
    , [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresQuadrimestres') AND name='bimQuaIxFkQua')
  BEGIN
    DROP INDEX [cal].[bimestresQuadrimestres].[bimQuaIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [bimQuaIxFkQua]
    ON [cal].[bimestresQuadrimestres]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaFkQua] >>>'
  ALTER TABLE [cal].[bimestresQuadrimestres]
    ADD CONSTRAINT [bimQuaFkQua]
    FOREIGN KEY
    (
      [quaId]
    )
    REFERENCES [DataCorp].[cal].[quadrimestres]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaIxFkBim] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.bimestresQuadrimestres') AND name='bimQuaIxFkBim')
  BEGIN
    DROP INDEX [cal].[bimestresQuadrimestres].[bimQuaIxFkBim]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [bimQuaIxFkBim]
    ON [cal].[bimestresQuadrimestres]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[bimestresQuadrimestres].[bimQuaFkBim] >>>'
  ALTER TABLE [cal].[bimestresQuadrimestres]
    ADD CONSTRAINT [bimQuaFkBim]
    FOREIGN KEY
    (
      [bimId]
    )
    REFERENCES [DataCorp].[cal].[bimestres]
    (
      [bimId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH

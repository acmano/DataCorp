
/*
* TABELA: [DataCorp].[geo].[paises]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paises].[paiFk]   >>>'
  IF OBJECT_ID('[geo].[paiFk]') IS NOT NULL
    ALTER TABLE [geo].[paises]
      DROP CONSTRAINT [paiFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[paises]           >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'paises' )
  BEGIN
    DROP TABLE [geo].[paises]
  END

  SET @erro = 3
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[paises]
  (

    [paiId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [paisesPaiIdNn] NOT NULL

  , [nome]
      VARCHAR(64)
      CONSTRAINT [paisesNomeNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [paisesDescricaoNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[paises].[paiPk] >>>'
  ALTER TABLE [geo].[paises]
    ADD CONSTRAINT [paiPk]
      PRIMARY KEY CLUSTERED
      (
        [paiId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paises].[paiIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paises') AND name='paiIxAk')
  BEGIN
    DROP INDEX [geo].[paises].[paiIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 6
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paises].[paiIxAk] >>>'
  CREATE UNIQUE INDEX [paiIxAk]
    ON [geo].[paises]
    (
      nome
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[paisExiste]      >>>'
  IF OBJECT_ID('[geo].[paisExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[paisExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[paisExiste]
    (
      @nome VARCHAR(64)
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT ;
      IF  @nome IS NOT NULL
        SELECT  @existe = 1
          FROM  [DataCorp].[geo].[paises] tabela
          WHERE tabela.nome = @nome
      IF  @existe != 1
      OR  @existe IS NULL
      BEGIN
        SET @existe = 0
      END
      RETURN @existe
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[paisId]          >>>'
  IF OBJECT_ID('[geo].[paisId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[paisId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[paisId]
    (
      @nome VARCHAR(64)
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF @nome IS NOT NULL
      BEGIN
        SELECT  @ID = tabela.paiId
          FROM  [DataCorp].[geo].[paises] tabela
          WHERE tabela.nome = @nome
        IF @Id IS NULL
          SET @Id = 0
      END
      RETURN @Id
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[paisInclui]      >>>'
  IF OBJECT_ID('[geo].[paisInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[paisInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[paisInclui]
    (
      @nome      VARCHAR(64)
    , @descricao VARCHAR(128)
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @ID INTEGER
      IF  @nome      IS NOT NULL
      AND @descricao IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          IF  [DataCorp].[geo].[paisExiste] ( @nome ) = 0
          BEGIN
            INSERT
              INTO  [DataCorp].[geo].[paises]
              (
                nome
              , descricao
              )
              VALUES
              (
                @nome
              , @descricao
              )
          END
          ELSE
          BEGIN
            UPDATE  [DataCorp].[geo].[paises]
              SET   descricao = @descricao
              WHERE paiId = [DataCorp].[geo].[paisId] ( @nome )
          END
        END TRY
        BEGIN CATCH
          SELECT  ERROR_NUMBER() AS ErrorNumber
                , ERROR_SEVERITY() AS ErrorSeverity
                , ERROR_STATE() AS ErrorState
                , ERROR_PROCEDURE() AS ErrorProcedure
                , ERROR_LINE() AS ErrorLine
                , ERROR_MESSAGE() AS ErrorMessage;
          IF (XACT_STATE()) = -1
          BEGIN
            PRINT ''[DataCorp].[geo].[paisInclui] não pode ser concluída. Rolling back transaction.''
            ROLLBACK TRANSACTION;
          END
        END CATCH
        IF (XACT_STATE()) = 1
          COMMIT TRANSACTION;
      END
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  DECLARE @ErrorSeverity INTEGER = ERROR_SEVERITY()
  DECLARE @ErrorState    INTEGER = ERROR_STATE()
  DECLARE @ErrorMessage  VARCHAR(4000) = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4 + char(10) + ERROR_MESSAGE()
  RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
END CATCH


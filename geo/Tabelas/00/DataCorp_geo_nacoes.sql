/*
* TABELA: [DataCorp].[geo].[nacoes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoes].[nacFk]   >>>'
  IF OBJECT_ID('[geo].[nacFk]') IS NOT NULL
    ALTER TABLE [geo].[nacoes]
      DROP CONSTRAINT [nacFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoes]           >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoes' )
  BEGIN
    DROP TABLE [geo].[nacoes]
  END

  SET @erro = 3
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoes]
  (

    [nacId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesNacIdNn] NOT NULL

  , [m49]
      INTEGER
      CONSTRAINT [nacoesM49Nn] NOT NULL

  , [isoAlpha2]
      CHAR(2)

  , [isoAlpha3]
      CHAR(3)

  , [latitude]
      DECIMAL(18,15)

  , [longitude]
      DECIMAL(18,15)

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoes].[nacPk] >>>'
  ALTER TABLE [geo].[nacoes]
    ADD CONSTRAINT [nacPk]
      PRIMARY KEY CLUSTERED
      (
        [nacId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIxAk')
  BEGIN
    DROP INDEX [geo].[nacoes].[nacIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 6
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIxAk] >>>'
  CREATE UNIQUE INDEX [nacIxAk]
    ON [geo].[nacoes]
    (
      m49
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIx00] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIx00')
  BEGIN
    DROP INDEX [geo].[nacoes].[nacIx00]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIx00] >>>'
  CREATE        INDEX [nacIx00]
    ON [geo].[nacoes]
    (
      [latitude]
    , [longitude]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIx01] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIx01')
  BEGIN
    DROP INDEX [geo].[nacoes].[nacIx01]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIx01] >>>'
  CREATE        INDEX [nacIx01]
    ON [geo].[nacoes]
    (
      [isoAlpha2]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIx02] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIx02')
  BEGIN
    DROP INDEX [geo].[nacoes].[nacIx02]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoes].[nacIx02] >>>'
  CREATE        INDEX [nacIx02]
    ON [geo].[nacoes]
    (
      [isoAlpha3]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoExiste]      >>>'
  IF OBJECT_ID('[geo].[nacaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[nacaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoExiste]
    (
      @m49 INTEGER
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT ;
      IF  @m49 IS NOT NULL
        SELECT  @existe = 1
          FROM  [DataCorp].[geo].[nacoes] tabela
          WHERE tabela.m49 = @m49
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

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoId]          >>>'
  IF OBJECT_ID('[geo].[nacaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[nacaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 15
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoId]
    (
      @m49 INTEGER
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF @m49 IS NOT NULL
      BEGIN
        SELECT  @ID = tabela.nacId
          FROM  [DataCorp].[geo].[nacoes] tabela
          WHERE tabela.m49 = @m49
        IF @Id IS NULL
          SET @Id = 0
      END
      RETURN @Id
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 16
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[nacaoInclui]      >>>'
  IF OBJECT_ID('[geo].[nacaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[nacaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 17
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[nacaoInclui]
    (
      @m49      INTEGER
    , @isoAlpha2 CHAR(2)        = NULL
    , @isoAlpha3 CHAR(3)        = NULL
    , @latitude  DECIMAL(18,15) = NULL
    , @longitude DECIMAL(18,15) = NULL
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @ID INTEGER
      IF  @m49       IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          IF  [DataCorp].[geo].[nacaoExiste] ( @m49 ) = 0
          BEGIN
            INSERT
              INTO  [DataCorp].[geo].[nacoes]
              (
                m49
              , isoAlpha2
              , isoAlpha3
              , latitude
              , longitude
              )
              VALUES
              (
                @m49
              , @isoAlpha2
              , @isoAlpha3
              , @latitude
              , @longitude
              )
          END
          ELSE
          BEGIN
            UPDATE  [DataCorp].[geo].[nacoes]
              SET   isoAlpha2 = @isoAlpha2
                  , isoAlpha3 = @isoAlpha3
                  , latitude  = @latitude
                  , longitude = @longitude
              WHERE nacId = [DataCorp].[geo].[nacaoId] ( @m49 )
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
            PRINT ''[DataCorp].[geo].[nacaoInclui] não pode ser concluída. Rolling back transaction.''
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


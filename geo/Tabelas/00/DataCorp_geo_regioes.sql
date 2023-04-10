
/*
* TABELA: [DataCorp].[geo].[regioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[regioes].[regFk]   >>>'
  IF OBJECT_ID('[geo].[regFk]') IS NOT NULL
    ALTER TABLE [geo].[regioes]
      DROP CONSTRAINT [regFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[regioes]           >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'regioes' )
  BEGIN
    DROP TABLE [geo].[regioes]
  END

  SET @erro = 3
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[regioes]
  (

    [regId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [regioesRegIdNn] NOT NULL

  , [nome]
      VARCHAR(64)
      CONSTRAINT [regioesNomeNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [regioesDescricaoNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[regioes].[regPk] >>>'
  ALTER TABLE [geo].[regioes]
    ADD CONSTRAINT [regPk]
      PRIMARY KEY CLUSTERED
      (
        [regId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioes].[regIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioes') AND name='regIxAk')
  BEGIN
    DROP INDEX [geo].[regioes].[regIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 6
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[regioes].[regIxAk] >>>'
  CREATE UNIQUE INDEX [regIxAk]
    ON [geo].[regioes]
    (
      nome
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[regiaoExiste]      >>>'
  IF OBJECT_ID('[geo].[regiaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[regiaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[regiaoExiste]
    (
      @nome VARCHAR(64)
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT ;
      IF  @nome IS NOT NULL
        SELECT  @existe = 1
          FROM  [DataCorp].[geo].[regioes] tabela
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[regiaoId]          >>>'
  IF OBJECT_ID('[geo].[regiaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[regiaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[regiaoId]
    (
      @nome VARCHAR(64)
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF @nome IS NOT NULL
      BEGIN
        SELECT  @ID = tabela.regId
          FROM  [DataCorp].[geo].[regioes] tabela
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
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[regiaoInclui]      >>>'
  IF OBJECT_ID('[geo].[regiaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[regiaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[regiaoInclui]
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
          IF  [DataCorp].[geo].[regiaoExiste] ( @nome ) = 0
          BEGIN
            INSERT
              INTO  [DataCorp].[geo].[regioes]
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
            UPDATE  [DataCorp].[geo].[regioes]
              SET   descricao = @descricao
              WHERE regId = [DataCorp].[geo].[regiaoId] ( @nome )
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
            PRINT ''[DataCorp].[geo].[regiaoInclui] não pode ser concluída. Rolling back transaction.''
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


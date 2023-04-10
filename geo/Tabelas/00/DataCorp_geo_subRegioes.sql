
/*
* TABELA: [DataCorp].[geo].[subRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioes].[subRegFk]   >>>'
  IF OBJECT_ID('[geo].[subRegFk]') IS NOT NULL
    ALTER TABLE [geo].[subRegioes]
      DROP CONSTRAINT [subRegFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[subRegioes]           >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'subRegioes' )
  BEGIN
    DROP TABLE [geo].[subRegioes]
  END

  SET @erro = 3
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[subRegioes]
  (

    [subRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [subRegioesSubRegIdNn] NOT NULL

  , [nome]
      VARCHAR(64)
      CONSTRAINT [subRegioesNomeNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [subRegioesDescricaoNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[subRegioes].[subRegPk] >>>'
  ALTER TABLE [geo].[subRegioes]
    ADD CONSTRAINT [subRegPk]
      PRIMARY KEY CLUSTERED
      (
        [subRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioes].[subRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioes') AND name='subRegIxAk')
  BEGIN
    DROP INDEX [geo].[subRegioes].[subRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 6
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioes].[subRegIxAk] >>>'
  CREATE UNIQUE INDEX [subRegIxAk]
    ON [geo].[subRegioes]
    (
      nome
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[subRegiaoExiste]      >>>'
  IF OBJECT_ID('[geo].[subRegiaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[subRegiaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[subRegiaoExiste]
    (
      @nome VARCHAR(64)
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT ;
      IF  @nome IS NOT NULL
        SELECT  @existe = 1
          FROM  [DataCorp].[geo].[subRegioes] tabela
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[subRegiaoId]          >>>'
  IF OBJECT_ID('[geo].[subRegiaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[subRegiaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[subRegiaoId]
    (
      @nome VARCHAR(64)
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF @nome IS NOT NULL
      BEGIN
        SELECT  @ID = tabela.subRegId
          FROM  [DataCorp].[geo].[subRegioes] tabela
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
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[subRegiaoInclui]      >>>'
  IF OBJECT_ID('[geo].[subRegiaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[subRegiaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[subRegiaoInclui]
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
          IF  [DataCorp].[geo].[subRegiaoExiste] ( @nome ) = 0
          BEGIN
            INSERT
              INTO  [DataCorp].[geo].[subRegioes]
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
            UPDATE  [DataCorp].[geo].[subRegioes]
              SET   descricao = @descricao
              WHERE subRegId = [DataCorp].[geo].[subRegiaoId] ( @nome )
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
            PRINT ''[DataCorp].[geo].[subRegiaoInclui] não pode ser concluída. Rolling back transaction.''
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


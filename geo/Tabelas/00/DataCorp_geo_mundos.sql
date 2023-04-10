
/*
* TABELA: [DataCorp].[geo].[mundos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[mundos].[munFk]   >>>'
  IF OBJECT_ID('[geo].[munFk]') IS NOT NULL
    ALTER TABLE [geo].[mundos]
      DROP CONSTRAINT [munFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[mundos]           >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'mundos' )
  BEGIN
    DROP TABLE [geo].[mundos]
  END

  SET @erro = 3
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[mundos]
  (

    [munId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [mundosMunIdNn] NOT NULL

  , [nome]
      VARCHAR(64)
      CONSTRAINT [mundosNomeNn] NOT NULL

  , [descricao]
      VARCHAR(128)
      CONSTRAINT [mundosDescricaoNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[mundos].[munPk] >>>'
  ALTER TABLE [geo].[mundos]
    ADD CONSTRAINT [munPk]
      PRIMARY KEY CLUSTERED
      (
        [munId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[mundos].[munIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.mundos') AND name='munIxAk')
  BEGIN
    DROP INDEX [geo].[mundos].[munIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 6
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[mundos].[munIxAk] >>>'
  CREATE UNIQUE INDEX [munIxAk]
    ON [geo].[mundos]
    (
      nome
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[mundoExiste]      >>>'
  IF OBJECT_ID('[geo].[mundoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[mundoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[mundoExiste]
    (
      @nome VARCHAR(64)
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT ;
      IF  @nome IS NOT NULL
        SELECT  @existe = 1
          FROM  [DataCorp].[geo].[mundos] tabela
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[mundoId]          >>>'
  IF OBJECT_ID('[geo].[mundoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[mundoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[mundoId]
    (
      @nome VARCHAR(64)
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF @nome IS NOT NULL
      BEGIN
        SELECT  @ID = tabela.munId
          FROM  [DataCorp].[geo].[mundos] tabela
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
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[mundoInclui]      >>>'
  IF OBJECT_ID('[geo].[mundoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[mundoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[mundoInclui]
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
          IF  [DataCorp].[geo].[mundoExiste] ( @nome ) = 0
          BEGIN
            INSERT
              INTO  [DataCorp].[geo].[mundos]
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
            UPDATE  [DataCorp].[geo].[mundos]
              SET   descricao = @descricao
              WHERE munId = [DataCorp].[geo].[mundoId] ( @nome )
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
            PRINT ''[DataCorp].[geo].[mundoInclui] não pode ser concluída. Rolling back transaction.''
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


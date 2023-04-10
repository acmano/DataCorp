
--  mestreTabelaPrefixo           = mun
--  mestreTabelaPrefixoMaiuscula  = Mun
--  mestreTabelaNomeSingular      = mundo
--  mestreTabelaChave             = munId
--  mestreTabelaChaveAk           = mundoNome
--  mestreFuncaoExiste            = mundoExiste
--  mestreFuncaoId                = mundoId
--  detalheTabelaPrefixo          = nac
--  detalheTabelaPrefixoMaiuscula = Nac
--  detalheTabelaNomeSingular     = nacao
--  detalheTabelaChave            = nacId
--  detalheTabelaChaveAk          = nacaoNome
--  detalheFuncaoExiste           = nacaoExiste
--  detalheFuncaoId               = nacaoId
--  novaTabelaNomeSingular        = nacaoMundo
--  novaTabelaPk                  = nacMun
--  novaTabelaPkNome              = nacMunPk
--  novaTabelaChave               = nacMunId
--  novaTabelaChaveMaiuscula      = NacMunId
--  novaTabelaNomePrefixo         = nacMun
--  novaTabelaIxAkNome            = nacMunIxAk
--  novaTabelaIxFkMestreNome      = nacMunIxFkMun
--  novaTabelaFkMestreNome        = nacMunFkMun
--  novaTabelaIxFkDetalheNome     = nacMunIxFk
--  novaTabelaFkDetalheNome       = nacMunFk
--  novaTabelaFuncaoInclui        = nacaoMundoInclui

/*
* TABELA: [DataCorp].[geo].[nacoesMundos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFkMun] >>>'
  IF OBJECT_ID('[geo].[nacMunFkMun]') IS NOT NULL
    ALTER TABLE [geo].[nacoesMundos]
      DROP CONSTRAINT [nacMunFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFk] >>>'
  IF OBJECT_ID('[geo].[nacMunFk]') IS NOT NULL
    ALTER TABLE [geo].[nacoesMundos]
      DROP CONSTRAINT [nacMunFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesMundos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesMundos' )
  BEGIN
    DROP TABLE [geo].[nacoesMundos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesMundos]
  (

    [nacMunId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesMundosNacMunIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [nacoesMundosMunIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesMundosNacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesMundos].[nacMunPk] >>>'
  ALTER TABLE [geo].[nacoesMundos]
    ADD CONSTRAINT [nacMunPk]
      PRIMARY KEY CLUSTERED
      (
        [nacMunId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxAk] >>>'
  CREATE UNIQUE INDEX [nacMunIxAk]
    ON [geo].[nacoesMundos]
    (
      [munId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxFkMun')
  BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [nacMunIxFkMun]
    ON [geo].[nacoesMundos]
    (
      [munId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFkMun] >>>'
  ALTER TABLE [geo].[nacoesMundos]
    ADD CONSTRAINT [nacMunFkMun]
    FOREIGN KEY
    (
      [munId]
    )
    REFERENCES [DataCorp].[geo].[mundos]
    (
      [munId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesMundos].[nacMunIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxFk')
  BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacMunIxFk]
    ON [geo].[nacoesMundos]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoMundoExiste]      >>>'
  IF OBJECT_ID('[geo].[nacaoMundoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[nacaoMundoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoMundoExiste]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  INTEGER
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT = 0 ;
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        SELECT  @existe = 1
          FROM       [DataCorp].[geo].[mundos] mestre
          INNER JOIN [DataCorp].[geo].[nacoesMundos] nova
            ON  nova.munId = mestre.munId
          INNER JOIN [DataCorp].[geo].[nacoes] detalhe
            ON  detalhe.nacId = nova.nacId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.m49  = @detalheNome
      END
      IF  @existe != 1
      OR  @existe IS NULL
      BEGIN
        SET @existe = 0
      END
      RETURN @existe
    END
  ')

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoMundoId]          >>>'
  IF OBJECT_ID('[geo].[nacaoMundoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[nacaoMundoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoMundoId]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  INTEGER
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF  @mestreNome IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        SELECT  @ID = nova.nacMunId
          FROM       [DataCorp].[geo].[mundos] mestre
          INNER JOIN [DataCorp].[geo].[nacoesMundos] nova
            ON  nova.munId = mestre.munId
          INNER JOIN [DataCorp].[geo].[nacoes] detalhe
            ON  detalhe.nacId = nova.nacId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.m49  = @detalheNome
        IF @Id IS NULL
          SET @Id = 0
      END
      RETURN @Id
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesMundos].[nacMunFk] >>>'
  ALTER TABLE [geo].[nacoesMundos]
    ADD CONSTRAINT [nacMunFk]
    FOREIGN KEY
    (
      [nacId]
    )
    REFERENCES [DataCorp].[geo].[nacoes]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[nacaoMundoInclui]      >>>'
  IF OBJECT_ID('[geo].[nacaoMundoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[nacaoMundoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[nacaoMundoInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  INTEGER
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @munId  INTEGER
      DECLARE @nacId INTEGER
      DECLARE @erroNumero            INTEGER
      DECLARE @mensagem              VARCHAR(100)
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          SET @erroNumero = 1
          SET @mensagem = ''Execução: [geo].[mundoExiste] ( @mestreNome ) não existe!''
          IF  [geo].[mundoExiste] ( @mestreNome ) = 1
          BEGIN
            SET @erroNumero = 2
            SET @mensagem = ''Execução: [geo].[mundoId] ( @mestreNome ) não encontrado!''
            SET @munId = [geo].[mundoId] ( @mestreNome )
            IF  @munId != 0
            BEGIN
              SET @erroNumero = 3
              SET @mensagem = ''Execução: [geo].[nacaoExiste] ( @detalheNome ) não existe!''
              IF  [geo].[nacaoExiste] ( @detalheNome ) = 1
              BEGIN
                SET @erroNumero = 4
                SET @mensagem = ''Execução: [geo].[nacaoId] ( @detalheNome ) não encontrado!''
                SET @nacId = [geo].[nacaoId] ( @detalheNome )
                IF  @nacId != 0
                BEGIN
                  SET @erroNumero = 5
                  SET @mensagem = ''Execução: [DataCorp].[geo].[nacaoMundoExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[nacaoMundoExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[nacoesMundos] VALUES ( @munId , @nacId )''
                    INSERT
                      INTO  [geo].[nacoesMundos]
                      (
                        munId
                      , nacId
                      )
                      VALUES
                      (
                        @munId
                      , @nacId
                      )
                    SET @erroNumero = 0
                  END
                  ELSE
                    SET @erroNumero = 0
                END
                ELSE
                  SET @erroNumero = 0
              END
              ELSE
                SET @erroNumero = 0
            END
            ELSE
              SET @erroNumero = 0
          END
          ELSE
            SET @erroNumero = 0
          IF  @erroNumero!=0
            THROW 59999, @mensagem, @erroNumero
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
            PRINT ''[geo].[nacaoMundoInclui] não pode ser concluída. Rolling back transaction.''
            ROLLBACK TRANSACTION;
          END
        END CATCH
        IF (XACT_STATE()) = 1
          COMMIT TRANSACTION;
      END
    END
  ')

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
  DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
  DECLARE @ErrorState INT = ERROR_STATE()
  SET @ErrorMessage = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4 + char(10) + @ErrorMessage
  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
END CATCH

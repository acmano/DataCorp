
--  mestreTabelaPrefixo           = mun
--  mestreTabelaPrefixoMaiuscula  = Mun
--  mestreTabelaNomeSingular      = mundo
--  mestreTabelaChave             = munId
--  mestreTabelaChaveAk           = mundoNome
--  mestreFuncaoExiste            = mundoExiste
--  mestreFuncaoId                = mundoId
--  detalheTabelaPrefixo          = ctn
--  detalheTabelaPrefixoMaiuscula = Ctn
--  detalheTabelaNomeSingular     = continente
--  detalheTabelaChave            = ctnId
--  detalheTabelaChaveAk          = continenteNome
--  detalheFuncaoExiste           = continenteExiste
--  detalheFuncaoId               = continenteId
--  novaTabelaNomeSingular        = continenteMundo
--  novaTabelaPk                  = ctnMun
--  novaTabelaPkNome              = ctnMunPk
--  novaTabelaChave               = ctnMunId
--  novaTabelaChaveMaiuscula      = CtnMunId
--  novaTabelaNomePrefixo         = ctnMun
--  novaTabelaIxAkNome            = ctnMunIxAk
--  novaTabelaIxFkMestreNome      = ctnMunIxFkMun
--  novaTabelaFkMestreNome        = ctnMunFkMun
--  novaTabelaIxFkDetalheNome     = ctnMunIxFk
--  novaTabelaFkDetalheNome       = ctnMunFk
--  novaTabelaFuncaoInclui        = continenteMundoInclui

/*
* TABELA: [DataCorp].[geo].[continentesMundos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[ctnMunFkMun] >>>'
  IF OBJECT_ID('[geo].[ctnMunFkMun]') IS NOT NULL
    ALTER TABLE [geo].[continentesMundos]
      DROP CONSTRAINT [ctnMunFkMun]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[ctnMunFk] >>>'
  IF OBJECT_ID('[geo].[ctnMunFk]') IS NOT NULL
    ALTER TABLE [geo].[continentesMundos]
      DROP CONSTRAINT [ctnMunFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[continentesMundos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'continentesMundos' )
  BEGIN
    DROP TABLE [geo].[continentesMundos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[continentesMundos]
  (

    [ctnMunId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [continentesMundosCtnMunIdNn] NOT NULL

  , [munId]
      BIGINT
      CONSTRAINT [continentesMundosMunIdNn] NOT NULL

  , [ctnId]
      BIGINT
      CONSTRAINT [continentesMundosCtnIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[continentesMundos].[ctnMunPk] >>>'
  ALTER TABLE [geo].[continentesMundos]
    ADD CONSTRAINT [ctnMunPk]
      PRIMARY KEY CLUSTERED
      (
        [ctnMunId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[ctnMunIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnMunIxAk')
  BEGIN
    DROP INDEX [geo].[continentesMundos].[ctnMunIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[ctnMunIxAk] >>>'
  CREATE UNIQUE INDEX [ctnMunIxAk]
    ON [geo].[continentesMundos]
    (
      [munId]
    , [ctnId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[ctnMunIxFkMun] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnMunIxFkMun')
  BEGIN
    DROP INDEX [geo].[continentesMundos].[ctnMunIxFkMun]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [ctnMunIxFkMun]
    ON [geo].[continentesMundos]
    (
      [munId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[ctnMunFkMun] >>>'
  ALTER TABLE [geo].[continentesMundos]
    ADD CONSTRAINT [ctnMunFkMun]
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
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[continentesMundos].[ctnMunIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnMunIxFk')
  BEGIN
    DROP INDEX [geo].[continentesMundos].[ctnMunIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [ctnMunIxFk]
    ON [geo].[continentesMundos]
    (
      [ctnId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[continenteMundoExiste]      >>>'
  IF OBJECT_ID('[geo].[continenteMundoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[continenteMundoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[continenteMundoExiste]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    RETURNS SMALLINT
    BEGIN
      DECLARE @existe SMALLINT = 0 ;
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        SELECT  @existe = 1
          FROM       [DataCorp].[geo].[mundos] mestre
          INNER JOIN [DataCorp].[geo].[continentesMundos] nova
            ON  nova.munId = mestre.munId
          INNER JOIN [DataCorp].[geo].[continentes] detalhe
            ON  detalhe.ctnId = nova.ctnId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.nome = @detalheNome
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[continenteMundoId]          >>>'
  IF OBJECT_ID('[geo].[continenteMundoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[continenteMundoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[continenteMundoId]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    RETURNS INTEGER
    BEGIN
      DECLARE @Id INTEGER
      SET @Id = 0
      IF  @mestreNome IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        SELECT  @ID = nova.ctnMunId
          FROM       [DataCorp].[geo].[mundos] mestre
          INNER JOIN [DataCorp].[geo].[continentesMundos] nova
            ON  nova.munId = mestre.munId
          INNER JOIN [DataCorp].[geo].[continentes] detalhe
            ON  detalhe.ctnId = nova.ctnId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.nome = @detalheNome
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[continentesMundos].[ctnMunFk] >>>'
  ALTER TABLE [geo].[continentesMundos]
    ADD CONSTRAINT [ctnMunFk]
    FOREIGN KEY
    (
      [ctnId]
    )
    REFERENCES [DataCorp].[geo].[continentes]
    (
      [ctnId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[continenteMundoInclui]      >>>'
  IF OBJECT_ID('[geo].[continenteMundoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[continenteMundoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[continenteMundoInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @munId  INTEGER
      DECLARE @ctnId INTEGER
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
              SET @mensagem = ''Execução: [geo].[continenteExiste] ( @detalheNome ) não existe!''
              IF  [geo].[continenteExiste] ( @detalheNome ) = 1
              BEGIN
                SET @erroNumero = 4
                SET @mensagem = ''Execução: [geo].[continenteId] ( @detalheNome ) não encontrado!''
                SET @ctnId = [geo].[continenteId] ( @detalheNome )
                IF  @ctnId != 0
                BEGIN
                  SET @erroNumero = 5
                  SET @mensagem = ''Execução: [DataCorp].[geo].[continenteMundoExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[continenteMundoExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[continentesMundos] VALUES ( @munId , @ctnId )''
                    INSERT
                      INTO  [geo].[continentesMundos]
                      (
                        munId
                      , ctnId
                      )
                      VALUES
                      (
                        @munId
                      , @ctnId
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
            PRINT ''[geo].[continenteMundoInclui] não pode ser concluída. Rolling back transaction.''
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


--  mestreTabelaPrefixo           = pai
--  mestreTabelaPrefixoMaiuscula  = Pai
--  mestreTabelaNomeSingular      = pais
--  mestreTabelaChave             = paiId
--  mestreTabelaChaveAk           = paisNome
--  mestreFuncaoExiste            = paisExiste
--  mestreFuncaoId                = paisId
--  detalheTabelaPrefixo          = nac
--  detalheTabelaPrefixoMaiuscula = Nac
--  detalheTabelaNomeSingular     = nacao
--  detalheTabelaChave            = nacId
--  detalheTabelaChaveAk          = nacaoNome
--  detalheFuncaoExiste           = nacaoExiste
--  detalheFuncaoId               = nacaoId
--  novaTabelaNomeSingular        = nacaoPais
--  novaTabelaPk                  = nacPai
--  novaTabelaPkNome              = nacPaiPk
--  novaTabelaChave               = nacPaiId
--  novaTabelaChaveMaiuscula      = NacPaiId
--  novaTabelaNomePrefixo         = nacPai
--  novaTabelaIxAkNome            = nacPaiIxAk
--  novaTabelaIxFkMestreNome      = nacPaiIxFkPai
--  novaTabelaFkMestreNome        = nacPaiFkPai
--  novaTabelaIxFkDetalheNome     = nacPaiIxFk
--  novaTabelaFkDetalheNome       = nacPaiFk
--  novaTabelaFuncaoInclui        = nacaoPaisInclui

/*
* TABELA: [DataCorp].[geo].[nacoesPaises]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFkPai] >>>'
  IF OBJECT_ID('[geo].[nacPaiFkPai]') IS NOT NULL
    ALTER TABLE [geo].[nacoesPaises]
      DROP CONSTRAINT [nacPaiFkPai]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFk] >>>'
  IF OBJECT_ID('[geo].[nacPaiFk]') IS NOT NULL
    ALTER TABLE [geo].[nacoesPaises]
      DROP CONSTRAINT [nacPaiFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesPaises] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesPaises' )
  BEGIN
    DROP TABLE [geo].[nacoesPaises]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesPaises]
  (

    [nacPaiId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesPaisesNacPaiIdNn] NOT NULL

  , [paiId]
      BIGINT
      CONSTRAINT [nacoesPaisesPaiIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesPaisesNacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesPaises].[nacPaiPk] >>>'
  ALTER TABLE [geo].[nacoesPaises]
    ADD CONSTRAINT [nacPaiPk]
      PRIMARY KEY CLUSTERED
      (
        [nacPaiId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxAk] >>>'
  CREATE UNIQUE INDEX [nacPaiIxAk]
    ON [geo].[nacoesPaises]
    (
      [paiId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxFkPai] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxFkPai')
  BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxFkPai]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [nacPaiIxFkPai]
    ON [geo].[nacoesPaises]
    (
      [paiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFkPai] >>>'
  ALTER TABLE [geo].[nacoesPaises]
    ADD CONSTRAINT [nacPaiFkPai]
    FOREIGN KEY
    (
      [paiId]
    )
    REFERENCES [DataCorp].[geo].[paises]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesPaises].[nacPaiIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxFk')
  BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacPaiIxFk]
    ON [geo].[nacoesPaises]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoPaisExiste]      >>>'
  IF OBJECT_ID('[geo].[nacaoPaisExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[nacaoPaisExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoPaisExiste]
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
          FROM       [DataCorp].[geo].[paises] mestre
          INNER JOIN [DataCorp].[geo].[nacoesPaises] nova
            ON  nova.paiId = mestre.paiId
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoPaisId]          >>>'
  IF OBJECT_ID('[geo].[nacaoPaisId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[nacaoPaisId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoPaisId]
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
        SELECT  @ID = nova.nacPaiId
          FROM       [DataCorp].[geo].[paises] mestre
          INNER JOIN [DataCorp].[geo].[nacoesPaises] nova
            ON  nova.paiId = mestre.paiId
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesPaises].[nacPaiFk] >>>'
  ALTER TABLE [geo].[nacoesPaises]
    ADD CONSTRAINT [nacPaiFk]
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
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[nacaoPaisInclui]      >>>'
  IF OBJECT_ID('[geo].[nacaoPaisInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[nacaoPaisInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[nacaoPaisInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  INTEGER
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @paiId  INTEGER
      DECLARE @nacId INTEGER
      DECLARE @erroNumero            INTEGER
      DECLARE @mensagem              VARCHAR(100)
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          SET @erroNumero = 1
          SET @mensagem = ''Execu��o: [geo].[paisExiste] ( @mestreNome ) n�o existe!''
          IF  [geo].[paisExiste] ( @mestreNome ) = 1
          BEGIN
            SET @erroNumero = 2
            SET @mensagem = ''Execu��o: [geo].[paisId] ( @mestreNome ) n�o encontrado!''
            SET @paiId = [geo].[paisId] ( @mestreNome )
            IF  @paiId != 0
            BEGIN
              SET @erroNumero = 3
              SET @mensagem = ''Execu��o: [geo].[nacaoExiste] ( @detalheNome ) n�o existe!''
              IF  [geo].[nacaoExiste] ( @detalheNome ) = 1
              BEGIN
                SET @erroNumero = 4
                SET @mensagem = ''Execu��o: [geo].[nacaoId] ( @detalheNome ) n�o encontrado!''
                SET @nacId = [geo].[nacaoId] ( @detalheNome )
                IF  @nacId != 0
                BEGIN
                  SET @erroNumero = 5
                  SET @mensagem = ''Execu��o: [DataCorp].[geo].[nacaoPaisExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[nacaoPaisExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execu��o: INSERT INTO  [geo].[nacoesPaises] VALUES ( @paiId , @nacId )''
                    INSERT
                      INTO  [geo].[nacoesPaises]
                      (
                        paiId
                      , nacId
                      )
                      VALUES
                      (
                        @paiId
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
            PRINT ''[geo].[nacaoPaisInclui] n�o pode ser conclu�da. Rolling back transaction.''
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

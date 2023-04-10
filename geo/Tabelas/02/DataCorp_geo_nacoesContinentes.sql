
--  mestreTabelaPrefixo           = ctn
--  mestreTabelaPrefixoMaiuscula  = Ctn
--  mestreTabelaNomeSingular      = continente
--  mestreTabelaChave             = ctnId
--  mestreTabelaChaveAk           = continenteNome
--  mestreFuncaoExiste            = continenteExiste
--  mestreFuncaoId                = continenteId
--  detalheTabelaPrefixo          = nac
--  detalheTabelaPrefixoMaiuscula = Nac
--  detalheTabelaNomeSingular     = nacao
--  detalheTabelaChave            = nacId
--  detalheTabelaChaveAk          = nacaoNome
--  detalheFuncaoExiste           = nacaoExiste
--  detalheFuncaoId               = nacaoId
--  novaTabelaNomeSingular        = nacaoContinente
--  novaTabelaPk                  = nacCtn
--  novaTabelaPkNome              = nacCtnPk
--  novaTabelaChave               = nacCtnId
--  novaTabelaChaveMaiuscula      = NacCtnId
--  novaTabelaNomePrefixo         = nacCtn
--  novaTabelaIxAkNome            = nacCtnIxAk
--  novaTabelaIxFkMestreNome      = nacCtnIxFkCtn
--  novaTabelaFkMestreNome        = nacCtnFkCtn
--  novaTabelaIxFkDetalheNome     = nacCtnIxFk
--  novaTabelaFkDetalheNome       = nacCtnFk
--  novaTabelaFuncaoInclui        = nacaoContinenteInclui

/*
* TABELA: [DataCorp].[geo].[nacoesContinentes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacCtnFkCtn] >>>'
  IF OBJECT_ID('[geo].[nacCtnFkCtn]') IS NOT NULL
    ALTER TABLE [geo].[nacoesContinentes]
      DROP CONSTRAINT [nacCtnFkCtn]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacCtnFk] >>>'
  IF OBJECT_ID('[geo].[nacCtnFk]') IS NOT NULL
    ALTER TABLE [geo].[nacoesContinentes]
      DROP CONSTRAINT [nacCtnFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesContinentes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesContinentes' )
  BEGIN
    DROP TABLE [geo].[nacoesContinentes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesContinentes]
  (

    [nacCtnId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesContinentesNacCtnIdNn] NOT NULL

  , [ctnId]
      BIGINT
      CONSTRAINT [nacoesContinentesCtnIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesContinentesNacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesContinentes].[nacCtnPk] >>>'
  ALTER TABLE [geo].[nacoesContinentes]
    ADD CONSTRAINT [nacCtnPk]
      PRIMARY KEY CLUSTERED
      (
        [nacCtnId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacCtnIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacCtnIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacCtnIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacCtnIxAk] >>>'
  CREATE UNIQUE INDEX [nacCtnIxAk]
    ON [geo].[nacoesContinentes]
    (
      [ctnId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacCtnIxFkCtn] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacCtnIxFkCtn')
  BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacCtnIxFkCtn]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [nacCtnIxFkCtn]
    ON [geo].[nacoesContinentes]
    (
      [ctnId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacCtnFkCtn] >>>'
  ALTER TABLE [geo].[nacoesContinentes]
    ADD CONSTRAINT [nacCtnFkCtn]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesContinentes].[nacCtnIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacCtnIxFk')
  BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacCtnIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacCtnIxFk]
    ON [geo].[nacoesContinentes]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoContinenteExiste]      >>>'
  IF OBJECT_ID('[geo].[nacaoContinenteExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[nacaoContinenteExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoContinenteExiste]
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
          FROM       [DataCorp].[geo].[continentes] mestre
          INNER JOIN [DataCorp].[geo].[nacoesContinentes] nova
            ON  nova.ctnId = mestre.ctnId
          INNER JOIN [DataCorp].[geo].[nacoes] detalhe
            ON  detalhe.nacId = nova.nacId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.m49 = @detalheNome
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoContinenteId]          >>>'
  IF OBJECT_ID('[geo].[nacaoContinenteId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[nacaoContinenteId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoContinenteId]
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
        SELECT  @ID = nova.nacCtnId
          FROM       [DataCorp].[geo].[continentes] mestre
          INNER JOIN [DataCorp].[geo].[nacoesContinentes] nova
            ON  nova.ctnId = mestre.ctnId
          INNER JOIN [DataCorp].[geo].[nacoes] detalhe
            ON  detalhe.nacId = nova.nacId
          WHERE mestre.nome  = @mestreNome
          AND   detalhe.m49 = @detalheNome
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesContinentes].[nacCtnFk] >>>'
  ALTER TABLE [geo].[nacoesContinentes]
    ADD CONSTRAINT [nacCtnFk]
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
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[nacaoContinenteInclui]      >>>'
  IF OBJECT_ID('[geo].[nacaoContinenteInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[nacaoContinenteInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[nacaoContinenteInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  INTEGER
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @ctnId  INTEGER
      DECLARE @nacId INTEGER
      DECLARE @erroNumero            INTEGER
      DECLARE @mensagem              VARCHAR(100)
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          SET @erroNumero = 1
          SET @mensagem = ''Execução: [geo].[continenteExiste] ( @mestreNome ) não existe!''
          IF  [geo].[continenteExiste] ( @mestreNome ) = 1
          BEGIN
            SET @erroNumero = 2
            SET @mensagem = ''Execução: [geo].[continenteId] ( @mestreNome ) não encontrado!''
            SET @ctnId = [geo].[continenteId] ( @mestreNome )
            IF  @ctnId != 0
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
                  SET @mensagem = ''Execução: [DataCorp].[geo].[nacaoContinenteExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[nacaoContinenteExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[nacoesContinentes] VALUES ( @ctnId , @nacId )''
                    INSERT
                      INTO  [geo].[nacoesContinentes]
                      (
                        ctnId
                      , nacId
                      )
                      VALUES
                      (
                        @ctnId
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
            PRINT ''[geo].[nacaoContinenteInclui] não pode ser concluída. Rolling back transaction.''
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

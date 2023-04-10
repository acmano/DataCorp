
--  mestreTabelaPrefixo           = reg
--  mestreTabelaPrefixoMaiuscula  = Reg
--  mestreTabelaNomeSingular      = regiao
--  mestreTabelaChave             = regId
--  mestreTabelaChaveAk           = regiaoNome
--  mestreFuncaoExiste            = regiaoExiste
--  mestreFuncaoId                = regiaoId
--  detalheTabelaPrefixo          = nac
--  detalheTabelaPrefixoMaiuscula = Nac
--  detalheTabelaNomeSingular     = nacao
--  detalheTabelaChave            = nacId
--  detalheTabelaChaveAk          = nacaoNome
--  detalheFuncaoExiste           = nacaoExiste
--  detalheFuncaoId               = nacaoId
--  novaTabelaNomeSingular        = nacaoRegiao
--  novaTabelaPk                  = nacReg
--  novaTabelaPkNome              = nacRegPk
--  novaTabelaChave               = nacRegId
--  novaTabelaChaveMaiuscula      = NacRegId
--  novaTabelaNomePrefixo         = nacReg
--  novaTabelaIxAkNome            = nacRegIxAk
--  novaTabelaIxFkMestreNome      = nacRegIxFkReg
--  novaTabelaFkMestreNome        = nacRegFkReg
--  novaTabelaIxFkDetalheNome     = nacRegIxFk
--  novaTabelaFkDetalheNome       = nacRegFk
--  novaTabelaFuncaoInclui        = nacaoRegiaoInclui

/*
* TABELA: [DataCorp].[geo].[nacoesRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesRegioes].[nacRegFkReg] >>>'
  IF OBJECT_ID('[geo].[nacRegFkReg]') IS NOT NULL
    ALTER TABLE [geo].[nacoesRegioes]
      DROP CONSTRAINT [nacRegFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesRegioes].[nacRegFk] >>>'
  IF OBJECT_ID('[geo].[nacRegFk]') IS NOT NULL
    ALTER TABLE [geo].[nacoesRegioes]
      DROP CONSTRAINT [nacRegFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesRegioes' )
  BEGIN
    DROP TABLE [geo].[nacoesRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesRegioes]
  (

    [nacRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesRegioesNacRegIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [nacoesRegioesRegIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesRegioesNacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesRegioes].[nacRegPk] >>>'
  ALTER TABLE [geo].[nacoesRegioes]
    ADD CONSTRAINT [nacRegPk]
      PRIMARY KEY CLUSTERED
      (
        [nacRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesRegioes].[nacRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacRegIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesRegioes].[nacRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesRegioes].[nacRegIxAk] >>>'
  CREATE UNIQUE INDEX [nacRegIxAk]
    ON [geo].[nacoesRegioes]
    (
      [regId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesRegioes].[nacRegIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacRegIxFkReg')
  BEGIN
    DROP INDEX [geo].[nacoesRegioes].[nacRegIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [nacRegIxFkReg]
    ON [geo].[nacoesRegioes]
    (
      [regId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesRegioes].[nacRegFkReg] >>>'
  ALTER TABLE [geo].[nacoesRegioes]
    ADD CONSTRAINT [nacRegFkReg]
    FOREIGN KEY
    (
      [regId]
    )
    REFERENCES [DataCorp].[geo].[regioes]
    (
      [regId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesRegioes].[nacRegIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacRegIxFk')
  BEGIN
    DROP INDEX [geo].[nacoesRegioes].[nacRegIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacRegIxFk]
    ON [geo].[nacoesRegioes]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoRegiaoExiste]      >>>'
  IF OBJECT_ID('[geo].[nacaoRegiaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[nacaoRegiaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoRegiaoExiste]
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
          FROM       [DataCorp].[geo].[regioes] mestre
          INNER JOIN [DataCorp].[geo].[nacoesRegioes] nova
            ON  nova.regId = mestre.regId
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoRegiaoId]          >>>'
  IF OBJECT_ID('[geo].[nacaoRegiaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[nacaoRegiaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoRegiaoId]
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
        SELECT  @ID = nova.nacRegId
          FROM       [DataCorp].[geo].[regioes] mestre
          INNER JOIN [DataCorp].[geo].[nacoesRegioes] nova
            ON  nova.regId = mestre.regId
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesRegioes].[nacRegFk] >>>'
  ALTER TABLE [geo].[nacoesRegioes]
    ADD CONSTRAINT [nacRegFk]
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
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[nacaoRegiaoInclui]      >>>'
  IF OBJECT_ID('[geo].[nacaoRegiaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[nacaoRegiaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[nacaoRegiaoInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  INTEGER
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @regId  INTEGER
      DECLARE @nacId INTEGER
      DECLARE @erroNumero            INTEGER
      DECLARE @mensagem              VARCHAR(100)
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          SET @erroNumero = 1
          SET @mensagem = ''Execução: [geo].[regiaoExiste] ( @mestreNome ) não existe!''
          IF  [geo].[regiaoExiste] ( @mestreNome ) = 1
          BEGIN
            SET @erroNumero = 2
            SET @mensagem = ''Execução: [geo].[regiaoId] ( @mestreNome ) não encontrado!''
            SET @regId = [geo].[regiaoId] ( @mestreNome )
            IF  @regId != 0
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
                  SET @mensagem = ''Execução: [DataCorp].[geo].[nacaoRegiaoExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[nacaoRegiaoExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[nacoesRegioes] VALUES ( @regId , @nacId )''
                    INSERT
                      INTO  [geo].[nacoesRegioes]
                      (
                        regId
                      , nacId
                      )
                      VALUES
                      (
                        @regId
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
            PRINT ''[geo].[nacaoRegiaoInclui] não pode ser concluída. Rolling back transaction.''
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

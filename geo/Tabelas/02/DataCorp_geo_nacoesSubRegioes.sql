
--  mestreTabelaPrefixo           = subReg
--  mestreTabelaPrefixoMaiuscula  = SubReg
--  mestreTabelaNomeSingular      = subRegiao
--  mestreTabelaChave             = subRegId
--  mestreTabelaChaveAk           = subRegiaoNome
--  mestreFuncaoExiste            = subRegiaoExiste
--  mestreFuncaoId                = subRegiaoId
--  detalheTabelaPrefixo          = nac
--  detalheTabelaPrefixoMaiuscula = Nac
--  detalheTabelaNomeSingular     = nacao
--  detalheTabelaChave            = nacId
--  detalheTabelaChaveAk          = nacaoNome
--  detalheFuncaoExiste           = nacaoExiste
--  detalheFuncaoId               = nacaoId
--  novaTabelaNomeSingular        = nacaoSubRegiao
--  novaTabelaPk                  = nacSubReg
--  novaTabelaPkNome              = nacSubRegPk
--  novaTabelaChave               = nacSubRegId
--  novaTabelaChaveMaiuscula      = NacSubRegId
--  novaTabelaNomePrefixo         = nacSubReg
--  novaTabelaIxAkNome            = nacSubRegIxAk
--  novaTabelaIxFkMestreNome      = nacSubRegIxFkSubReg
--  novaTabelaFkMestreNome        = nacSubRegFkSubReg
--  novaTabelaIxFkDetalheNome     = nacSubRegIxFk
--  novaTabelaFkDetalheNome       = nacSubRegFk
--  novaTabelaFuncaoInclui        = nacaoSubRegiaoInclui

/*
* TABELA: [DataCorp].[geo].[nacoesSubRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFkSubReg] >>>'
  IF OBJECT_ID('[geo].[nacSubRegFkSubReg]') IS NOT NULL
    ALTER TABLE [geo].[nacoesSubRegioes]
      DROP CONSTRAINT [nacSubRegFkSubReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFk] >>>'
  IF OBJECT_ID('[geo].[nacSubRegFk]') IS NOT NULL
    ALTER TABLE [geo].[nacoesSubRegioes]
      DROP CONSTRAINT [nacSubRegFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[nacoesSubRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'nacoesSubRegioes' )
  BEGIN
    DROP TABLE [geo].[nacoesSubRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[nacoesSubRegioes]
  (

    [nacSubRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [nacoesSubRegioesNacSubRegIdNn] NOT NULL

  , [subRegId]
      BIGINT
      CONSTRAINT [nacoesSubRegioesSubRegIdNn] NOT NULL

  , [nacId]
      BIGINT
      CONSTRAINT [nacoesSubRegioesNacIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegPk] >>>'
  ALTER TABLE [geo].[nacoesSubRegioes]
    ADD CONSTRAINT [nacSubRegPk]
      PRIMARY KEY CLUSTERED
      (
        [nacSubRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxAk')
  BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxAk] >>>'
  CREATE UNIQUE INDEX [nacSubRegIxAk]
    ON [geo].[nacoesSubRegioes]
    (
      [subRegId]
    , [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxFkSubReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxFkSubReg')
  BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxFkSubReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [nacSubRegIxFkSubReg]
    ON [geo].[nacoesSubRegioes]
    (
      [subRegId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFkSubReg] >>>'
  ALTER TABLE [geo].[nacoesSubRegioes]
    ADD CONSTRAINT [nacSubRegFkSubReg]
    FOREIGN KEY
    (
      [subRegId]
    )
    REFERENCES [DataCorp].[geo].[subRegioes]
    (
      [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxFk')
  BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [nacSubRegIxFk]
    ON [geo].[nacoesSubRegioes]
    (
      [nacId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoSubRegiaoExiste]      >>>'
  IF OBJECT_ID('[geo].[nacaoSubRegiaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[nacaoSubRegiaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoSubRegiaoExiste]
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
          FROM       [DataCorp].[geo].[subRegioes] mestre
          INNER JOIN [DataCorp].[geo].[nacoesSubRegioes] nova
            ON  nova.subRegId = mestre.subRegId
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[nacaoSubRegiaoId]          >>>'
  IF OBJECT_ID('[geo].[nacaoSubRegiaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[nacaoSubRegiaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[nacaoSubRegiaoId]
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
        SELECT  @ID = nova.nacSubRegId
          FROM       [DataCorp].[geo].[subRegioes] mestre
          INNER JOIN [DataCorp].[geo].[nacoesSubRegioes] nova
            ON  nova.subRegId = mestre.subRegId
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[nacoesSubRegioes].[nacSubRegFk] >>>'
  ALTER TABLE [geo].[nacoesSubRegioes]
    ADD CONSTRAINT [nacSubRegFk]
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
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[nacaoSubRegiaoInclui]      >>>'
  IF OBJECT_ID('[geo].[nacaoSubRegiaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[nacaoSubRegiaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[nacaoSubRegiaoInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  INTEGER
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @subRegId  INTEGER
      DECLARE @nacId INTEGER
      DECLARE @erroNumero            INTEGER
      DECLARE @mensagem              VARCHAR(100)
      IF  @mestreNome  IS NOT NULL
      AND @detalheNome IS NOT NULL
      BEGIN
        BEGIN TRANSACTION ;
        BEGIN TRY
          SET @erroNumero = 1
          SET @mensagem = ''Execução: [geo].[subRegiaoExiste] ( @mestreNome ) não existe!''
          IF  [geo].[subRegiaoExiste] ( @mestreNome ) = 1
          BEGIN
            SET @erroNumero = 2
            SET @mensagem = ''Execução: [geo].[subRegiaoId] ( @mestreNome ) não encontrado!''
            SET @subRegId = [geo].[subRegiaoId] ( @mestreNome )
            IF  @subRegId != 0
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
                  SET @mensagem = ''Execução: [DataCorp].[geo].[nacaoSubRegiaoExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[nacaoSubRegiaoExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[nacoesSubRegioes] VALUES ( @subRegId , @nacId )''
                    INSERT
                      INTO  [geo].[nacoesSubRegioes]
                      (
                        subRegId
                      , nacId
                      )
                      VALUES
                      (
                        @subRegId
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
            PRINT ''[geo].[nacaoSubRegiaoInclui] não pode ser concluída. Rolling back transaction.''
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

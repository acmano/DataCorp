
--  mestreTabelaPrefixo           = reg
--  mestreTabelaPrefixoMaiuscula  = Reg
--  mestreTabelaNomeSingular      = regiao
--  mestreTabelaChave             = regId
--  mestreTabelaChaveAk           = regiaoNome
--  mestreFuncaoExiste            = regiaoExiste
--  mestreFuncaoId                = regiaoId
--  detalheTabelaPrefixo          = subReg
--  detalheTabelaPrefixoMaiuscula = SubReg
--  detalheTabelaNomeSingular     = subRegiao
--  detalheTabelaChave            = subRegId
--  detalheTabelaChaveAk          = subRegiaoNome
--  detalheFuncaoExiste           = subRegiaoExiste
--  detalheFuncaoId               = subRegiaoId
--  novaTabelaNomeSingular        = subRegiaoRegiao
--  novaTabelaPk                  = subRegReg
--  novaTabelaPkNome              = subRegRegPk
--  novaTabelaChave               = subRegRegId
--  novaTabelaChaveMaiuscula      = SubRegRegId
--  novaTabelaNomePrefixo         = subRegReg
--  novaTabelaIxAkNome            = subRegRegIxAk
--  novaTabelaIxFkMestreNome      = subRegRegIxFkReg
--  novaTabelaFkMestreNome        = subRegRegFkReg
--  novaTabelaIxFkDetalheNome     = subRegRegIxFk
--  novaTabelaFkDetalheNome       = subRegRegFk
--  novaTabelaFuncaoInclui        = subRegiaoRegiaoInclui

/*
* TABELA: [DataCorp].[geo].[subRegioesRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFkReg] >>>'
  IF OBJECT_ID('[geo].[subRegRegFkReg]') IS NOT NULL
    ALTER TABLE [geo].[subRegioesRegioes]
      DROP CONSTRAINT [subRegRegFkReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFk] >>>'
  IF OBJECT_ID('[geo].[subRegRegFk]') IS NOT NULL
    ALTER TABLE [geo].[subRegioesRegioes]
      DROP CONSTRAINT [subRegRegFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[subRegioesRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'subRegioesRegioes' )
  BEGIN
    DROP TABLE [geo].[subRegioesRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[subRegioesRegioes]
  (

    [subRegRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [subRegioesRegioesSubRegRegIdNn] NOT NULL

  , [regId]
      BIGINT
      CONSTRAINT [subRegioesRegioesRegIdNn] NOT NULL

  , [subRegId]
      BIGINT
      CONSTRAINT [subRegioesRegioesSubRegIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegPk] >>>'
  ALTER TABLE [geo].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegPk]
      PRIMARY KEY CLUSTERED
      (
        [subRegRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioesRegioes') AND name='subRegRegIxAk')
  BEGIN
    DROP INDEX [geo].[subRegioesRegioes].[subRegRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxAk] >>>'
  CREATE UNIQUE INDEX [subRegRegIxAk]
    ON [geo].[subRegioesRegioes]
    (
      [regId]
    , [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxFkReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioesRegioes') AND name='subRegRegIxFkReg')
  BEGIN
    DROP INDEX [geo].[subRegioesRegioes].[subRegRegIxFkReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [subRegRegIxFkReg]
    ON [geo].[subRegioesRegioes]
    (
      [regId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFkReg] >>>'
  ALTER TABLE [geo].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegFkReg]
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
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[subRegioesRegioes].[subRegRegIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioesRegioes') AND name='subRegRegIxFk')
  BEGIN
    DROP INDEX [geo].[subRegioesRegioes].[subRegRegIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [subRegRegIxFk]
    ON [geo].[subRegioesRegioes]
    (
      [subRegId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[subRegiaoRegiaoExiste]      >>>'
  IF OBJECT_ID('[geo].[subRegiaoRegiaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[subRegiaoRegiaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[subRegiaoRegiaoExiste]
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
          FROM       [DataCorp].[geo].[regioes] mestre
          INNER JOIN [DataCorp].[geo].[subRegioesRegioes] nova
            ON  nova.regId = mestre.regId
          INNER JOIN [DataCorp].[geo].[subRegioes] detalhe
            ON  detalhe.subRegId = nova.subRegId
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[subRegiaoRegiaoId]          >>>'
  IF OBJECT_ID('[geo].[subRegiaoRegiaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[subRegiaoRegiaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[subRegiaoRegiaoId]
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
        SELECT  @ID = nova.subRegRegId
          FROM       [DataCorp].[geo].[regioes] mestre
          INNER JOIN [DataCorp].[geo].[subRegioesRegioes] nova
            ON  nova.regId = mestre.regId
          INNER JOIN [DataCorp].[geo].[subRegioes] detalhe
            ON  detalhe.subRegId = nova.subRegId
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[subRegioesRegioes].[subRegRegFk] >>>'
  ALTER TABLE [geo].[subRegioesRegioes]
    ADD CONSTRAINT [subRegRegFk]
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

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[subRegiaoRegiaoInclui]      >>>'
  IF OBJECT_ID('[geo].[subRegiaoRegiaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[subRegiaoRegiaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[subRegiaoRegiaoInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @regId  INTEGER
      DECLARE @subRegId INTEGER
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
              SET @mensagem = ''Execução: [geo].[subRegiaoExiste] ( @detalheNome ) não existe!''
              IF  [geo].[subRegiaoExiste] ( @detalheNome ) = 1
              BEGIN
                SET @erroNumero = 4
                SET @mensagem = ''Execução: [geo].[subRegiaoId] ( @detalheNome ) não encontrado!''
                SET @subRegId = [geo].[subRegiaoId] ( @detalheNome )
                IF  @subRegId != 0
                BEGIN
                  SET @erroNumero = 5
                  SET @mensagem = ''Execução: [DataCorp].[geo].[subRegiaoRegiaoExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[subRegiaoRegiaoExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[subRegioesRegioes] VALUES ( @regId , @subRegId )''
                    INSERT
                      INTO  [geo].[subRegioesRegioes]
                      (
                        regId
                      , subRegId
                      )
                      VALUES
                      (
                        @regId
                      , @subRegId
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
            PRINT ''[geo].[subRegiaoRegiaoInclui] não pode ser concluída. Rolling back transaction.''
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

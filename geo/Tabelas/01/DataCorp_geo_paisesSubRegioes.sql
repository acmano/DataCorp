
--  mestreTabelaPrefixo           = subReg
--  mestreTabelaPrefixoMaiuscula  = SubReg
--  mestreTabelaNomeSingular      = subRegiao
--  mestreTabelaChave             = subRegId
--  mestreTabelaChaveAk           = subRegiaoNome
--  mestreFuncaoExiste            = subRegiaoExiste
--  mestreFuncaoId                = subRegiaoId
--  detalheTabelaPrefixo          = pai
--  detalheTabelaPrefixoMaiuscula = Pai
--  detalheTabelaNomeSingular     = pais
--  detalheTabelaChave            = paiId
--  detalheTabelaChaveAk          = paisNome
--  detalheFuncaoExiste           = paisExiste
--  detalheFuncaoId               = paisId
--  novaTabelaNomeSingular        = paisSubRegiao
--  novaTabelaPk                  = paiSubReg
--  novaTabelaPkNome              = paiSubRegPk
--  novaTabelaChave               = paiSubRegId
--  novaTabelaChaveMaiuscula      = PaiSubRegId
--  novaTabelaNomePrefixo         = paiSubReg
--  novaTabelaIxAkNome            = paiSubRegIxAk
--  novaTabelaIxFkMestreNome      = paiSubRegIxFkSubReg
--  novaTabelaFkMestreNome        = paiSubRegFkSubReg
--  novaTabelaIxFkDetalheNome     = paiSubRegIxFk
--  novaTabelaFkDetalheNome       = paiSubRegFk
--  novaTabelaFuncaoInclui        = paisSubRegiaoInclui

/*
* TABELA: [DataCorp].[geo].[paisesSubRegioes]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFkSubReg] >>>'
  IF OBJECT_ID('[geo].[paiSubRegFkSubReg]') IS NOT NULL
    ALTER TABLE [geo].[paisesSubRegioes]
      DROP CONSTRAINT [paiSubRegFkSubReg]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFk] >>>'
  IF OBJECT_ID('[geo].[paiSubRegFk]') IS NOT NULL
    ALTER TABLE [geo].[paisesSubRegioes]
      DROP CONSTRAINT [paiSubRegFk]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[geo].[paisesSubRegioes] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'geo' AND tabela.name = 'paisesSubRegioes' )
  BEGIN
    DROP TABLE [geo].[paisesSubRegioes]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [geo].[paisesSubRegioes]
  (

    [paiSubRegId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [paisesSubRegioesPaiSubRegIdNn] NOT NULL

  , [subRegId]
      BIGINT
      CONSTRAINT [paisesSubRegioesSubRegIdNn] NOT NULL

  , [paiId]
      BIGINT
      CONSTRAINT [paisesSubRegioesPaiIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegPk] >>>'
  ALTER TABLE [geo].[paisesSubRegioes]
    ADD CONSTRAINT [paiSubRegPk]
      PRIMARY KEY CLUSTERED
      (
        [paiSubRegId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxAk')
  BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxAk] >>>'
  CREATE UNIQUE INDEX [paiSubRegIxAk]
    ON [geo].[paisesSubRegioes]
    (
      [subRegId]
    , [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxFkSubReg] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxFkSubReg')
  BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxFkSubReg]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [paiSubRegIxFkSubReg]
    ON [geo].[paisesSubRegioes]
    (
      [subRegId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFkSubReg] >>>'
  ALTER TABLE [geo].[paisesSubRegioes]
    ADD CONSTRAINT [paiSubRegFkSubReg]
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
  SET @mensagemP4 = 'Index       [DataCorp].[geo].[paisesSubRegioes].[paiSubRegIxFk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxFk')
  BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxFk]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [paiSubRegIxFk]
    ON [geo].[paisesSubRegioes]
    (
      [paiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[paisSubRegiaoExiste]      >>>'
  IF OBJECT_ID('[geo].[paisSubRegiaoExiste]', 'FN') IS NOT NULL
  BEGIN
    DROP FUNCTION [geo].[paisSubRegiaoExiste]
  END
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[paisSubRegiaoExiste]
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
          FROM       [DataCorp].[geo].[subRegioes] mestre
          INNER JOIN [DataCorp].[geo].[paisesSubRegioes] nova
            ON  nova.subRegId = mestre.subRegId
          INNER JOIN [DataCorp].[geo].[paises] detalhe
            ON  detalhe.paiId = nova.paiId
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
  SET @mensagemP4 = 'Function    [DataCorp].[geo].[paisSubRegiaoId]          >>>'
  IF OBJECT_ID('[geo].[paisSubRegiaoId]', 'FN') IS NOT NULL
  BEGIN
    DROP   FUNCTION [geo].[paisSubRegiaoId]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 14
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE FUNCTION [geo].[paisSubRegiaoId]
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
        SELECT  @ID = nova.paiSubRegId
          FROM       [DataCorp].[geo].[subRegioes] mestre
          INNER JOIN [DataCorp].[geo].[paisesSubRegioes] nova
            ON  nova.subRegId = mestre.subRegId
          INNER JOIN [DataCorp].[geo].[paises] detalhe
            ON  detalhe.paiId = nova.paiId
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[geo].[paisesSubRegioes].[paiSubRegFk] >>>'
  ALTER TABLE [geo].[paisesSubRegioes]
    ADD CONSTRAINT [paiSubRegFk]
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

  SET @erro = 12
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Procedure   [DataCorp].[geo].[paisSubRegiaoInclui]      >>>'
  IF OBJECT_ID('[geo].[paisSubRegiaoInclui]', 'P') IS NOT NULL
  BEGIN
    DROP   PROCEDURE [geo].[paisSubRegiaoInclui]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + convert ( varchar(20), @erro ) + ' - ' + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 13
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  EXEC ('
    CREATE PROCEDURE [geo].[paisSubRegiaoInclui]
    (
      @mestreNome   VARCHAR(64)
    , @detalheNome  VARCHAR(64)
    )
    AS
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN
      DECLARE @subRegId  INTEGER
      DECLARE @paiId INTEGER
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
              SET @mensagem = ''Execução: [geo].[paisExiste] ( @detalheNome ) não existe!''
              IF  [geo].[paisExiste] ( @detalheNome ) = 1
              BEGIN
                SET @erroNumero = 4
                SET @mensagem = ''Execução: [geo].[paisId] ( @detalheNome ) não encontrado!''
                SET @paiId = [geo].[paisId] ( @detalheNome )
                IF  @paiId != 0
                BEGIN
                  SET @erroNumero = 5
                  SET @mensagem = ''Execução: [DataCorp].[geo].[paisSubRegiaoExiste] ( @mestreNome, @detalheNome )''
                  IF  [DataCorp].[geo].[paisSubRegiaoExiste] ( @mestreNome, @detalheNome ) = 0
                  BEGIN
                    SET @erroNumero = 6
                    SET @mensagem = ''Execução: INSERT INTO  [geo].[paisesSubRegioes] VALUES ( @subRegId , @paiId )''
                    INSERT
                      INTO  [geo].[paisesSubRegioes]
                      (
                        subRegId
                      , paiId
                      )
                      VALUES
                      (
                        @subRegId
                      , @paiId
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
            PRINT ''[geo].[paisSubRegiaoInclui] não pode ser concluída. Rolling back transaction.''
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
